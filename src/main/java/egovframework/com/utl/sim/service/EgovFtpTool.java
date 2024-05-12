/**
 *  Class Name : EgovFtpTool.java
 *  Description : FTP Client - Server간 파일 송수신 기능을 제공하는 Business class
 *  Modification Information
 *
 *     수정일         수정자                   수정내용
 *   -------    --------    ---------------------------
 *   2009.02.06    박지욱          최초 생성
 *
 *  @author 공통 서비스 개발팀 박지욱
 *  @since 2009. 02. 06
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
package egovframework.com.utl.sim.service;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

import egovframework.com.cmm.util.EgovBasicLogger;
import egovframework.com.cmm.util.EgovResourceCloseHelper;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

public class EgovFtpTool {

	// ASC-II 전송 모드
	public static final int ASCII_MODE = FTP.ASCII_FILE_TYPE;

	// 이진 전송 모드
	public static final int BINARY_MODE = FTP.BINARY_FILE_TYPE;
	public static final String FTP_CHARACTER_ENCODING = "UTF-8";

	// 파일구분자
	static final char FILE_SEPARATOR = File.separatorChar;

	// Log
	//protected static final Log log = LogFactory.getLog(EgovFtpTool.class);

	/**
	 * FTP 서버로부터 파일을 수신 하는 기능
	 * @param String ftp_ip 아이피
	 * @param int ftp_port 포트
	 * @param String ftp_id 아이디
	 * @param String ftp_pw 비밀번호
	 * @param String remote 수신할 파일명
	 * @return boolean result 수신성공여부 True/False
	 * @exception Exception
	*/
	public static boolean getFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, String remote) throws Exception {

		return getFile(ftp_ip, ftp_port, ftp_id, ftp_pw, ASCII_MODE, remote, null);
	}

	/**
	 * FTP 서버로부터 파일을 수신 하는 기능
	 * @param String ftp_ip 아이피
	 * @param int ftp_port 포트
	 * @param String ftp_id 아이디
	 * @param String ftp_pw 비밀번호
	 * @param int ftp_mode 전송모드(ASCII, BINARY)
	 * @param String remote 수신할 파일명
	 * @return boolean result 수신성공여부 True/False
	 * @exception Exception
	*/
	public static boolean getFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode, String remote) throws Exception {

		return getFile(ftp_ip, ftp_port, ftp_id, ftp_pw, ftp_mode, remote, null);
	}

	/**
	 * FTP 서버로부터 파일을 수신 하는 기능
	 * @param String ftp_ip 아이피
	 * @param int ftp_port 포트
	 * @param String ftp_id 아이디
	 * @param String ftp_pw 비밀번호
	 * @param int ftp_mode 전송모드(ASCII, BINARY)
	 * @param String remote 수신할 파일명
	 * @param String local 전송받을 파일명
	 * @return boolean result 수신성공여부 True/False
	 * @exception Exception
	*/
	public static boolean getFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode, String remote, String local) throws Exception {

		// 수신결과
		boolean result = false;

		FTPClient ftpClient = null;
		FileOutputStream out = null;
		try {

			// 1. 연결시작
			ftpClient = new FTPClient();
			if (!connect(ftpClient, ftp_ip, ftp_port, ftp_id, ftp_pw, ftp_mode))
				return false;

			// 2. FTP 서버의 작업할 디렉토리로 이동
			String[] ser_path = splitPathAndName(remote, "/");
			String path = ser_path[0];
			String name = ser_path[1];
			if (!ftpClient.changeWorkingDirectory(path))
				return false;

			// 3. 파일 수신 준비
			String loc = "";
			if (local == null || "".equals(local)) {
				loc = path + FILE_SEPARATOR + name;
			} else {
				loc = local;
			}
			loc = loc.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
			loc = EgovFileTool.createNewFile(loc);
			File tarFile = new File(loc);
			out = new FileOutputStream(tarFile);

			// 4. 파일 수신 수행
			result = ftpClient.retrieveFile(name, out);

		} finally {
			try {
				disconnect(ftpClient);
			} catch (Exception ignore) {
				EgovBasicLogger.ignore("FTP disconnect error", ignore);
			}
			EgovResourceCloseHelper.close(out);
		}

		return result;
	}

	/**
	 * FTP 서버로부터 파일을 읽어 byte[] 로 반환하는 기능
	 * @param String ftp_ip 아이피
	 * @param int ftp_port 포트
	 * @param String ftp_id 아이디
	 * @param String ftp_pw 비밀번호
	 * @param int ftp_mode 전송모드(ASCII, BINARY)
	 * @param String remote 수신할 파일명
	 * @param String local 수신받을 파일명
	 * @return byte[] buffer 실제파일데이터
	 * @exception Exception
	*/
	public static byte[] getFileAsByte(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode, String remote, String local) throws Exception {

		// 수신결과
		byte[] outByte = null;
		boolean result = false;

		FTPClient ftpClient = null;
		ByteArrayOutputStream out = null;

		try {

			// 1. 연결시작
			ftpClient = new FTPClient();
			result = connect(ftpClient, ftp_ip, ftp_port, ftp_id, ftp_pw, ftp_mode);
			if (!result) {
				return outByte;
			}

			// 2. FTP 서버의 작업할 디렉토리로 이동
			String[] ser_path = splitPathAndName(remote, "/");
			String path = ser_path[0];
			String name = ser_path[1];
			result = ftpClient.changeWorkingDirectory(path);
			if (!result) {
				return outByte;
			}

			// 3. 파일 수신 수행
			out = new ByteArrayOutputStream();
			
			result = ftpClient.retrieveFile(name, out);
			if (!result) {
				return outByte;
			}

			// 4. byte[] 결과
			if (out != null) {
				outByte = out.toByteArray();
			}

		} finally {
			try {
				disconnect(ftpClient);
			} catch (Exception ignore) {
				EgovBasicLogger.ignore("FTP disconnection error", ignore);
			}
			EgovResourceCloseHelper.close(out);
		}
		return outByte;
	}

	/**
	 * FTP 서버로 파일을 송신 하는 기능
	 * @param String ftp_ip 아이피
	 * @param int ftp_port 포트
	 * @param String ftp_id 아이디
	 * @param String ftp_pw 비밀번호
	 * @param String local 송신할 파일명
	 * @return boolean result 송신성공여부 True/False
	 * @exception Exception
	*/
	public static boolean sendFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, String local) throws Exception {

		return sendFile(ftp_ip, ftp_port, ftp_id, ftp_pw, ASCII_MODE, local, null);
	}

	/**
	 * FTP 서버로 파일을 송신 하는 기능
	 * @param String ftp_ip 아이피
	 * @param int ftp_port 포트
	 * @param String ftp_id 아이디
	 * @param String ftp_pw 비밀번호
	 * @param int ftp_mode 전송모드(ASCII, BINARY)
	 * @param String local 송신할 파일명
	 * @return boolean result 송신성공여부 True/False
	 * @exception Exception
	*/
	public static boolean sendFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode, String local) throws Exception {

		return sendFile(ftp_ip, ftp_port, ftp_id, ftp_pw, ftp_mode, local, null);
	}

	/**
	 * FTP 서버로 파일을 송신 하는 기능
	 * @param String ftp_ip 아이피
	 * @param int ftp_port 포트
	 * @param String ftp_id 아이디
	 * @param String ftp_pw 비밀번호
	 * @param int ftp_mode 전송모드(ASCII, BINARY)
	 * @param String local 송신할 파일명
	 * @param String remote 송신될 파일명
	 * @return boolean result 송신성공여부 True/False
	 * @exception Exception
	*/
	public static boolean sendFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode, String local, String remote) throws Exception {

		// 송신결과
		boolean result = false;

		FTPClient ftpClient = null;
		FileInputStream in = null;
		try {

			// 1. 송신 파일 확인
			String loc = local.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
			File srcFile = new File(loc);
			if (!srcFile.exists()) {
				//log.debug("+++ File Not Found To Transport..");
				return false;
			}

			// 2. 연결시작
			ftpClient = new FTPClient();
			if (!connect(ftpClient, ftp_ip, ftp_port, ftp_id, ftp_pw, ftp_mode))
				return false;

			// 3. 파일 송신 준비
			String[] ser_path = splitPathAndName(remote, "/");
			String path = ser_path[0];
			String name = ser_path[1];
			changeRemoteDrctry(ftpClient, path);

			// 4. 파일 송신 수행
			in = new FileInputStream(srcFile);
			result = ftpClient.storeFile(name, in);

		} finally {
			try {
				disconnect(ftpClient);
			} catch (Exception ignore) {
				EgovBasicLogger.ignore("FTP disconnection error", ignore);
			}
			EgovResourceCloseHelper.close(in);
		}
		return result;
	}

	/**
	 * FTP 서버로 데이터(InputStream)를 송신 하는 기능
	 * @param String ftp_ip 아이피
	 * @param int ftp_port 포트
	 * @param String ftp_id 아이디
	 * @param String ftp_pw 비밀번호
	 * @param int ftp_mode 전송모드(ASCII, BINARY)
	 * @param String local 송신할 파일명
	 * @param String remote 송신될 파일명
	 * @return boolean result 송신성공여부 True/False
	 * @exception Exception
	*/
	public static boolean sendFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode, InputStream data, String remote) throws Exception {

		// 송신결과
		boolean result = false;

		FTPClient ftpClient = null;
		FileInputStream in = null;
		try {

			// 1. 송신 파일 확인
			if (data == null) {
				//log.debug("+++ Data Not Found To Transport..");
				return false;
			}

			// 2. 연결시작
			ftpClient = new FTPClient();
			if (!connect(ftpClient, ftp_ip, ftp_port, ftp_id, ftp_pw, ftp_mode))
				return false;

			// 3. 파일 송신 준비
			String[] ser_path = splitPathAndName(remote, "/");
			String path = ser_path[0];
			String name = ser_path[1];
			changeRemoteDrctry(ftpClient, path);

			// 4. 파일 송신 수행
			result = ftpClient.storeFile(name, data);

		} finally {
			try {
				disconnect(ftpClient);
			} catch (Exception ignore) {
				EgovBasicLogger.ignore("FTP disconnection error", ignore);
			}
			EgovResourceCloseHelper.close(in);
		}
		return result;
	}

	/**
	 * FTP 클라이언트 연결 기능
	 * @param FTPClient ftpClient FTP 클라이언트 객체
	 * @param String ftp_ip 아이피
	 * @param int ftp_port 포트
	 * @param String ftp_id 아이디
	 * @param String ftp_pw 비밀번호
	 * @param int ftp_ssmode 전송 모드
	 * @return boolean result 연결성공여부 True/False
	 * @exception Exception
	*/
	public static boolean connect(FTPClient ftpClient, String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode) throws Exception {

		boolean result = false;

		//ftpClient.setControlEncoding("UTF-8");

		ftpClient.connect(ftp_ip, ftp_port);
		int reply = ftpClient.getReplyCode();

		if (!FTPReply.isPositiveCompletion(reply)) {
			return false;
		}

		result = ftpClient.login(ftp_id, ftp_pw);
		if (!result) {
			return false;
		}

		ftpClient.enterLocalPassiveMode();
		ftpClient.setFileType(ftp_mode);

		return result;
	}

	/**
	 * FTP 클라이언트 연결 종료 기능
	 * @param FTPClient ftpClient FTP 클라이언트 객체
	 * @exception Exception
	*/
	public static void disconnect(FTPClient ftpClient) throws Exception {
		if (ftpClient != null && ftpClient.isConnected()) {
			ftpClient.disconnect();
		}
	}

	/**
	 * FTP 서버의 디렉토리로 이동하는 기능
	 * @param FTPClient ftpClient FTP 클라이언트 객체
	 * @param String remote_drctry 이동할 디렉토리
	 * @return boolean result 디렉토리이동여부 True/False
	 * @exception Exception
	*/
	public static boolean changeRemoteDrctry(FTPClient ftpClient, String remote_drctry) throws Exception {

		boolean result = false;

		if (ftpClient.changeWorkingDirectory(remote_drctry)) {
			result = true;
		} else {
			// 디렉토리가 없는 경우, 디렉토리를 만든다.
			String[] arr = remote_drctry.split("" + FILE_SEPARATOR);
			for (int i = 0; i < arr.length; i++) {
				ftpClient.makeDirectory(arr[i]);
				if (!ftpClient.changeWorkingDirectory(arr[i])) {
					return false;
				}
			}
			result = true;
		}

		return result;
	}

	/**
	 * 파일명이 포함된 전체경로를 주면 파일경로와 파일명으로 분리
	 * @param String fullpath 전체경로
	 * @return String[] path 파일경로[0], 파일명[1]
	 * @exception Exception
	*/
	public static String[] splitPathAndName(String path, String fileSep) {

		String[] split = new String[2];
		if (path == null || "".equals(path)) {
			split[0] = "";
			split[1] = "";
		} else {
			int lastIndex = path.lastIndexOf(fileSep);
			if (lastIndex >= 0) {
				split[0] = path.substring(0, lastIndex);
				split[1] = path.substring(lastIndex + 1);
			} else {
				split[0] = "";
				split[1] = path;
			}
		}
		return split;
	}
}