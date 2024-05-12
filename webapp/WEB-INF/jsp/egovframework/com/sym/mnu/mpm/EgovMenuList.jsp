<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%--
 /**
  * @Class Name : EgovMenuList.jsp
  * @Description : 메뉴목록 화면
  * @Modification Information
  * @
  * @  수정일         수정자         수정내용
  * @ ----------- 	 --------    ---------------------------
  * @ 2009.03.10	   이용          최초 생성
  * @ 2013.10.04	  이기하         메뉴트리 위치 변경
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
<%
//String imagePath_icon   = "/images/egovframework/com/sym/mnu/mpm/icon/";
//String imagePath_button = "/images/egovframework/com/sym/mnu/mpm/button/";
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css">
<title>메뉴정보등록</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value="/validator.do" />"></script>
<script type="text/javascript">
var imgpath = "<c:url value='/images/egovframework/com/cmm/utl/'/>";
</script>
<script language="javascript1.2" type="text/javaScript" src="<c:url value='/js/egovframework/com/sym/mnu/mpm/EgovMenuList.js' />"></script>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 파일검색 화면 호출 함수
 ******************************************************** */
function searchFileNm() {
	document.menuManageVO.tmp_SearchElementName.value = "progrmFileNm";
	window.open("<c:url value='/sym/prm/EgovProgramListSearch.do' />",'','width=500,height=600');
}

/* ********************************************************
 * 메뉴등록 처리 함수
 ******************************************************** */
function insertMenuList() {
	if(!fn_validatorMenuList()){return;}
    if(document.menuManageVO.tmp_CheckVal.value == "U"){alert("상세조회시는 수정혹은 삭제만 가능합니다."); return;}
	document.menuManageVO.action = "<c:url value='/sym/mnu/mpm/EgovMenuListInsert.do'/>";
	menuManageVO.submit();

}

/* ********************************************************
 * 메뉴수정 처리 함수
 ******************************************************** */
function updateMenuList() {
    if(!fn_validatorMenuList()){return;}
    if(document.menuManageVO.tmp_CheckVal.value != "U"){alert("상세조회시는 수정혹은 삭제만 가능합니다. 초기화 하신 후 등록하세요."); return;}
	document.menuManageVO.action = "<c:url value='/sym/mnu/mpm/EgovMenuListUpdt.do'/>";
	menuManageVO.submit();
}

/* ********************************************************
 * 메뉴삭제 처리 함수
 ******************************************************** */
function deleteMenuList() {
    if(!fn_validatorMenuList()){return;}
    if(document.menuManageVO.tmp_CheckVal.value != "U"){alert("상세조회시는 수정혹은 삭제만 가능합니다."); return;}
	document.menuManageVO.action = "<c:url value='/sym/mnu/mpm/EgovMenuListDelete.do'/>";
	menuManageVO.submit();
}

/* ********************************************************
 * 메뉴리스트 조회 함수
 ******************************************************** */
function selectMenuList() {
    document.menuManageVO.action = "<c:url value='/sym/mnu/mpm/EgovMenuListSelect.do'/>";
    document.menuManageVO.submit();
}

/* ********************************************************
 * 메뉴이동 화면 호출 함수
 ******************************************************** */
function mvmnMenuList() {
	window.open("<c:url value='/sym/mnu/mpm/EgovMenuListSelectMvmn.do' />",'Pop_Mvmn','scrollbars=yes,width=600,height=600');
}

/* ********************************************************
 * 초기화 함수
 ******************************************************** */
function initlMenuList() {
	document.menuManageVO.menuNo.value="";
	document.menuManageVO.menuOrdr.value="";
	document.menuManageVO.menuNm.value="";
	document.menuManageVO.upperMenuId.value="";
	document.menuManageVO.menuDc.value="";
	document.menuManageVO.relateImagePath.value="";
	document.menuManageVO.relateImageNm.value="";
	document.menuManageVO.progrmFileNm.value="";
	document.menuManageVO.menuNo.readOnly=false;
	document.menuManageVO.tmp_CheckVal.value = "";
}

/* ********************************************************
 * 조회 함수

 ******************************************************** */
