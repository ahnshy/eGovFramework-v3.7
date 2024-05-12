<%
/**
 * @JSP Name : egovCategoryList.jsp
 * @Description : CategoryList 화면
 * @Modification Information
 * 
 *   수정일         수정자                   수정내용
 *  -------    --------    ---------------------------
 *  2011.07.11  신혜연          최초 생성
 *
 * author 실행환경팀 
 * Copyright (C) 2011 by MOPAS  All right reserved.
 */
%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="imagePath_icon" value="/images/egovframework/com/sym/prm/icon/" />
<c:set var="imagePath_button" value="/images/egovframework/com/sym/prm/button/" />
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.list" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javaScript" language="javascript" defer="defer">

function press() {

    if (event.keyCode==13) {
    	linkPage('1');
    }
}


/* 글 수정 화면 function */
function fn_egov_select(id) {
	document.listForm.selectedId.value = id;
   	document.listForm.action = "<c:url value='/com/sysmgnt/category/updateCategoryView.do'/>";
   	document.listForm.submit();		
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.listForm.action = "<c:url value='/com/sysmgnt/category/insertCategoryView.do'/>";
   	document.listForm.submit();		
}

</script>
</head>
<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>
<form:form commandName="searchVO" name="listForm" action="${pageContext.request.contextPath}/com/sysmgnt/category/egovCategoryList.do" method="post">
<input type="hidden" name="selectedId" />
<div class="board">
	<h1>${pageTitle} <spring:message code="title.list" /></h1>
	<!-- 검색영역 -->
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li><div style="line-height:4px;">&nbsp;</div><div>카테고리 검색 : </div></li>
			<!-- 검색키워드 및 조회버튼 -->
			<li style="border: 0px solid #d2d2d2;">
				<input class="s_input" name="searchKeyword" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="155" >
				<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
				<input type="button" class="s_btn" value="<spring:message code="button.create" />" title="<spring:message code="title.create" /> <spring:message code="input.button" />" onClick="fn_egov_addView(); return false;" />
			</li>
		</ul>
	</div>
	
	<!-- 목록영역 -->
	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.list" /></caption>
	<thead>
	<tr>
		<th class="title"><spring:message code="header.no" /></th>
		<th class="title"><spring:message code="cgr.header.no" /></th>
		<th class="title"><spring:message code="cgr.header.nm" /></th>
		<th class="title"><spring:message code="cgr.header.dc" /></th>
	</tr>
	</thead>
	<tbody class="ov">
		<c:if test="${fn:length(resultList) == 0}">
		<tr>
			<td colspan="6"><spring:message code="common.nodata.msg" /></td>
		</tr>
		</c:if>
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td align="center" class="listtd"><c:out value="${status.count}"/></td>
				<td align="center" class="listtd"><a href="#link" onClick="fn_egov_select('<c:out value="${result.ctgryId}"/>'); return false;"><c:out value="${result.ctgryId}"/>&nbsp;</a></td>
				<td align="left" class="listtd"><c:out value="${result.ctgryNm}"/></td>
				<td align="center" class="listtd"><c:out value="${result.dc}"/>&nbsp;</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
<%-- 	
	<c:if test="${fn:length(resultList) > 0}">
		<!-- paging navigation -->
		<div class="pagination">
			<ul><ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/></ul>
		</div>
	</c:if> --%>


</div><!-- end div board -->

<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="searchCondition"/>
</form:form>
</body>
</html>
