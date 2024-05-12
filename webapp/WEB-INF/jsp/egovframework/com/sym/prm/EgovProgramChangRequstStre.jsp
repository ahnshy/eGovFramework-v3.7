<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
 /**
  * @Class Name : EgovProgramChangRequstStre.jsp
  * @Description : 프로그램변경요청 등록 화면
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
  //String imagePath_icon   = "/images/egovframework/com/sym/prm/icon/";
  //String imagePath_button = "/images/egovframework/com/sym/prm/button/";
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/sym/prm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/sym/prm/"/>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css">
<title>프로그램변경요청 등록</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value="/validator.do" />"></script>
<validator:javascript formName="progrmManageDtlVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 파일목록조회  함수
 ******************************************************** */
function searchFileNm() {
	document.all.tmp_SearchElementName.value = "progrmFileNm";
	window.open("<c:url value='/sym/prm/EgovProgramListSearch.do' />",'','width=500,height=600');
}

/* ********************************************************
 * 입력 처리 함수
 ******************************************************** */
function insertProgrmChangeRequst(form) {
	if(confirm("<spring:message code="common.save.msg" />")){

		if(!validateProgrmManageDtlVO(form)){
			return;
		}else{
            form.action = "<c:url value='/sym/prm/EgovProgramChangRequstStre.do'/>";
			form.submit();
		}
	}
//	progrmListRegistForm.submit();
}

/* ********************************************************
 * 목록조회 처리 함수
 ******************************************************** */
function selectList(){
	location.href = "<c:url value='/sym/prm/EgovProgramChangeRequstSelect.do' />";
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->

<form:form commandName="progrmManageDtlVO" name="progrmManageDtlVO" action ="<c:url value='/sym/prm/EgovProgramChangRequstStre.do'/>" method="post">
<div id="main" style="display:">

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3"  alt="" />&nbsp;프로그램변경요청 등록</h1></td>
 </tr>
</table>

<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register"   summary="프로그램변경요청 ">
   	<caption>프로그램변경요청</caption>
  <tr>
    <th width="145" height="23" class="required_text" scope="row"><label for="rqesterNo">요청번호</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="527" nowrap>&nbsp;
		<form:input path="rqesterNo" size="50"  maxlength="50"  title="요청번호"/>
		<form:errors path="rqesterNo" />
    </td>
  </tr>
  <tr>
    <th width="145" height="23" class="required_text" scope="row"><label for="progrmFileNm">프로그램파일명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="527" nowrap>&nbsp;
    	<input id="progrmFileNm" name="progrmFileNm" size="50"  maxlength="50"  title="프로그램파일명" readonly/>
	    <form:errors path="progrmFileNm" />
        <a href="<c:url value='/sym/prm/EgovProgramListSearch.do'/>?tmp_SearchElementName=progrmFileNm" target="_blank" onclick="javascript:searchFileNm(); return false;" style="selector-dummy:expression(this.hideFocus=false);"  title="새 창으로 이동">
        <img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />" alt='(프로그램파일명 검색)' width="15" height="15" />(프로그램파일명 검색)</a>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="rqesterPersonId">요청자</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="80%" nowrap>&nbsp;
		<form:input path="rqesterPersonId" size="20"  maxlength="20"  title="요청자"/>
		<form:errors path="rqesterPersonId" />
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="rqesterDe">요청일자</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="80%" nowrap>&nbsp;
	  <input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
	  <input id="rqesterDe" name="rqesterDe" size="50"  maxlength="50"  title="요청일자" readonly/>
   	  <form:errors path="rqesterDe"/>
      <a href="#noscript" onClick="fn_egov_NormalCalendar(document.progrmManageDtlVO,'', document.progrmManageDtlVO.rqesterDe); return false;" style="selector-dummy:expression(this.hideFocus=false);">
	  <img name="calendarImg" src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>" alt='달력창팝업버튼이미지'/></a>

    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="rqesterSj">요청제목</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="80%" nowrap>&nbsp;
    	<form:input path="rqesterSj" size="50"  maxlength="50"  title="요청제목"/>
		<form:errors path="rqesterSj" />
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" scope="row"><label for="changerqesterCn">변경요청내용</label></th>
    <td>&nbsp;
      <form:textarea path="changerqesterCn" rows="14" cols="75" title="변경요청내용"/>
      <form:errors path="changerqesterCn"/>
    </td>
  </tr>
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<table width="717" border="0" cellspacing="0" cellpadding="0" align="left">
<tr>
  <td width="90%"></td>
  <td><span class="button"><a href="<c:url value='/sym/prm/EgovProgramChangeRequstSelect.do'/>" onclick="selectList(); return false;">목록</a></span></td>
  <td width="5%"></td>
  <td><span class="button"><input type="submit" value="<spring:message code="button.create" />" onclick="insertProgrmChangeRequst(document.forms[0]); return false;"></span></td>
</tr>
</table>
<br>
</div>
      	<form:hidden path="rqesterProcessCn" />
      	<form:hidden path="opetrId" />
      	<form:hidden path="processSttus" />
      	<form:hidden path="processDe" />
      	<input name="cmd" type="hidden" value="insert"/>
</form:form>
    <input type="hidden" name="tmp_SearchElementName"/>
    <input type="hidden" name="tmp_SearchElementVal"/>

<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</div>
</body>
</html>
