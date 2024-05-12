<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="egovframework.com.cmm.service.Globals"  %>
<%
 /**
  * @Class Name : EgovMenuCreatSiteMap.jsp
  * @Description : 메뉴사이트맵 생성 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  * @ 2011.07.29  서준식          사이트맵 저장경로 수정
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */

  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/com/sym/mnu/mcm/icon/";
  String imagePath_button = "/images/egovframework/com/sym/mnu/mcm/button/";
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css">
<title>메뉴사이트맵생성</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript">
var imgpath = "<c:url value='/images/egovframework/com/cmm/utl/'/>";
var getContextPath = "${pageContext.request.contextPath}";
</script>
<script language="javascript1.2" type="text/javaScript" src="<c:url value='/js/egovframework/com/sym/mnu/mcm/EgovMenuCreatSiteMap.js' />"></script>
<script language="javascript1.2" type="text/javaScript">
<!--
/*절대 path 사이트맵이 저장될 장소의  절대 패스*/
//var vRootPath    = "C:/egovframework/workspace2/sym.mnu.mcm/src/main/webapp";   // Window webapp 위치
//var vRootPath    = "/product/jeus/webhome/was_com/egovframework-com-1_0/egovframework-com-1_0_war___"; // Unix webapp 위치
/* 절대 path내  사이트맵 jsp를 저장할 장소 지정 */
//var vSiteMapPath = "/html/egovframework/com/sym/mnu/mcm/";


/* ********************************************************
 * 조회 함수
 ******************************************************** */
function selectMenuCreatSiteMap() {
	document.menuCreatManageSiteMapForm.scrtyEstbstrgetId.value = opener.document.menuCreatManageForm.scrtyEstbstrgetId.value;
	document.menuCreatManageSiteMapForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatSiteMapSelect.do'/>";
    document.menuCreatManageSiteMapForm.submit();
}

/* ********************************************************
 * jsp 생성 함수
 ******************************************************** */
function CreatSiteMap() {
	fHtmlCreat_Head();
	usrID = document.menuCreatManageSiteMapForm.creatPersonId.value;
	authorCode = document.menuCreatManageSiteMapForm.authorCode.value;
	document.menuCreatManageSiteMapForm.valueHtml.value    = vHtmlCode;
	document.menuCreatManageSiteMapForm.bndeFileNm.value   = authorCode+"_SiteMap.jsp";
	//document.menuCreatManageSiteMapForm.tmp_rootPath.value = vRootPath;
	//document.menuCreatManageSiteMapForm.bndeFilePath.value = vSiteMapPath;
	document.menuCreatManageSiteMapForm.mapCreatId.value   = authorCode;
	document.menuCreatManageSiteMapForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatSiteMapInsert.do'/>";
    document.menuCreatManageSiteMapForm.submit();
}

/* ********************************************************
* 메뉴 호출 함수
******************************************************** */
function fCallUrl(url) {
	window.open(url,'dokdo','width=800,height=600,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=no,top=300,left=700');
}

<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:490px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->

<form name="menuCreatManageSiteMapForm" action ="<c:url value='/sym/mnu/mcm/EgovMenuCreatSiteMapSelect.do' />" method="post">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
<input name="valueHtml"      type="hidden" />
<input name="creatPersonId"  type="hidden" value ="${resultVO.creatPersonId}" />
<input name="bndeFileNm"     type="hidden" />
<input name="bndeFilePath"   type="hidden" />
<input name="mapCreatId"     type="hidden" />
<input name="tmp_rootPath"   type="hidden" />
<DIV id="main" style="display:">

<table width="490" cellpadding="8" class="table-search" border="0" align="center">
 <tr>
  <td width="40%"class="title_left">
  <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;메뉴사이트맵생성</h1></td>
  <td width="10%"></td>
  <td width="25%"></td>
  <th width="25%">
     <table border="0" cellspacing="0" cellpadding="0" align="right">
       <tr>
         <td width="10"></td>
		 <td><span class="button"><a href="#LINK" onclick="CreatSiteMap(); return false;">사이트맵생성</a></span></td>
         <td width="10"></td>
       </tr>
     </table>
  </th>
 </tr>
</table>

<table width="490" border="0" cellpadding="0" cellspacing="1" align="center">
 <tr>
  <td width="480">
    <table width="480" border="0" cellpadding="0" cellspacing="1" class="table-register">
      <tr>
        <th width="150" height="40" class="" scope="row"><label for="authorCode">권한코드&nbsp;</label></th>
        <td width="330"><input name="authorCode" type="text" size="20" value="${resultVO.authorCode}"  maxlength="30" readonly title="권한명"/>
        <input name="chkCreat" type="text" size="10" value="${resultBoolean.chkCreat}"  maxlength="10" readonly title="권한코드">
        </td>

      </tr>
    </table>
   </td>
 </tr>
</table>

<table width="490" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="10">
		<c:forEach var="result1" items="${list_menulist}" varStatus="status" >
		<input type="hidden" name="tmp_menuNmVal" value="${result1.menuNo}|${result1.upperMenuId}|${result1.menuNm}|${result1.menuOrdr}|${result1.chkURL}|">
		</c:forEach>
    </td>
  </tr>
</table>
<table width="490" cellpadding="8"  align="center" summary="메뉴사이트맵생성 메뉴목록" >
	<caption>메뉴사이트맵생성 </caption>
  <tr>
    <td>
    <div class="tree" style="width:480px;">
		<script language="javascript" type="text/javaScript">
		    var chk_Object = true;
		    var chk_browse = "";
			if (eval(document.menuCreatManageSiteMapForm.authorCode)=="[object]") chk_browse = "IE";
			if (eval(document.menuCreatManageSiteMapForm.authorCode)=="[object NodeList]") chk_browse = "Fox";
			if (eval(document.menuCreatManageSiteMapForm.authorCode)=="[object Collection]") chk_browse = "safai";

			var Tree = new Array;
			if(chk_browse=="IE"&&eval(document.menuCreatManageSiteMapForm.tmp_menuNmVal)!="[object]"){
			   alert("메뉴 목록 데이타가 존재하지 않습니다.");
			   chk_Object = false;
			}
			if(chk_browse=="Fox"&&eval(document.menuCreatManageSiteMapForm.tmp_menuNmVal)!="[object NodeList]"){
			   alert("메뉴 목록 데이타가 존재하지 않습니다.");
			   chk_Object = false;
			}
			if(chk_browse=="safai"&&eval(document.menuCreatManageSiteMapForm.tmp_menuNmVal)!="[object Collection]"){
				   alert("메뉴 목록 데이타가 존재하지 않습니다.");
				   chk_Object = false;
			}
			if( chk_Object ){
				for (var j = 0; j < document.menuCreatManageSiteMapForm.tmp_menuNmVal.length; j++) {
					Tree[j] = document.menuCreatManageSiteMapForm.tmp_menuNmVal[j].value;
			    }
			    createTree(Tree);
            }else{
                alert("사이트맵 생성 데이타가 존재하지 않습니다. \n 메뉴를 생성하신 후 작업하세요.");
                window.close();
            }
		</script>
	</div>

    </td>
    <td>

    </td>
  </tr>
</table>

</div>
</form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</div>
</body>
</html>


