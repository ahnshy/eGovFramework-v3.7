<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/mpm.css' />" type="text/css">
<title>안전행전부 공통서비스 테스트 사이트(일반사용자)</title>
<script type="text/javascript">
	var getContextPath = "${pageContext.request.contextPath}";
</script>
<script language="javascript" src="<c:url value='/js/egovframework/com/main.js' />"></script>
<script language="javascript">
	function chk_all(val) {

		var arr_chk = document.getElementsByName("chk");

		if (val == "Y") {

			for (i = 0; i < arr_chk.length; i++) {
				arr_chk[i].checked = true;
			}
		} else if (val == "N") {
			for (i = 0; i < arr_chk.length; i++) {
				arr_chk[i].checked = false;
			}
		}

	}
</script>
</head>
<body topmargin="0" leftmargin="0">
    <c:import url="./headG.jsp" />
    <div style='margin: 0'>
        <table width="900" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <!-- 본문시작 -->
                <td valign="top">
                    <TABLE>
                        <TR>
                            <TD width="450">
                                <TABLE>
                                    <TR>
                                        <TD>
                                            <table width="450" border="0" cellspacing="0" cellpadding="0" style="">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" border="0"></td>
                                                                <td>진행중인 설문</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr height="120" width="430">
                                                    <td bgcolor="#B6D58F" align="center">
                                                        <table border="0" bgcolor="FFFFFF" width="430">
                                                            <tr height="100">
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </TD>
                                    </TR>
                                    </TR>
                                    <tr height="10">
                                        <td>&nbsp;</td>
                                    </tr>
                                    <TR>
                                        <TD>
                                            <table width="450" border="0" cellspacing="0" cellpadding="0" style="">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" border="0"></td>
                                                                <td>가입한 커뮤니티 목록</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr height="120" width="430">
                                                    <td bgcolor="#B6D58F" align="center">
                                                        <table border="0" bgcolor="FFFFFF" width="430">
                                                            <tr height="100">
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </TD>
                                    </TR>
                                    </TR>
                                    <tr height="10">
                                        <td>&nbsp;</td>
                                    </tr>
                                    <TR>
                                        <TD>
                                            <table width="450" border="0" cellspacing="0" cellpadding="0" style="">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" border="0"></td>
                                                                <td>등록한 Q&A</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr height="120" width="450">
                                                    <td bgcolor="#B6D58F" align="center">
                                                        <table border="0" bgcolor="FFFFFF" width="430">
                                                            <tr height="100">
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </TD>
                                    </TR>
                                </TABLE>
                            </TD>
                            <TD width="450">
                                <TABLE>
                                    <TR>
                                        <TD>
                                            <table width="450" border="0" cellspacing="0" cellpadding="0" style="">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" border="0"></td>
                                                                <td>등록한 상담 목록</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr height="185" width="450">
                                                    <td bgcolor="#B6D58F" align="center">
                                                        <table border="0" bgcolor="FFFFFF" width="430">
                                                            <tr height="165">
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </TD>
                                    </TR>
                                    <tr height="10">
                                        <td>&nbsp;</td>
                                    </tr>
                                    <TR>
                                        <TD>
                                            <table width="450" border="0" cellspacing="0" cellpadding="0" style="">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" border="0"></td>
                                                                <td>사이트 들겨찾기 목록</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr height="185" width="450">
                                                    <td bgcolor="#B6D58F" align="center">
                                                        <table border="0" bgcolor="FFFFFF" width="430">
                                                            <tr height="165">
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </TD>
                                    </TR>
                                </TABLE>
                            </TD>
                        </TR>
                    </TABLE>
                </td>
            </tr>
        </table>
        <!-- bottom -->
        <c:import url="./main_bottom.jsp" />
    </div>
</body>
</html>
