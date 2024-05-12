<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
 /**
  * @Class Name : EgovProgramChangRequstProcessDetailSelectUpdt.jsp
  * @Description : 프로그램변경요청처리상세조회/수정
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  *   2011.09.14   서준식         변경처리 요청내용 Readonly로 변경
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */
  /* Image Path 설정 */
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
<title>프로그램변경요청처리상세조회/수정</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<validator:javascript formName="progrmManageDtlVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value="/validator.do" />"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function updateChangRequstProcess(form) {
	if(confirm("<spring:message code="common.save.msg"/>")){
		if(!validateProgrmManageDtlVO(form)){
			return;
		}else{
            form.action ="<c:url value='/sym/prm/EgovProgramChangRequstProcessDetailSelectUpdt.do' />";
			form.submit();
		}
	}
}

/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function deleteChangRequstProcess(form) {
   form.action = "<c:url value='/sym/prm/EgovProgramChangeRequstProcessDelete.do' />";
   form.submit();
}

/* ********************************************************
 * 목록조회 처리 함수
 ******************************************************** */
function selectList(){
	location.href = "<c:url value='/sym/prm/EgovProgramChangeRequstProcessListSelect.do' />";
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
<DIV id="main">

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="">&nbsp;프로그램변경요청처리상세조회/수정</h1></td>
 </tr>
</table>

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon_pop.gif' />" width="16" height="16" hspace="3" alt="">&nbsp;변경처리내역</td>
 </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="변경처리내역 ">
   	<caption>변경처리내역</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="processDe">변경처리일자</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>&nbsp;
	  <input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
	  <form:input path="processDe" cssClass="txaIpt" title="변경처리일자" readonly="true"/>
   	  <form:errors path="processDe"/>
      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(progrmManageDtlVO,'', progrmManageDtlVO.processDe);" style="selector-dummy:expression(this.hideFocus=false); return false;">
	  <img name="calendarImg" src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt='달력창팝업버튼이미지'></a>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="opetrId">변경처리자</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>
      &nbsp;
      	<form:input path="opetrId" size="30" cssClass="txaIpt" maxlength="30" title="변경처리자" readonly="true"/>
		<form:errors path="opetrId" />
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="processSttus">변경처리상태</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>&nbsp;
        <form:select path="processSttus" title="변경처리상태">
            <form:option value=""  label="N/A"/>
            <form:option value="A" label="신청중"/>
            <form:option value="P" label="진행중"/>
            <form:option value="R" label="반려 "/>
            <form:option value="C" label="처리완료"/>
        </form:select>
        <div><form:errors path="processSttus" /></div>
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" scope="row"><label for="rqesterProcessCn">변경처리내용</label></th>
    <td>
      &nbsp;
      <form:textarea path="rqesterProcessCn" rows="5" cols="75" cssClass="txaClass" title="변경처리내용"/>
      <form:errors path="rqesterProcessCn"/>
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
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon_pop.gif' />" width="16" height="16" hspace="3" alt="" /><label for="rqesterCn">&nbsp;변경요청내역</label></td>
 </tr>
</table>

<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="변경요청내역 ">
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
      &nbsp;<c:out value="${progrmManageDtlVO.rqesterSj}" />
		<form:hidden path="rqesterSj" />
		<form:errors path="rqesterSj" />
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" scope="row"><label for="changerqesterCn">변경요청내용</label></th>
    <td>
      &nbsp;
      <form:textarea path="changerqesterCn" rows="5" cols="75" readonly="true" cssClass="txaClass" title="변경요청내용"/>
      <form:errors path="changerqesterCn"/>
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
	  <td><span class="button"><a href="<c:url value='/sym/prm/EgovProgramChangeRequstProcessListSelect.do'/>" onclick="selectList(); return false;">목록</a></span></td>
	  <td width="5%"></td>
	  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="updateChangRequstProcess(document.forms[0]); return false;"></span></td>
	</tr>
</table>
<br>
</div>
</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</div>
</body>
</html>