function selectMenuListTmp() {
	document.menuManageVO.req_RetrunPath.value = "/sym/mnu/mpm/EgovMenuList";
    document.menuManageVO.action = "<c:url value='/sym/mnu/mpm/EgovMenuListSelectTmp.do'/>";
    document.menuManageVO.submit();
}

/* ********************************************************
 * 상세내역조회 함수
 ******************************************************** */
 function choiceNodes(nodeNum) {
		var nodeValues = treeNodes[nodeNum].split("|");
		document.menuManageVO.menuNo.value = nodeValues[4];
		document.menuManageVO.menuOrdr.value = nodeValues[5];
		document.menuManageVO.menuNm.value = nodeValues[6];
		document.menuManageVO.upperMenuId.value = nodeValues[7];
		document.menuManageVO.menuDc.value = nodeValues[8];
		document.menuManageVO.relateImagePath.value = nodeValues[9];
		document.menuManageVO.relateImageNm.value = nodeValues[10];
		document.menuManageVO.progrmFileNm.value = nodeValues[11];
		document.menuManageVO.menuNo.readOnly=true;
		document.menuManageVO.tmp_CheckVal.value = "U";
}

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


<form name="menuManageVO" action ="<c:url value='/sym/mnu/mpm/EgovMenuListInsert.do' />" method="post">
<input type="hidden" name="req_RetrunPath" value="/sym/mnu/mpm/EgovMenuList">
<div id="main" style="display:">

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="">&nbsp;메뉴 목록</h1></td>
 </tr>
</table>


<table width="717" cellpadding="8" class="table-search" border="0">
  <tr>
   <td width="240" class="title_left" rowspan='2'>
	<c:forEach var="result" items="${list_menulist}" varStatus="status" >
	<input type="hidden" name="tmp_menuNmVal" value="${result.menuNo}|${result.upperMenuId}|${result.menuNm}|${result.progrmFileNm}|${result.menuNo}|${result.menuOrdr}|${result.menuNm}|${result.upperMenuId}|${result.menuDc}|${result.relateImagePath}|${result.relateImageNm}|${result.progrmFileNm}|">
	</c:forEach>

<div class="tree" style="position:absolute; left:0px; top:100px; width:240px; height:300px; z-index:10; overflow:scroll">
	<script language="javascript" type="text/javaScript">
		    var chk_Object = true;
		    var chk_browse = "";
			if (eval(document.menuManageVO.req_RetrunPath)=="[object]") chk_browse = "IE";
			if (eval(document.menuManageVO.req_RetrunPath)=="[object NodeList]") chk_browse = "Fox";
			if (eval(document.menuManageVO.req_RetrunPath)=="[object Collection]") chk_browse = "safai";

			var Tree = new Array;
			if(chk_browse=="IE"&&eval(document.menuManageVO.tmp_menuNmVal)!="[object]"){
			   alert("메뉴 목록 데이타가 존재하지 않습니다.");
			   chk_Object = false;
			}
			if(chk_browse=="Fox"&&eval(document.menuManageVO.tmp_menuNmVal)!="[object NodeList]"){
			   alert("메뉴 목록 데이타가 존재하지 않습니다.");
			   chk_Object = false;
			}
			if(chk_browse=="safai"&&eval(document.menuManageVO.tmp_menuNmVal)!="[object Collection]"){
				   alert("메뉴 목록 데이타가 존재하지 않습니다.");
				   chk_Object = false;
			}
			if( chk_Object ){
				for (var j = 0; j < document.menuManageVO.tmp_menuNmVal.length; j++) {
					Tree[j] = document.menuManageVO.tmp_menuNmVal[j].value;
			    }
			    createTree(Tree);
            }else{
                alert("메뉴가 존재하지 않습니다. 메뉴 등록 후 사용하세요.");
            }
	</script>
