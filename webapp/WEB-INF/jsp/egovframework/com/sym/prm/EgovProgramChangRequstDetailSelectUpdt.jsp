<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
 /**
  * @Class Name : EgovProgramChangRequstDetailSelectUpdt.jsp
  * @Description : 프로그램변경요청 상세조회및 수정 화면
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
<title>프로그램변경요청</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value="/validator.do" />"></script>
<validator:javascript formName="progrmManageDtlVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 파일검색 화면 호출 함수
 ******************************************************** */
function searchFileNm() {
	document.progrmChangeRequstForm.tmp_SearchElementName.value = "progrmFileNm";
	window.open("<c:url value='/sym/prm/EgovProgramListSearch.do' />",'','width=500,height=600');
}

/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function updateProgrmChangeRequst(form) {
	if(confirm("<spring:message code="common.save.msg"/>")){
		if(!validateProgrmManageDtlVO(form)){
			return;
		}else{
            form.action ="<c:url value='/sym/prm/EgovProgramChangRequstDetailSelectUpdt.do'/>";
			form.submit();
		}
	}
}


/* ********************************************************
 * 삭제처리 함수
 ******************************************************** */
function deleteProgrmChangeRequst(form) {
	form.action = "<c:url value='/sym/prm/EgovProgramChangRequstDelete.do'/>";
	form.submit();
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
<form:form commandName="progrmManageDtlVO" method="post">
<DIV id="main" style="display:">

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;프로그램변경요청 상세조회 /수정</h1></td>
 </tr>
</table>

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon_pop.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;변경요청내역</td>
 </tr>
</table>

<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="변경요청내역 화면">
   	<caption>변경요청내역</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="rqesterNo">요청번호</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="80%" nowrap>
      &nbsp; <c:out value="${progrmManageDtlVO.rqesterNo}"/>
		<form:hidden path="rqesterNo" />
		<form:errors path="rqesterNo" />
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="progrmFileNm">프로그램파일명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="80%" nowrap>
    &nbsp;<c:out value="${progrmManageDtlVO.progrmFileNm}"/>
		<form:hidden path="progrmFileNm" />
		<form:errors path="progrmFileNm" />
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="rqesterPersonId">요청자ID</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="80%" nowrap>
      &nbsp;<c:out value="${progrmManageDtlVO.rqesterPersonId}"/>
		<form:hidden path="rqesterPersonId" />
		<form:errors path="rqesterPersonId" />
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="rqesterDe">요청일자</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="80%" nowrap>
      &nbsp;<c:out value="${progrmManageDtlVO.rqesterDe}"/>
		<form:hidden path="rqesterDe" />
		<form:errors path="rqesterDe" />
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="rqesterSj">요청제목</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="80%" nowrap>
      &nbsp;
		<form:input path="rqesterSj" size="60"  maxlength="60"  title="요청제목"/>
		<form:errors path="rqesterSj" />
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" scope="row"><label for="changerqesterCn">변경요청내용</label></th>
    <td>
      &nbsp;
      <form:textarea path="changerqesterCn" rows="4" cols="75"  title="변경요청내용"/>
      <form:errors path="changerqesterCn"/>
    </td>
  </tr>
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon_pop.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;변경처리내역</td>
 </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr>
    <th width="20%" height="23" class="required_text"scope="row"><label for="processDe">변경처리일자</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="80%" nowrap>
      &nbsp;<c:out value="${progrmManageDtlVO.processDe}"/>
      	<form:hidden path="processDe" />
		<form:errors path="processDe" />
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="opetrId">변경처리자</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="80%" nowrap>
      &nbsp;<c:out value="${progrmManageDtlVO.opetrId}"/>
      	<form:hidden path="opetrId" />
		<form:errors path="opetrId" />
     </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="processSttus">변경처리상태</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="80%" nowrap>&nbsp;
      <c:if test="${empty progrmManageDtlVO.processSttus}">N/A</c:if>
      <c:if test="${progrmManageDtlVO.processSttus == 'A'}">신청중</c:if>
      <c:if test="${progrmManageDtlVO.processSttus == 'P'}">진행중</c:if>
      <c:if test="${progrmManageDtlVO.processSttus == 'R'}">반려</c:if>
      <c:if test="${progrmManageDtlVO.processSttus == 'C'}">처리완료</c:if>
      	<form:hidden path="processSttus" />
		<form:errors path="processSttus" />
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" scope="row"><label for="rqesterProcessCn">변경처리내용</label></th>
    <td>
      &nbsp;

      <textarea id="rqesterProcessCn" name="rqesterProcessCn" rows="4" readonly cols="75" title="변경처리내용">${progrmManageDtlVO.rqesterProcessCn }</textarea>
      <form:errors path="rqesterProcessCn"/>
    </td>
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
	  <td width="2%"></td>
	  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="updateProgrmChangeRequst(document.forms[0]); return false;"></span></td>
	  <td width="2%"></td>
 	  <td><span class="button"><a href="#LINK" onclick="deleteProgrmChangeRequst(document.forms[0]); return false;">삭제</a></span></td>
</tr>
</table>
<br>
</div>
    <input type="hidden" name="tmp_SearchElementName" value="">
    <input type="hidden" name="tmp_SearchElementVal" value="">
</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</div>
</body>
</html>
