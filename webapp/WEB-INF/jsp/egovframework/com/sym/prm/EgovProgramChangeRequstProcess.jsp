<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovProgramChangeRequstProcess.jsp
  * @Description : 프로그램변경요청처리 조회 화면
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
<title>프로그램변경요청처리</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script language="javascript1.2"  type="text/javaScript" src="<c:url value='/js/egovframework/com/sts/calendar.js' />"></script>
<script language="javascript1.2"  type="text/javaScript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script language="javascript1.2"  type="text/javaScript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.programChangeRequstProcessListForm.pageIndex.value = pageNo;
	document.programChangeRequstProcessListForm.action = "<c:url value='/sym/prm/EgovProgramChangeRequstProcessListSelect.do'/>";
   	document.programChangeRequstProcessListForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectProgramChangeRequstProcessList() {
	document.programChangeRequstProcessListForm.pageIndex.value = 1;
	document.programChangeRequstProcessListForm.action = "<c:url value='/sym/prm/EgovProgramChangeRequstProcessListSelect.do'/>";
	document.programChangeRequstProcessListForm.submit();
}

/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectChangeRequstProcessListDetail(progrmFileNm, tmpNo) {
	document.programChangeRequstProcessListForm.tmpProgrmNm.value = progrmFileNm;
	document.programChangeRequstProcessListForm.tmpRqesterNo.value = tmpNo;
	document.programChangeRequstProcessListForm.action = "<c:url value='/sym/prm/EgovProgramChangRequstProcessDetailSelect.do'/>";
	document.programChangeRequstProcessListForm.submit();
}

/* ********************************************************
 * 검색조건 처리 함수
 ******************************************************** */
