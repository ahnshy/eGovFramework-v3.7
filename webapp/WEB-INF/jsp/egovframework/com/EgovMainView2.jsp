<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/mpm.css' />" type="text/css">
<title>안전행전부 공통서비스 테스트 사이트(기업사용자)</title>
<script type="text/javascript">
var getContextPath = "${pageContext.request.contextPath}";
</script>
<script language="javascript" src="<c:url value='/js/egovframework/com/main.js' />"></script>
<script language="javascript">
function chk_all(val) {

	var arr_chk = document.getElementsByName("chk");

		if (val == "Y") {

			for(i=0;i< arr_chk.length; i++) {
				arr_chk[i].checked =true;
			}
		}
		else if(val == "N") {
			for(i=0;i< arr_chk.length; i++) {
				arr_chk[i].checked =false;
			}
		}
/*
 * topmargin="0" leftmargin="0"
	 style='margin:0'

 */
}


</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight= "0">
<c:import url="./head.jsp" />
<div style='margin:0'>
<table width="981" border="0" cellspacing="0" cellpadding="0">
    <tr>
<!-- 본문시작 -->
    <td valign="top" align="center">
    	<TABLE>
			<TR>
				<TD width="800" align="center" height="500" valign="top">
					<iframe width="100%" height="100%" name="vew" id="vew" title="마이페이지 보기"  src = "<c:url value='/uss/mpe/selectIndvdlpgeResult.do'/>" frameborder="0" marginwidth="0" marginheight="0" scrolling="yes">
	    			</iframe>
				</TD>
			</TR>
			</TABLE>
    </td>
        </tr>
        </table>
<!-- 배너추가 -->
<table border="0" cellspacing="0" cellpadding="0" width="981">
  <tr>
    <td align="center">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center">
                <c:import url="/uss/ion/bnr/getBannerImage.do" charEncoding="utf-8">
                    <c:param name="atchFileId" value="${banner.bannerImageFile}" />
                </c:import>
            </td>
          </tr>
        </table>
    </td>
  </tr>
</table>
<!-- 배너추가 -->

<!-- bottom -->
<c:import url="./main_bottom.jsp" />
</div>
</body>
</html>
