<%
/**
 * @JSP Name : egovCategoryRegister.jsp
 * @Description : 카테고리 등록,수정 화면
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
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comCopSecRam.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<c:set var="registerFlag" value="${empty category.ctgryId ? '등록' : '수정'}"/>
<title>JPA/Hibernate 예제 : 카테고리 <c:out value="${registerFlag}"/> </title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="authorManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.detailForm.action = "<c:url value='/com/sysmgnt/category/egovCategoryList.do'/>";
   	document.detailForm.submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
	if(!confirm("삭제하시겠습니까?")){
		return;
	}
   	document.detailForm.action = "<c:url value='/com/sysmgnt/category/deleteCategory.do'/>";
   	document.detailForm.submit();		
}

/* 글 등록 function */
function fn_egov_save() {	
	frm = document.detailForm;
	if(frm.ctgryNm.value == ""){
		alert("카테고리명을 입력하세요.");
		frm.ctgryNm.focus;
		return;
	}
	
	if(!confirm("${registerFlag} 하시겠습니까?")){
		return;
	}
	
	frm.action = "<c:url value="${registerFlag == '등록' ? '/com/sysmgnt/category/insertCategory.do' : '/com/sysmgnt/category/updateCategory.do'}"/>";
    frm.submit();
}

</script>
</head>

<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>
<form:form commandName="category" name="detailForm" action="${pageContext.request.contextPath}/com/sysmgnt/category/insertCategory.do" method="post" onSubmit="fncAuthorInsert(document.forms[0]); return false;"> 
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>${pageTitle} <spring:message code="title.create" /></h2>

	<!-- 등록폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.create" /></caption>
	<tbody>
		<tr>
			<td ><spring:message code="cgr.header.nm" /></td>
			<td class="left">
				<form:input path="ctgryNm" maxlength="30" cssClass="txt"  style="width:95%;" title="카테고리명"/>&nbsp;&nbsp;&nbsp;<form:errors path="ctgryNm" />
			</td>
		</tr>
		<tr>
			<td ><spring:message code="cgr.header.dc" /></td>
			<td class="left">
				<form:textarea path="dc" rows="5" cols="58" />&nbsp;&nbsp;&nbsp;&nbsp;<form:errors path="dc" />
			</td>
		</tr>
	</tbody>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input type="submit" class="s_submit" value="<c:out value='${registerFlag}'/>" onClick="fn_egov_save(); return false;" title="<spring:message code="button.create" />" />
		<c:if test="${registerFlag == '수정'}">
			<span class="btn_s" title="<spring:message code="button.delete" />"><a href="#link" onClick="fn_egov_delete(); return false;"><spring:message code="button.delete" /></a></span>
		</c:if>
		<span class="btn_s" title="<spring:message code="button.reset" />"><a href="#link" onClick="javascript:document.detailForm.reset(); return false;"><spring:message code="button.reset" /></a></span>
		<span class="btn_s" title="<spring:message code="button.list" />"><a href="<c:url value='/com/sysmgnt/category/egovCategoryList.do' />" ><spring:message code="button.list" /></a></span>
	</div><div style="clear:both;"></div>
	
</div>
</form:form>	

</body>
</html>

