<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovProgramChgHst.jsp
  * @Description : 프로그램변경이력 조회 화면
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
<title>프로그램변경이력</title>
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
//	document.programChgHstForm.searchKeyword.value =
	document.programChgHstForm.pageIndex.value = pageNo;
	document.programChgHstForm.action = "<c:url value='/sym/prm/EgovProgramChgHstListSelect.do'/>";
   	document.programChgHstForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectProgrmChgHstList() {
	document.programChgHstForm.pageIndex.value = 1;
	document.programChgHstForm.action = "<c:url value='/sym/prm/EgovProgramChgHstListSelect.do'/>";
	document.programChgHstForm.submit();
}

/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectChgHstListDetail(progrmFileNm, tmp_no) {
    document.programChgHstForm.tmpRqesterNo.value = '';
	document.programChgHstForm.tmpProgrmNm.value = progrmFileNm;
	document.programChgHstForm.tmp_rqesterNo.value = tmp_no;
	document.programChgHstForm.action = "<c:url value='/sym/prm/EgovProgramChgHstListDetailSelect.do'/>";
	document.programChgHstForm.submit();
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
<form name="programChgHstForm" action ="<c:url value='/sym/prm/EgovProgramChgHstListSelect.do'/>" method="post">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;프로그램변경이력</h1></td>
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
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="검색조건 ">
   	<caption>검색조건</caption>
      <tr>
        <th width="20%" height="40" class="" scope="row"><label for="progrmFileNm">프로그램명*</label>&nbsp;</th>
        <td width="80%">
          <table border="0" cellspacing="0" cellpadding="0" align="left">
            <tr>
              <td >&nbsp;<input name="progrmFileNm" type="text" size="80" value=""  maxlength="60" title="검색조건"></td>
              <td width="5%"></td>
  			  <td><span class="button"><input type="submit" value="조회" onclick="selectProgrmChgHstList(); return false;"></span></td>
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
    <td width="90%">&nbsp;</td>
    <td width="10%" height="10">&nbsp;</td>
  </tr>
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10">&nbsp; </td>
  </tr>
</table>

<input type="hidden" name="tmpProgrmNm">
<input type="hidden" name="tmpRqesterNo">
</form>

<table width="717" cellpadding="8" class="table-line"  summary="프로그램변경이력 목록으로 프로그램파일명,처리상태,처리내용,변경요청자,변경요청일자,변경완료일자로 구성 ">
   	<caption>"프로그램변경이력</caption>
 <thead>
  <tr>
    <th class="title" width="15%" scope="col">프로그램파일명</th>
    <th class="title" width="10%" scope="col">처리상태</th>
    <th class="title" width="30%" scope="col">처리내용</th>
    <th class="title" width="15%" scope="col">변경요청자</th>
    <th class="title" width="15%" scope="col">변경요청일자</th>
    <th class="title" width="15%" scope="col">변경완료일자</th>
  </tr>
 </thead>
 <tbody>
    <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(list_changerequst) == 0}">
<tr>
<td class="lt_text3" colspan="6">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
 <c:forEach var="result" items="${list_changerequst}" varStatus="status">
  <tr>
    <td class="lt_text3" style="cursor:hand;" nowrap>
        <form name="item" method="post" action="<c:url value='/sym/prm/EgovProgramChgHstListDetailSelect.do'/>">
			<input type="hidden" name="tmpProgrmNm"   value="<c:out value="${result.progrmFileNm  }"/>"/>
			<input type="hidden" name="tmpRqesterNo"  value="<c:out value="${result.rqesterNo  }"/>"/>
            <span class="link"><input type="submit" value="<c:out value="${result.progrmFileNm}"/>" onclick="selectChgHstListDetail('<c:out value="${result.progrmFileNm}"/>','<c:out value="${result.rqesterNo}"/>'); return false;"></span>
        </form></td>
    <td class="lt_text3" nowrap>
      <c:if test="${empty result.processSttus}">N/A</c:if>
      <c:if test="${result.processSttus == 'A'}">신청중</c:if>
      <c:if test="${result.processSttus == 'P'}">진행중</c:if>
      <c:if test="${result.processSttus == 'R'}">반려</c:if>
      <c:if test="${result.processSttus == 'C'}">처리완료</c:if>
    </td>
    <td class="lt_text3" nowrap><c:out value="${result.rqesterProcessCn}"/></td>
    <td class="lt_text3" nowrap><c:out value="${result.rqesterPersonId}"/></td>
    <td class="lt_text3" nowrap><c:out value="${result.rqesterDe}"/></td>
    <td class="lt_text3" nowrap><c:out value="${result.processDe}"/></td>
  </tr>
 </c:forEach>
 </tbody>
 <!--tfoot>
  <tr class="">
   <td colspan=6 align="center"></td>
  </tr>
 </tfoot -->
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
