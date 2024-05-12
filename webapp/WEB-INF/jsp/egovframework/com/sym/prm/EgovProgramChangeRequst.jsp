<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovProgramChangeRequst.jsp
  * @Description : 프로그램변경요청 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  *   2011.09.14    서준식       리스트 내용 없음 표시
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
<title>프로그램변경요청</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//	document.progrmChangeRequstForm.searchKeyword.value =
	document.progrmChangeRequstForm.pageIndex.value = pageNo;
	document.progrmChangeRequstForm.action = "<c:url value='/sym/prm/EgovProgramChangeRequstSelect.do'/>";
   	document.progrmChangeRequstForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectProgrmChangeRequstList() {
	document.progrmChangeRequstForm.pageIndex.value = 1;
	document.progrmChangeRequstForm.action = "<c:url value='/sym/prm/EgovProgramChangeRequstSelect.do'/>";
	document.progrmChangeRequstForm.submit();
}

/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertChangeRequst() {
   	document.progrmChangeRequstForm.action = "<c:url value='/sym/prm/EgovProgramChangRequstStre.do'/>";
   	document.progrmChangeRequstForm.submit();
}

/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtChangeRequstListDetail(progrmFileNm, tmpNo) {
	document.progrmChangeRequstForm.tmpProgrmNm.value  = progrmFileNm;
	document.progrmChangeRequstForm.tmpRqesterNo.value = tmpNo;
	document.progrmChangeRequstForm.action = "<c:url value='/sym/prm/EgovProgramChangRequstDetailSelect.do'/>";
	document.progrmChangeRequstForm.submit();
}

function deleteChangeRequstList() {
	progrmChangeRequstForm.submit();
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

<form name="progrmChangeRequstForm" action ="<c:url value='/sym/prm/EgovProgramChangeRequstSelect.do'/>?pageIndex=1" method="post">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="">&nbsp;프로그램변경요청</h1></td>
  <th >
  </th>
  <td width="10%" ></td>
  <td width="35%"></td>
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td></td>
    </tr>
   </table>
  </th>
 </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1">
 <tr>
  <td width="100%">
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="프로그램변경요청  조건검색">
   	<caption>프로그램변경요청  조건검색</caption>
      <tr>
        <th width="20%" height="40" class="" scope="row" ><label for="searchKeyword">프로그램파일명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
        <td width="80%">
          <table border="0" cellspacing="0" cellpadding="0" align="left">
            <tr>
              <td >&nbsp;<input name="searchKeyword" type="text" size="80" value=""  maxlength="60" title="검색조건"></td>
              <td width="5%"></td>
              <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="selectProgrmChangeRequstList(); return false;"></span></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
   </td>
 </tr>
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="75%">&nbsp;</td>
    <td width="25%" height="10">&nbsp;
          <table border="0" cellspacing="0" cellpadding="0" align="right">
            <tr>
              <td width="5%"></td>
              <td><span class="button"><a href="<c:url value='/sym/prm/EgovProgramChangRequstStre.do'/>" onclick="insertChangeRequst(); return false;"><spring:message code="button.create" /></a></span></td>
              <td width="10"></td>
            </tr>
          </table>
    </td>
  </tr>
</table>
<input type="hidden" name="tmpProgrmNm">
<input type="hidden" name="tmpRqesterNo">
</form>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10">&nbsp; </td>
  </tr>
</table>
<table width="717" cellpadding="0" cellspacing="0" class="table-line" style="table-layout:fixed" summary="프로그램변경요청  조회화면으로 요청번호,프로그램파일명,요청제목,요청자,요청일자,처리여부로 구성.">
 <caption>프로그램변경요청 목록</caption>
  <thead>
  <tr>
    <th class="title" width="80"   scope="col">요청번호</th>
    <th class="title" width="177"  scope="col">프로그램파일명</th>
    <th class="title" width="200"  scope="col">요청제목</th>
    <th class="title" width="80"   scope="col">요청자</th>
    <th class="title" width="100"  scope="col">요청일자</th>
    <th class="title" width="80"   scope="col">처리여부</th>
  </tr>
 </thead>
  <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
	<c:if test="${fn:length(list_changerequst) == 0}">
	<tr>
	<td class="lt_text3" colspan="9">
		<spring:message code="common.nodata.msg" />
	</td>
	</tr>
	</c:if>
 <tbody>
 <c:forEach var="result" items="${list_changerequst}" varStatus="status">
  <tr>
    <td class="lt_text" nowrap><c:out value="${result.rqesterNo}"/></td>
    <td class="lt_text" style="cursor:hand;" nowrap>
      <form name="item" method="post" action="<c:url value='/sym/prm/EgovProgramChangRequstDetailSelect.do'/>">
		<input type="hidden" name="tmpProgrmNm"  value="<c:out value="${result.progrmFileNm  }"/>"/>
		<input type="hidden" name="tmpRqesterNo" value="<c:out value="${result.rqesterNo     }"/>"/>
        <span class="link"><input type="submit"   value="<c:out value="${result.progrmFileNm  }"/>" onclick="selectUpdtChangeRequstListDetail('<c:out value="${result.progrmFileNm}"/>','<c:out value="${result.rqesterNo}"/>'); return false;"></span>
      </form>
    </td>
    <td class="lt_text" nowrap><c:out value="${result.rqesterSj}"/></td>
    <td class="lt_text" nowrap><c:out value="${result.rqesterPersonId}"/></td>
    <td class="lt_text" nowrap><c:out value="${result.rqesterDe}"/></td>
    <td class="lt_text" nowrap>
      <c:if test="${empty result.processSttus}">N/A</c:if>
      <c:if test="${result.processSttus == 'A'}">신청중</c:if>
      <c:if test="${result.processSttus == 'P'}">진행중</c:if>
      <c:if test="${result.processSttus == 'R'}">반려</c:if>
      <c:if test="${result.processSttus == 'C'}">처리완료</c:if>
    </td>
  </tr>
 </c:forEach>
 </tbody>
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
    <tr>
    <td height="10">
<!-- 페이징 시작 -->
<div align="center">
  <div>
	<ui:pagination paginationInfo = "${paginationInfo}"	type="image" jsFunction="linkPage"/>
  </div>
</div>
<!-- 페이징 끝 -->
    </td>
  </tr>
</table>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</div>
</body>
</html>
