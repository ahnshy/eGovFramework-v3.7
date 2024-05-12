<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
 /**
  * @Class Name : EgovProgramChgHstDetail.jsp
  * @Description : 프로그램변경이력 상세조회 화면
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
  String imagePath_icon   = "/images/egovframework/com/sym/prm/icon/";
  String imagePath_button = "/images/egovframework/com/sym/prm/button/";
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css">
<title>프로그램변경이력상세</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function updateChangRequstProcess() {
	progrmChangRequstProcessForm.submit();
}

/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function deleteChangRequstProcess() {
   document.progrmChangRequstProcessForm.action = "<c:url value='EgovProgramChangeRequstProcessDelete.do'/>";
   document.progrmChangRequstProcessForm.submit();
}

/* ********************************************************
 * 목록조회 함수
 ******************************************************** */
function selectList(){
	location.href = "<c:url value='/sym/prm/EgovProgramChgHstListSelect.do' />";
}
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
<form name="progrmChangeRequstForm" action ="<c:url value='/sym/prm/EgovProgramChgHstListSelect.do'/>" method="post">
<DIV id="main" style="display:">

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;프로그램변경이력상세조회</h1></td>
 </tr>
</table>

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon_pop.gif' />" width="16" height="16" hspace="3"  alt="" />&nbsp;변경요청내역</td>
 </tr>
</table>

<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="변경요청내역 상세 ">
   	<caption>변경요청내역 상세</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">요청번호</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.rqesterNo}"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">프로그램파일명</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.progrmFileNm}"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">요청자ID</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.rqesterPersonId}"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">요청일자</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.rqesterDe}"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">요청제목</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.rqesterSj}"/></td>
  </tr>
  <tr>
    <th height="23" class="required_text" scope="row">변경요청내용</th>
    <td>
      &nbsp; <textarea name="changerqesterCn" class="textarea"  cols="75" rows="5" readOnly style="width:450px;border:0;background-color:transparent;filter: chroma(color=ffffff);" title="변경요청내용"><c:out value="${resultVO.changerqesterCn}"/></textarea>
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
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon_pop.gif' />" width="16" height="16" hspace="3" alt="">&nbsp;변경처리내역</td>
 </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="변경처리내역 상세 ">
   	<caption>변경처리내역 상세</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" >변경처리일자</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.processDe}"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" >변경처리자</th>
    <td width="80%" nowrap>&nbsp;<c:out value="${resultVO.opetrId}"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" >변경처리상태</th>
    <td width="80%" nowrap>&nbsp;
      <c:if test="${empty resultVO.processSttus}">N/A</c:if>
      <c:if test="${resultVO.processSttus == 'A'}">신청중</c:if>
      <c:if test="${resultVO.processSttus == 'P'}">진행중</c:if>
      <c:if test="${resultVO.processSttus == 'R'}">반려</c:if>
      <c:if test="${resultVO.processSttus == 'C'}">처리완료</c:if>
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" scope="row">변경처리내용</th>
    <td>
      &nbsp; <textarea name="rqesterProcessCn" class="textarea"  cols="75" rows="5" readOnly style="width:450px;border:0;background-color:transparent;filter: chroma(color=ffffff);" title="변경처리내용"><c:out value="${resultVO.rqesterProcessCn}"/></textarea>
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
  <td><span class="button"><input type="submit" value="목록" onclick="selectList(); return false;"></span></td>
  <td width="10">&nbsp;</td>
</tr>
</table>
<br>


</div>
</form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</div>
</body>
</html>
