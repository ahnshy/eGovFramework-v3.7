<%
/**
 * @Class Name : EgovMenuManage.jsp
 * @Description : 메뉴관리 조회 화면
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.03.10    이용          최초 생성
 	  2011.07.27     서준식          메뉴 삭제 자바스크립트 오류 수정
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

function linkPage(pageNo){
    document.progrmManageForm.searchCondition.value = "1";
    document.progrmManageForm.pageIndex.value = pageNo;
    document.progrmManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
    document.progrmManageForm.submit();
}


function press() {

    if (event.keyCode==13) {
    	linkPage('1');
    }
}

/* ********************************************************
 * 모두선택 처리 함수
 ******************************************************** */
function fCheckAll() {
    var checkField = document.menuManageForm.checkField;
    if(document.menuManageForm.checkAll.checked) {
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
function fDeleteMenuList() {
    var checkField = document.menuManageForm.checkField;
    var menuNo = document.menuManageForm.checkMenuNo;
    var checkMenuNos = "";
    var checkedCount = 0;
    if(checkField) {

    	if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkMenuNos += ((checkedCount==0? "" : ",") + menuNo[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkMenuNos = menuNo.value;
            }
        }
    }
    if(checkedCount ==0){
		alert("선택된 메뉴가 없습니다.");
		return false;
    }

    document.menuManageForm.checkedMenuNoForDel.value=checkMenuNos;
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageListDelete.do'/>";
    document.menuManageForm.submit();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//	document.menuManageForm.searchKeyword.value =
	document.menuManageForm.pageIndex.value = pageNo;
	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
   	document.menuManageForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectMenuManageList() {
	document.menuManageForm.pageIndex.value = 1;
	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
	document.menuManageForm.submit();
}

/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertMenuManage() {
   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuRegistInsert.do'/>";
   	document.menuManageForm.submit();
}

/* ********************************************************
 * 일괄처리 화면호출 함수
 ******************************************************** */
/* function bndeInsertMenuManage() {
	   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuRegistInsert.do'/>";
	   	document.menuManageForm.submit();
	}
 */
function bndeInsertMenuManage() {
   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuBndeRegist.do'/>";
   	document.menuManageForm.submit();
}
/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtMenuManageDetail(menuNo) {
	document.menuManageForm.req_menuNo.value = menuNo;
   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageListDetailSelect.do'/>";
   	document.menuManageForm.submit();
}
/* ********************************************************
 * 최초조회 함수
 ******************************************************** */
function fMenuManageSelect(){
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
    document.menuManageForm.submit();
}
</script>
</head>
<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>
<form:form name="menuManageForm" action="${pageContext.request.contextPath}/sym/mnu/mpm/EgovMenuManageSelect.do" method="post">
<div class="board">
	<h1>${pageTitle} <spring:message code="title.list" /></h1>
	<!-- 검색영역 -->
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li><div style="line-height:4px;">&nbsp;</div><div>메뉴명 검색 : </div></li><!-- 권한명 -->
			<!-- 검색키워드 및 조회버튼 -->
			<li style="border: 0px solid #d2d2d2;">
				<input class="s_input" name="searchKeyword" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="155" >
				<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
				<input type="button" class="s_btn" value="일괄등록" onclick="bndeInsertMenuManage(); return false;"  />
				<input type="button" class="s_btn" value="<spring:message code="button.create" />" onclick="insertMenuManage(); return false;"  />
				<input type="button" class="s_btn" value="<spring:message code="button.delete" />" onclick="fDeleteMenuList(); return false;"  />
			</li>
		</ul>
	</div>
	
	<!-- 목록영역 -->
	<table class="board_list" summary="메뉴관리 목록 <spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.list" /></caption>
	<colgroup>
		<col style="width: ;">
		<col style="width: ;">
	</colgroup>
	<thead>
		<tr>
		    <th class="title" width="30">
		       <input type="checkbox" name="checkAll" class="check2" onclick="javascript:fCheckAll();" title="전체선택"/>
		    </th>
		    <th class="title" width="100" scope="col">메뉴ID</th>
		    <th class="title" width="120" scope="col">메뉴한글명</th>
		    <th class="title" width="200" scope="col">프로그램파일명</th>
		    <th class="title" width="167" scope="col">메뉴설명</th>
		    <th class="title" width="100" scope="col">상위메뉴ID</th>
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
		    <td class="lt_text">
		       <input type="checkbox" name="checkField" class="check2" title="선택"/>
		       <input name="checkMenuNo" type="hidden" value="<c:out value='${result.menuNo}'/>"/>
		    </td>
		    <td class="lt_text"><c:out value="${result.menuNo}"/></td>
		    <td class="lt_text" style="cursor:hand;">
		       <span class="link"><a href="<c:url value='/sym/mnu/mpm/EgovMenuManageListDetailSelect.do?req_menuNo='/>${result.menuNo}" onclick="selectUpdtMenuManageDetail('<c:out value="${result.menuNo}"/>'); return false;"><c:out value="${result.menuNm}"/></a></span>
		    </td>
		    <td class="lt_text"><c:out value="${result.progrmFileNm}"/></td>
		    <td class="lt_text"><c:out value="${result.menuDc}"/></td>
		    <td class="lt_text"><c:out value="${result.upperMenuId}"/></td>
	  </tr>
	</c:forEach>
	</tbody>
	</table>
	
	<c:if test="${fn:length(list_menumanage) > 0}">
		<!-- paging navigation -->
		<div class="pagination">
			<ul><ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/></ul>
		</div>
	</c:if>


</div><!-- end div board -->


<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="searchCondition"/>
</form:form>
</body>
</html>
