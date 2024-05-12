
<%
    /**
			 * @Class Name : EgovMenuCreatManage.jsp
			 * @Description : 메뉴생성관리 조회 화면
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
%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="imagePath_icon"
	value="/images/egovframework/com/sym/prm/icon/" />
<c:set var="imagePath_button"
	value="/images/egovframework/com/sym/prm/button/" />
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle}<spring:message code="title.list" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javaScript" language="javascript" defer="defer">
	function linkPage(pageNo) {
		document.progrmManageForm.searchCondition.value = "1";
		document.progrmManageForm.pageIndex.value = pageNo;
		document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListSearch.do'/>";
		document.progrmManageForm.submit();
	}

	function press() {

		if (event.keyCode == 13) {
			linkPage('1');
		}
	}

	/* ********************************************************
	 * 프로그램목록 선택 처리 함수
	 ******************************************************** */
	function choisProgramListSearch(vFileNm) {
		var parentFrom = opener.document.getElementsByTagName('form');
		parentFrom[0].progrmFileNm.value = vFileNm;
		window.close();
	}
</script>
</head>
<body>
	<!-- javascript warning tag  -->
	<noscript class="noScriptTitle">
		<spring:message code="common.noScriptTitle.msg" />
	</noscript>
	<form:form name="menuCreatManageForm"
		action="${pageContext.request.contextPath}menuCreatManageForm"
		method="post">
		<div class="board">
			<h1>${pageTitle}
				<spring:message code="title.list" />
			</h1>
			<!-- 검색영역 -->
			<div class="search_box"
				title="<spring:message code="common.searchCondition.msg" />">
				<ul>
					<li><div style="line-height: 4px;">&nbsp;</div>
						<div>메뉴생성관리 검색 :</div></li>
					<!-- 권한명 -->
					<!-- 검색키워드 및 조회버튼 -->
					<li style="border: 0px solid #d2d2d2;"><input class="s_input"
						name="searchKeyword" type="text" size="35"
						title="<spring:message code="title.search" /> <spring:message code="input.input" />"
						value='<c:out value="${searchVO.searchKeyword}"/>' maxlength="155">
						<input type="submit" class="s_btn"
						value="<spring:message code="button.inquire" />"
						title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
					</li>
				</ul>
			</div>

			<!-- 목록영역 -->
			<table class="board_list"
				summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
				<caption>${pageTitle}
					<spring:message code="title.list" />
				</caption>
				<colgroup>
					<col style="width:;">
					<col style="width:;">
				</colgroup>
				<thead>
					<tr>
						<th class="title" width="20%" scope="col">권한코드</th>
						<th class="title" width="20%" scope="col">권한명</th>
						<th class="title" width="20%" scope="col">권한 설명</th>
						<th class="title" width="20%" scope="col">메뉴생성여부</th>
						<th class="title" width="20%" scope="col">메뉴생성</th>
					</tr>
				</thead>
				<tbody class="ov">
					<c:if test="${fn:length(list_menumanage) == 0}">
						<tr>
							<td colspan="6"><spring:message code="common.nodata.msg" /></td>
						</tr>
					</c:if>
					<c:forEach var="result" items="${list_menumanage}" varStatus="status">
						 <tr>
						    <td class="lt_text3" style="cursor:hand;" ><c:out value="${result.authorCode}"/></td>
						    <td class="lt_text3" style="cursor:hand;" ><c:out value="${result.authorNm}"/></td>
						    <td class="lt_text3" style="cursor:hand;" ><c:out value="${result.authorDc}"/></td>
						    <td class="lt_text3" style="cursor:hand;" >
						          <c:if test="${result.chkYeoBu > 0}">Y</c:if>
						          <c:if test="${result.chkYeoBu == 0}">N</c:if>
						</td>
							<td class="lt_text3" >
								<table border="0" cellspacing="0" cellpadding="0" align="center">
								<tr>
								<td width="10"></td>
								<td><span class="button"><a href="<c:url value='/sym/mnu/mcm/EgovMenuCreatSelect.do'/>?authorCode='<c:out value="${result.authorCode}"/>'"  onclick="selectMenuCreat('<c:out value="${result.authorCode}"/>'); return false;">메뉴생성</a></span></td>
								<td width="10"></td>
								</tr>
								</table>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<c:if test="${fn:length(list_menumanage) > 0}">
				<!-- paging navigation -->
				<div class="pagination">
					<ul>
						<ui:pagination paginationInfo="${paginationInfo}" type="image"
							jsFunction="linkPage" />
					</ul>
				</div>
			</c:if>


		</div>
		<!-- end div board -->


		<input type="hidden" name="pageIndex"
			value="<c:out value='${searchVO.pageIndex}'/>" />
		<input type="hidden" name="searchCondition" />
	</form:form>
</body>
</html>