</div>

   </td>
   <td width="*" class="title_left">
	   <table border="0" cellspacing="0" cellpadding="0" align="left">
		<tr>
          <td width="90%"></td>
          <td><span class="button"><a href="<c:url value='/sym/mnu/mpm/EgovMenuListSelect.do'/>" onclick="initlMenuList(); return false;">초기화</a></span></td>
          <td width="2%"></td>
          <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="insertMenuList(); return false;"></span></td>
          <td width="2%"></td>
          <td><span class="button"><a href="#LINK" onclick="updateMenuList(); return false;"><spring:message code="button.update" /></a></span></td>
          <td width="2%"></td>
          <td><span class="button"><a href="#LINK" onclick="deleteMenuList(); return false;"><spring:message code="button.delete" /></a></span></td>
		</tr>
	   </table>
   </td>
 </tr>
 <tr>

   <td width="70%" class="title_left">

		<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="메뉴리스트정보" >
	<caption>메뉴리스트정보 </caption>
		  <tr>
		    <th width="30%" height="23" class="required_text"  scope="row"><label for="menuNo">메뉴No</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" ></th>
		    <td width="70%" nowrap>
		      &nbsp;
		      <input name="menuNo" type="text" size="10" value=""  maxlength="10" title="메뉴No">
		    </td>
		  </tr>
		  <tr>
		    <th width="30%" height="23" class="required_text"  scope="row"><label for="menuOrdr">메뉴순서</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" ></th>
		    <td width="70%" nowrap>
		      &nbsp; <input name="menuOrdr" type="text" size="10" value=""  maxlength="10" title="메뉴순서">
		    </td>
		  </tr>
		  <tr>
		    <th width="30%" height="23" class="required_text"  scope="row"><label for="menuNm">메뉴명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" ></th>
		    <td width="70%" nowrap>
		      &nbsp; <input name="menuNm" type="text" size="30" value=""  maxlength="30" title="메뉴명">
		    </td>
		  </tr>
		  <tr>
		    <th width="30%" height="23" class="required_text"  scope="row"><label for="upperMenuId">상위메뉴No</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" ></th>
		    <td width="70%" nowrap>&nbsp;
		    <input name="upperMenuId" type="text" size="10" value=""  maxlength="10" title="상위메뉴No">
	        <a href="/sym/mnu/mpm/EgovMenuListSelectMvmn.do" target="_blank" title="새창으로" onClick="mvmnMenuList();return false;"  style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />"
	         alt='' width="15" height="15" />(메뉴선택 검색)</a>
		    </td>
		  </tr>
		  <tr>
		    <th width="30%" height="23" class="required_text"  scope="row"><label for="progrmFileNm">파일명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" ></th>
		    <td width="70%" nowrap>
	        &nbsp;
	        <input name="progrmFileNm" type="text" size="30" value=""  maxlength="60" title="파일명">
	        <a href="/sym/prm/EgovProgramListSearch.do" target="_blank" title="새창으로" onClick="searchFileNm();return false;"  style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />"
	         alt='' width="15" height="15" />(프로그램파일명 검색)</a>
		    </td>
		  </tr>
		  <tr>
		    <th width="30%" height="23" class="required_text"  scope="row"><label for="relateImageNm">관련이미지명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" ></th>
		    <td width="70%" nowrap>
		      &nbsp; <input name="relateImageNm" type="text" size="30" value=""  maxlength="30" title="관련이미지명">
		    </td>
		  </tr>
		  <tr>
		    <th width="30%" height="23" class="required_text"  scope="row"><label for="relateImagePath">관련이미지경로</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" ></th>
		    <td width="70%" nowrap>
		      &nbsp; <input name="relateImagePath" type="text" size="30" value=""  maxlength="60" title="관련이미지경로">
		    </td>
		  </tr>
		  <tr>
		    <th width="30%" height="23" class="required_text"  scope="row"><label for="menuDc">메뉴설명</label></th>
		    <td width="70%">
		      &nbsp; <textarea name="menuDc" class="textarea"  cols="45" rows="8"  style="width:350px;" title="메뉴설명"></textarea>
		    </td>
		  </tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td height="10"></td>
		  </tr>
		</table>

   </td>
 </tr>
</table>
<br>
    <input type="hidden" name="tmp_SearchElementName" value="">
    <input type="hidden" name="tmp_SearchElementVal" value="">
    <input type="hidden" name="tmp_CheckVal" value="">
</DIV>

</form>

<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</DIV>
</body>
</html>

