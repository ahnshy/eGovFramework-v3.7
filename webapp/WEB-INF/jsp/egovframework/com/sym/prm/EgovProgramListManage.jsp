<%
/**
 * @Class Name : EgovProgramListManage.jsp
 * @Description : 프로그램목록 조회 화면
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

/* ********************************************************
 * 모두선택 처리 함수
 ******************************************************** */
function fCheckAll() {
    var checkField = document.progrmManageForm.checkField;
    if(document.progrmManageForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

/* ********************************************************
 * 멀티삭제 처리 함수
 ******************************************************** */
function fDeleteProgrmManageList() {
    var checkField = document.progrmManageForm.checkField;
    var ProgrmFileNm = document.progrmManageForm.checkProgrmFileNm;
    var checkProgrmFileNms = "";
    var checkedCount = 0;
    if(checkField) {
    	if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkProgrmFileNms += ((checkedCount==0? "" : ",") + ProgrmFileNm[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
            	checkProgrmFileNms = ProgrmFileNm.value;
            }
        }
    }

    document.progrmManageForm.checkedProgrmFileNmForDel.value=checkProgrmFileNms;
    document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgrmManageListDelete.do'/>";
    document.progrmManageForm.submit();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//	document.menuManageForm.searchKeyword.value =
	document.progrmManageForm.pageIndex.value = pageNo;
	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>";
   	document.progrmManageForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectProgramListManage() {
	document.progrmManageForm.pageIndex.value = 1;
	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>";
	document.progrmManageForm.submit();
}
/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertProgramListManage() {
   	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListRegist.do'/>";
   	document.progrmManageForm.submit();
}
/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtProgramListDetail(progrmFileNm) {
	document.progrmManageForm.tmp_progrmNm.value = progrmFileNm;
   	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListDetailSelect.do'/>";
   	document.progrmManageForm.submit();
}
/* ********************************************************
 * focus 시작점 지정함수
 ******************************************************** */
 function fn_FocusStart(){
		var objFocus = document.getElementById('F1');
		objFocus.focus();
	}

</script>
</head>
<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>
<form:form name="progrmManageForm" action="${pageContext.request.contextPath}/sym/prm/EgovProgramListManageSelect.do" method="post">
<div class="board">
	<h1>${pageTitle} <spring:message code="title.list" /></h1>
	<!-- 검색영역 -->
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li><div style="line-height:4px;">&nbsp;</div><div>프로그램파일명 검색 : </div></li><!-- 권한명 -->
			<!-- 검색키워드 및 조회버튼 -->
			<li style="border: 0px solid #d2d2d2;">
				<input class="s_input" name="searchKeyword" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="155" >
				<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
				<input type="button" class="s_btn" value="<spring:message code="button.create" />" title="<spring:message code="title.create" /> <spring:message code="input.button" />" onclick="insertProgramListManage(); return false;" />
				<input type="button" class="s_btn" value="<spring:message code="button.delete" />" title="<spring:message code="title.delete" /> <spring:message code="input.button" />" onclick="fDeleteProgrmManageList(); return false;" />
			</li>
		</ul>
	</div>
	
	<!-- 목록영역 -->
	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.list" /></caption>
	<thead>
	<tr>
		<th class="title" width="20" scope="col">
			<input type="checkbox" name="checkAll" class="check2" onclick="javascript:fCheckAll();" title="전체선택">
		</th>
		<th class="title" width="150" scope="col">프로그램파일명</th>
		<th class="title" width="137" scope="col">프로그램명</th>
		<th class="title" width="260" scope="col">URL</th>
		<th class="title" width="150" scope="col">프로그램설명</th>
	</tr>
	</thead>
	<tbody class="ov">
		<c:if test="${fn:length(list_progrmmanage) == 0}">
		<tr>
			<td colspan="6"><spring:message code="common.nodata.msg" /></td>
		</tr>
		</c:if>
		<c:forEach var="result" items="${list_progrmmanage}" varStatus="status">
			<tr>
		    <td class="lt_text3" nowrap>
		       <input type="checkbox" name="checkField" class="check2" title="선택">
		       <input name="checkProgrmFileNm" type="hidden" value="<c:out value='${result.progrmFileNm}'/>"/>
		    </td>
		    <td class="lt_text" style="cursor:hand;" nowrap>
		            <span class="link"><a href="<c:url value='/sym/prm/EgovProgramListDetailSelect.do'/>?tmp_progrmNm=<c:out value="${result.progrmFileNm}"/>"  onclick="selectUpdtProgramListDetail('<c:out value="${result.progrmFileNm}"/>'); return false;">
		
		            <c:if test="${fn:length(result.progrmFileNm)> 22}">
				    	<c:out value="${fn:substring(result.progrmFileNm,0, 22)}"/>...
				    </c:if>
				    <c:if test="${fn:length(result.progrmFileNm)<= 22}">
				    	<c:out value="${result.progrmFileNm}"/>
				    </c:if>
		
		            </a></span>
		    </td>
		    <td class="lt_text" nowrap>
		    <c:if test="${fn:length(result.progrmKoreanNm)> 12}">
		    	<c:out value="${fn:substring(result.progrmKoreanNm,0, 12)}"/>...
		    </c:if>
		    <c:if test="${fn:length(result.progrmKoreanNm)<= 12}">
		    	<c:out value="${result.progrmKoreanNm}"/>
		    </c:if>
		    </td>
		    <td class="lt_text" nowrap>
		    <c:if test="${fn:length(result.URL)> 35}">
		    	<c:out value="${fn:substring(result.URL,0, 35)}"/>...
		    </c:if>
		    <c:if test="${fn:length(result.URL)<= 35}">
		    	<c:out value="${result.URL}"/>
		    </c:if>
		
		    </td>
		    <td class="lt_text" nowrap><c:out value="${result.progrmDc}"/></td>
		  </tr>
		</c:forEach>
	</tbody>
	</table>
	
	<c:if test="${fn:length(list_progrmmanage) > 0}">
		<!-- paging navigation -->
		<div class="pagination">
			<ul><ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/></ul>
		</div>
	</c:if>


</div><!-- end div board -->

<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="searchCondition"/>
<input type="hidden" name="checkedProgrmFileNmForDel" />
</form:form>
</body>
</html>
