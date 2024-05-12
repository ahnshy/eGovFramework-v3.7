<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
 /**
  * @Class Name : EgovMenuDetailSelectUpdt.jsp
  * @Description : 메뉴정보 상세조회및 수정 화면
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
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/sym/mnu/mpm/"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css" >
<title>메뉴상세조회및 수정</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="menuManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script language="javascript1.2" type="text/javaScript">
<!--

/* ********************************************************
* 입력값 validator 함수
******************************************************** */
function fn_validatorMenuList() {

	if(document.menuManageVO.menuNo.value == ""){alert("메뉴번호는 Not Null 항목입니다."); return false;}
	if(!checkNumber(document.menuManageVO.menuNo.value)){alert("메뉴번호는 숫자만 입력 가능합니다."); return false;}

	if(document.menuManageVO.menuOrdr.value == ""){alert("메뉴순서는 Not Null 항목입니다."); return false;}
	if(!checkNumber(document.menuManageVO.menuOrdr.value)){alert("메뉴순서는 숫자만 입력 가능합니다."); return false;}

	if(document.menuManageVO.upperMenuId.value == ""){alert("상위메뉴번호는 Not Null 항목입니다."); return false;}
	if(!checkNumber(document.menuManageVO.upperMenuId.value)){alert("상위메뉴번호는 숫자만 입력 가능합니다."); return false;}

	if(document.menuManageVO.progrmFileNm.value == ""){alert("프로그램파일명은 Not Null 항목입니다."); return false;}
	if(document.menuManageVO.menuNm.value == ""){alert("메뉴명은 Not Null 항목입니다."); return false;}

   return true;
}


/* ********************************************************
* 필드값 Number 체크 함수
******************************************************** */
function checkNumber(str) {
   var flag=true;
   if (str.length > 0) {
       for (i = 0; i < str.length; i++) {
           if (str.charAt(i) < '0' || str.charAt(i) > '9') {
               flag=false;
           }
       }
   }
   return flag;
}


/* ********************************************************
 * 메뉴이동 화면 호출 함수
 ******************************************************** */
function mvmnMenuList() {
	window.open("<c:url value='/sym/mnu/mpm/EgovMenuListSelectMvmn.do' />",'Pop_Mvmn','scrollbars=yes,width=600,height=600');
}

/* ********************************************************
 * 수정처리 함수
 ******************************************************** */
function updateMenuManage(form) {
	if(!fn_validatorMenuList()){return;}
	if(confirm("<spring:message code="common.save.msg"/>")){

		if(!validateMenuManageVO(form)){
			return;
		}else{
            form.action="<c:url value='/sym/mnu/mpm/EgovMenuDetailSelectUpdt.do' />";
			form.submit();
		}
	}
}

/* ********************************************************
 * 삭제처리함수
 ******************************************************** */
function deleteMenuManage(form) {
	if(confirm("<spring:message code="common.delete.msg"/>")){
        form.action="<c:url value='/sym/mnu/mpm/EgovMenuManageDelete.do' />";
		form.submit();
	}
}
/* ********************************************************
 * 파일목록조회  함수
 ******************************************************** */
function searchFileNm() {
	document.all.tmp_SearchElementName.value = "progrmFileNm";
	window.open("<c:url value='/sym/prm/EgovProgramListSearch.do' />",'','width=500,height=600');
}
/* ********************************************************
 * 목록조회 함수
 ******************************************************** */
function selectList(){
	location.href = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do' />";
}

/* ********************************************************
 * 파일명 엔터key 목록조회  함수
 ******************************************************** */