function fncSearchSpan(vSearch) {
	searchSpan.innerHTML = "&nbsp;&nbsp;"
	if(vSearch == "1"){
		searchSpan.innerHTML += "전체조회&nbsp; <input name='searchKeyword' type='hidden' size='10' value='%'  maxlength='20' >";
	}else if(vSearch == "2"){
		searchSpan.innerHTML += "처리상태&nbsp; <select name='searchKeyword'> <option value=A>신청중 <//option> <option value=P>진행중 <//option> <option value=R>반려      <//option> <option value=C>처리완료 <//option> <//select>";
	}else if(vSearch == "3"){
        searchSpan.innerHTML += "요청일자&nbsp;"
            + "<input type='hidden' name='cal_url' value=\"<c:url value='/sym/cal/EgovNormalCalPopup.do'/>\" />"
            + "<input name='searchKeywordFrom' type='text' size='8' value=''  maxlength='8'>"
            + " <a href=\"javascript:fn_egov_NormalCalendar(programChangeRequstProcessListForm, programChangeRequstProcessListForm.searchKeywordFrom,'');\" style=\"selector-dummy:expression(this.hideFocus=false);\"><img src=\"<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>\" name=\"cal_img1\" id=\"cal_img1\" border=\"0\" title=\"달력\" alt=\"달력\"><//a> ~ "
            + "<input name='searchKeywordTo'   type='text' size='8' value=''  maxlength='8'>"
            + " <a href=\"javascript:fn_egov_NormalCalendar(programChangeRequstProcessListForm,programChangeRequstProcessListForm.searchKeywordTo,'');\" style=\"selector-dummy:expression(this.hideFocus=false);\"><img src=\"<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>\" name=\"cal_img2\" id=\"cal_img2\" border=\"0\" title=\"달력\" alt=\"달력\"><//a>";


 //                             + "<input name='searchKeywordFrom' type='text' size='10' value=''  maxlength='14' >"
 //                             + "<img src='/images/egovframework/com/sts/ico_cal.gif' />' name='cal_img1' id='cal_img1' border='0' title='달력' onClick='popUpCalendar(this, searchKeywordFrom, \"yyyymmdd\")' style='cursor:pointer;'> ~ "
 //                             + "<input name='searchKeywordTo'   type='text' size='10' value=''  maxlength='14' >"
 //                             + "<img src='/images/egovframework/com/sts/ico_cal.gif' />' name='cal_img2' id='cal_img2' border='0' title='달력' onClick='popUpCalendar(this, searchKeywordTo, \"yyyymmdd\")' style='cursor:pointer;'>";
	}else if(vSearch == "4"){
        searchSpan.innerHTML += "요청자  &nbsp;<input name='searchKeyword' type='text' size='10' value=''  maxlength='20' >";
	}
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

<form name="programChangeRequstProcessListForm" method="post" action="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="">&nbsp;프로그램변경요청처리</h1></td>
  <th >
  </th>
  <td width="10%" ></td>
  <td width="35%"></td>
  <th width="10%">
  </th>
 </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1">
 <tr>
  <td width="100%">
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="프로그램변경요청처리  검색조건">
   	<caption>프로그램변경요청처리  검색조건</caption>
      <tr>
        <th width="15%" height="40" scope="row" ><label for="searchCondition">검색조건&nbsp;</label></th>
        <td width="85%">
           <table border="0" cellspacing="0" cellpadding="0" align="left">
            <tr>
              <td width="10%" align="right">&nbsp;
                <select name="searchCondition" onchange="javascript:fncSearchSpan(this.value);" title="검색조건">
                    <option value="1">전체    </option>
                    <option value="2">처리상태    </option>
                    <option value="3">요청일자  </option>
                    <option value="4">요청자  </option>
                </select>
              </td>
              <td width="60%" align="left">
              <span id="searchSpan" >&nbsp;&nbsp;전체조회&nbsp;<input name='searchKeyword' type='hidden' size='10' value='%'  maxlength='20' title="검색조건값"></span>
              </td>
              <td width="5%"></td>
			  <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="selectProgramChangeRequstProcessList(); return false;"></span></td>
              <td width="20%"></td>
            </tr>
          </table>
        </td>
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
<table width="717" cellpadding="8" class="table-line" style="table-layout:fixed" summary="프로그램변경요청처리 목록화면으로 요청번호,프로그램파일명,처리상태,요청제목,요청자,요청일자로 구성.">
 <caption>프로그램변경요청처리 목록</caption>
  <tr>
    <th class="title" width="80"  scope="col">요청번호</th>
    <th class="title" width="177" scope="col">프로그램파일명</th>
    <th class="title" width="80"  scope="col">처리상태</th>
    <th class="title" width="200" scope="col">요청제목</th>
    <th class="title" width="80"  scope="col">요청자</th>
    <th class="title" width="100" scope="col">요청일자</th>
  </tr>
<c:if test="${fn:length(list_changerequst) == 0}">
<tr>
<td class="lt_text3" colspan="6">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
 <c:forEach var="result" items="${list_changerequst}" varStatus="status">
   <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
  <tr>
    <td class="lt_text" nowrap><c:out value="${result.rqesterNo}"/></td>
    <td class="lt_text" style="cursor:hand;" nowrap>
        <form name="item" method="post" action="<c:url value='/sym/prm/EgovProgramChangRequstProcessDetailSelect.do'/>">
			<input type="hidden" name="tmpProgrmNm"  value="<c:out value="${result.progrmFileNm  }"/>"/>
			<input type="hidden" name="tmpRqesterNo" value="<c:out value="${result.rqesterNo     }"/>"/>
            <span class="link"><input type="submit"   value="<c:out value="${result.progrmFileNm  }"/>" onclick="selectChangeRequstProcessListDetail('<c:out value="${result.progrmFileNm}"/>','<c:out value="${result.rqesterNo}"/>'); return false;"></span>
        </form>
	</td>
    <td class="lt_text" nowrap>
      <c:if test="${empty result.processSttus}">N/A</c:if>
      <c:if test="${result.processSttus == 'A'}">신청중</c:if>
      <c:if test="${result.processSttus == 'P'}">진행중</c:if>
      <c:if test="${result.processSttus == 'R'}">반려</c:if>
      <c:if test="${result.processSttus == 'C'}">처리완료</c:if>
    </td>
    <td class="lt_text" nowrap><c:out value="${result.rqesterSj}"/></td>
    <td class="lt_text" nowrap><c:out value="${result.rqesterPersonId}"/></td>
    <td class="lt_text" nowrap><c:out value="${result.rqesterDe}"/></td>
  </tr>
 </c:forEach>

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
