<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
 /**
  * @Class Name : EgovMenuBndeRegist.jsp
  * @Description : 메뉴프로그램목록 일괄 등록 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */
  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/com/sym/mnu/mpm/icon";
  String imagePath_button = "/images/egovframework/com/sym/mnu/mpm/button/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css" >
<title>메뉴일괄등록</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script  language="javascript1.2" type="text/javaScript">
/* ********************************************************
 * 메뉴일괄생성처리 함수
 ******************************************************** */
function insertMenuManage() {
	if(confirm("메뉴일괄등록을 하시겠습니까?. \n 메뉴정보와  프로그램목록, 프로그램 변경내역 존재시 삭제 하실 수 없습니다.")){
	   if(checkFile()){
		   document.menuManageRegistForm.action ="<c:url value='/sym/mnu/mpm/EgovMenuBndeRegist.do' />";
	      document.menuManageRegistForm.submit();
	   }
	}
}
/* ********************************************************
 * 메뉴일괄삭제처리 함수
 ******************************************************** */
function deleteMenuList() {
	if(confirm("메뉴일괄삭제를 하시겠습니까?. \n 메뉴정보와  프로그램목록, 프로그램 변경내역 데이타 모두  삭제 삭제처리 됩니다.")){
		document.menuManageRegistForm.action ="<c:url value='/sym/mnu/mpm/EgovMenuBndeAllDelete.do' />";
		document.menuManageRegistForm.submit();
	}
}
/* ********************************************************
 * 메뉴일괄등록시 등록파일 체크 함수
 ******************************************************** */
function checkFile(){
	if(document.menuManageRegistForm.file.value==""){
	   alert("업로드 할 파일을 지정해 주세요");
	   return false;
	}

	var  str_dotlocation,str_ext,str_low;
	str_value  = document.menuManageRegistForm.file.value;
	str_low   = str_value.toLowerCase(str_value);
	str_dotlocation = str_low.lastIndexOf(".");
	str_ext   = str_low.substring(str_dotlocation+1);

	switch (str_ext) {
	  case "xls" :
	  case "xlsx" :
		 return true;
	     break;
	  default:
	     alert("파일 형식이 맞지 않습니다.\n xls,XLS,xlsx,XLSX 만\n 업로드가 가능합니다!");
	     return false;
	}
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->
<form name="menuManageRegistForm" action ="<c:url value='/sym/mnu/mpm/EgovMenuBndeRegist.do'/>" method="post" enctype="multipart/form-data">

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
   <td width="40%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;메뉴일괄등록</h1></td>
   <td width="10%"></td>
   <td width="35%"></td>
  </tr>
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="80%">&nbsp;</td>
    <td width="20%" height="10">&nbsp;
       <table border="0" cellspacing="0" cellpadding="0" align="left">
         <tr>
           <!-- td width="5%"></td>
           <td><img src="<%=imagePath_button %>bu2_left.gif' />" width="8" height="20"></td>
           <td background="<%=imagePath_button %>bu2_bg.gif' />" nowrap><a href="javascript:deleteMenuList()">일괄삭제</a></td>
           <td><img src="<%=imagePath_button %>bu2_right.gif' />" width="8" height="20"></td-->
           <td width="10"></td>
           <td><span class="button"><input type="submit" value="일괄등록" onclick="insertMenuManage(); return false;"/></span></td>
         </tr>
       </table>
    </td>
  </tr>
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0" summary="메뉴일괄등록" >
	<caption>메뉴일괄등록 </caption>
  <tr>
    <td height="10">&nbsp; </td>
  </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1">
 <tr>
  <td width="100%">
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
      <tr>
        <th width="20%" height="40" class="required_text">일괄파일<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />&nbsp;</th>
        <td width="80%">
          <table border="0" cellspacing="0" cellpadding="0" align="left">
            <tr>
              <td >&nbsp;<input type = "file" name="file" size="40" title="일괄파일"/></td>
              <td width="5%"></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
   </td>
 </tr>
</table>
<br/>
<input name="cmd" type="hidden" value="<c:out value='bndeInsert'/>"/>
</form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</div>
</body>
</html>