function press() {
    if (event.keyCode==13) {
    	searchFileNm();    // 원래 검색 function 호출
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

<form:form commandName="menuManageVO" name="menuManageVO"  action ="<c:url value='/sym/mnu/mpm/EgovMenuDetailSelectUpdt.do' />" method="post">

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;메뉴상세조회및 수정</h1></td>
 </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="메뉴상세정보" >
	<caption>메뉴상세정보 </caption>
  <tr>
    <th width="15%" height="23" class="required_text" scope="row"><label for="menuNo">메뉴No</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="35%" >
      &nbsp;<c:out value="${menuManageVO.menuNo}"/>

      <form:hidden path="menuNo" />
      <form:errors path="menuNo" />
    </td>
    <th width="15%" height="23" class="required_text" scope="row"><label for="menuOrdr">메뉴순서</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="35%" >
      &nbsp;
      <form:input path="menuOrdr" size="10" maxlength="10" title="메뉴순서"/>
      <form:errors path="menuOrdr" />
    </td>
  </tr>
  <tr>
    <th width="15%" height="23" class="required_text" scope="row"><label for="menuNm">메뉴명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="35%" >&nbsp;
      <form:input path="menuNm" size="30" maxlength="30" title="메뉴명"/>
      <form:errors path="menuNm" />
    </td>
    <th width="15%" height="23" class="required_text" scope="row"><label for="upperMenuId">상위메뉴No</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="35%" >&nbsp;
      <form:input path="upperMenuId" size="10" maxlength="10" title="상위메뉴No"/>
      <form:errors path="upperMenuId" />
      <a href="<c:url value='/sym/mnu/mpm/EgovMenuListSelectMvmn.do' />" target="_blank" title="새창으로" onClick="mvmnMenuList();return false;"  style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />"
	         alt='' width="15" height="15" />(메뉴선택 검색)</a>
    </td>
  </tr>
  <tr>
    <th width="15%" height="23" class="required_text" scope="row"><label for="progrmFileNm">파일명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="85%" colspan="3">
        &nbsp;
    	<form:input path="progrmFileNm" size="60" maxlength="60" onkeypress="press();" title="파일명"/>
	    <form:errors path="progrmFileNm" />
        <a href="<c:url value='/sym/prm/EgovProgramListSearch.do' />" target="_blank" title="새창으로 이동" onclick="searchFileNm();return false;"  style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />"
         alt='' width="15" height="15" />(프로그램파일명 검색)</a>
    </td>
  </tr>
  <tr>
    <th width="15%" height="23" class="required_text" scope="row"><label for="relateImageNm">관련이미지명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="35%" >&nbsp;
      <form:input path="relateImageNm" size="30" maxlength="30" title="관련이미지명"/>
      <form:errors path="relateImageNm" />
    </td>
    <th width="15%" height="23" class="required_text" scope="row"><label for="relateImagePath">관련이미지경로</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
    <td width="35%" >&nbsp;
      <form:input path="relateImagePath" size="30" maxlength="30" title="관련이미지경로"/>
      <form:errors path="relateImagePath" />
    </td>
  </tr>
  <tr>
    <th width="15%" height="23" class="required_text" scope="row"><label for="menuDc">메뉴설명</label></th>
    <td colspan="3">&nbsp;
      <form:textarea path="menuDc" rows="14" cols="75" title="메뉴설명"/>
      <form:errors path="menuDc"/>
    </td>
  </tr>
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
  <tr>
    <td height="10">
		<table width="717" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td width="90%"></td>
          <td><span class="button"><a href="<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>" onclick="selectList(); return false;">목록</a></span></td>
          <td width="2%"></td>
          <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="updateMenuManage(document.forms[0]); return false;"/></span></td>
          <td width="2%"></td>
          <td><span class="button"><a href="<c:url value='/uss/ion/evt/selectEventRceptList.do'/>?menuNo=<c:out value='${menuManageVO.menuNo}'/>" onclick="deleteMenuManage(document.forms[0]); return false;"><spring:message code="button.delete" /></a></span></td>
		</tr>
		</table>
    </td>
  </tr>
</table>
<br/>
    <input type="hidden" name="tmp_SearchElementName" value=""/>
    <input type="hidden" name="tmp_SearchElementVal" value=""/>
    <input name="cmd"    type="hidden"   value="update"/>
</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</div>
</body>
</html>

