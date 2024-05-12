package egovframework.com.cmm.exception;

import egovframework.rte.fdl.cmmn.exception.BaseRuntimeException;

/**
 * EgovXssException 클래스
 *
 * @author ahnshy
 * @since 2016.11.13
 * @version 1.0
 *
 */

public class EgovXssException extends BaseRuntimeException {
    
	private static final long serialVersionUID = 1L;
	 
	/**
	 * EgovXssException 생성자.
	 * 
	 * @param defaultMessage 메세지 지정
	 * @param wrappedException 원인 Exception
	 */
	public EgovXssException(String message, String messageKey) {
		this.messageKey = messageKey;
		this.messageParameters = null;
		this.message = message;
		this.wrappedException = null;
	}

}
