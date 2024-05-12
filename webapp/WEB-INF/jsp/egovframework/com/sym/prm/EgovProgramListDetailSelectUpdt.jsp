<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
 /**
  * @Class Name : EgovProgramListDetailSelectUpdt.jsp
  * @Description : 프로그램목록 상세조회및 수정 화면
  * @Modification Ination
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
  //String imagePath_icon   = "/images/egovframework/com/sym/prm/icon/";
  //String imagePath_button = "/images/egovframework/com/sym/prm/button/";
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/sym/prm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/sym/prm/"/>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css">
<title>프로그램목록리스트</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="progrmManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 수정처리 함수
 ******************************************************** */
function updateProgramListManage(form) {
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateProgrmManageVO(form)){
			return;
		}else{
            form.action="<c:url value='/sym/prm/EgovProgramListDetailSelectUpdt.do' />";
			form.submit();
		}
	}
}

/* ********************************************************
 * 삭제처리함수
 ******************************************************** */
function deleteProgramListManage(form) {
	if(confirm("<spring:message code="common.delete.msg" />")){
        form.action="<c:url value='/sym/prm/EgovProgramListManageDelete.do' />";
		form.submit();
	}
}

/* ********************************************************
 * 목록조회 함수
 ******************************************************** */
function selectList(){
	location.href = "<c:url value='/sym/prm/EgovProgramListManageSelect.do' />";
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

<form:form commandName="progrmManageVO" method="post">
<DIV id= "main">

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="">&nbsp;프로그램목록 상세조회 /수정</h1></td>
 </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="프로그램목록 상세조회 /수정">
   	<caption>프로그램목록 상세조회 /수정</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="progrmFileNm">프로그램파일명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>
      <form:input  path="progrmFileNm" size="50"  maxlength="50" title="프로그램파일명"/>
      <form:errors path="progrmFileNm"/>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="progrmStrePath">저장경로</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>
      <form:input  path="progrmStrePath" size="50"  maxlength="50" title="저장경로"/>
      <form:errors path="progrmStrePath"/>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="progrmKoreanNm">한글명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>
      <form:input path="progrmKoreanNm" size="60"  maxlength="60"  title="한글명"/>
      <form:errors path="progrmKoreanNm" />
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="URL">URL</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>
      <form:input path="URL" size="60"  maxlength="60" title="URL" />
      <form:errors path="URL" />
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" scope="row"><label for="progrmDc">프로그램설명</label></th>
    <td>
      <form:textarea path="progrmDc" rows="14" cols="75" title="프로그램설명"/>
      <form:errors path="progrmDc"/>
    </td>
  </tr>
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
  <tr>
    <td>
		<table width="717" border="0" cellspacing="0" cellpadding="0" align="right">
		<tr>
		  <td width="600">&nbsp;</td>

          <td><span class="button"><a href="<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>" onclick="selectList(); return false;">목록</a></span></td>
          <td width="5%"></td>
          <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="updateProgramListManage(document.forms[0]); return false;"></span></td>
          <td width="5%"></td>
          <td><span class="button"><a href="<c:url value='/sym/prm/EgovProgramListManageDelete.do'/>?progrmFileNm=<c:out value="${progrmManageVO.progrmFileNm  }"/>" onclick="deleteProgramListManage(document.forms[0]); return false;"><spring:message code="button.delete" /></a></span></td>
		</tr>
		</table>
    </td>
  </tr>
</table>

<br>

</DIV>
<input name="cmd" type="hidden" value="<c:out value='update'/>"/>
</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</DIV>
</body>
</html>

