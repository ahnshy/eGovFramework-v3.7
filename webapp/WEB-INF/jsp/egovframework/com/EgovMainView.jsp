<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/mpm.css' />" type="text/css">
<title>안전행전부 공통서비스 테스트 사이트(업무사용자)</title>
<script type="text/javascript">
var getContextPath = '<c:out value="${pageContext.request.contextPath}" />';
</script>
<script language="javascript" src="<c:url value='/js/egovframework/com/main.js' />"></script>
<script language="javascript">
function chk_all(val) {

	var arr_chk = document.getElementsByName("chk");

		if (val == "Y") {

			for(i=0;i< arr_chk.length; i++) {
				arr_chk[i].checked =true;
			}
		}
		else if(val == "N") {
			for(i=0;i< arr_chk.length; i++) {
				arr_chk[i].checked =false;
			}
		}
}
</script>
</head>

<body topmargin="0" leftmargin="0">
<c:import url="./head.jsp" />
<div >
<table width="900" border="0" cellspacing="0" cellpadding="0">
    <tr>
<!-- 본문시작 -->
    <td valign="top">
    	<TABLE>
			<TR>
				<TD width="450">
							<TABLE>
							<TR>
								<TD>
									<table width="450" border="0" cellspacing="0" cellpadding="0" style="tableNoWrap">
															<tr>
																<td>
																	<table border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />"  border="0"></td>
																		<td>공지사항</td>
																	</tr>
																	</table>
																</td>
															</tr>
															<tr height="120" width="430">
																<td bgcolor="#B6D58F" align="center">
																	<table border="0" bgcolor="FFFFFF" width="430" >
																		<tr>

																			<td valign="middle" align="center" bgcolor="2981AD" width="110" height="30">
																			<a class="flash" href="http://www.korea.kr:80/newsWeb/appmanager/portal/news2?_nfpb=true&_pageLabel=news_page_02&_mode=view&_nfls=false">
																			<font style="font-size:9pt;color:#fff;"><b>대한민국 정책포털</b></font></a></td>

																			<!-- <td bgcolor="#FFFFEE" style="padding-top:2px; padding-left:5px;">
																			<iframe src="http://www.korea.kr/newsWeb/pages/tiles/today/bannerNews1.jsp" width="250" height="20" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"  style="display:block;border:0px;" ></iframe>
																			</td> -->

																		</tr>
																	</table>
																</td>
															</tr>
			    					 </table>
			    				</TD>
							</TR>
							</TR>
							<tr height="10"><td>&nbsp; </td></tr>
							<TR>
								<TD>
									<table width="450" border="0" cellspacing="0" cellpadding="0" style="tableNoWrap">
															<tr>
																<td>
																	<table border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />"  border="0"></td>
																		<td>생성된 게시판 목록</td>
																	</tr>
																	</table>
																</td>
															</tr>
															<tr height="120" width="430">
																<td bgcolor="#B6D58F" align="center">
																	<table border="0" bgcolor="FFFFFF" width="430">
																		<tr height="100">
																			<td>&nbsp;</td>
																		</tr>
																	</table>
																</td>
															</tr>
			    					 </table>
								</TD>
							</TR>
							</TR>
							<tr height="10"><td>&nbsp; </td></tr>
							<TR>
								<TD>
									<table width="450" border="0" cellspacing="0" cellpadding="0" style="tableNoWrap">
															<tr>
																<td>
																	<table border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />"  border="0"></td>
																		<td>생성된 커뮤니티 목록</td>
																	</tr>
																	</table>
																</td>
															</tr>
															<tr height="120" width="450">
																<td bgcolor="#B6D58F" align="center">
																	<table border="0" bgcolor="FFFFFF" width="430" >
																		<tr height="100">
																			<td>&nbsp;
																				<c:import url="/cop/cus/CmmntyListPortlet.do" />
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
			    					 </table>
								</TD>
							</TR>
							</TABLE>
				</TD>
				<TD width="450">
							<TABLE>
										<TR>
											<TD>

												<script language="javascript">
												function fnEgovTabNavigation(objName){
													var objList = new Array('DIV_01','DIV_02','DIV_03');

													for(var i=0;i<objList.length;i++) {

														if(objList[i] == objName){
															document.getElementById(objList[i]).style.display  = '';
														}else{
															document.getElementById(objList[i]).style.display  = 'none';
														}
													}
												}
												</script>
												<table width="450" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td>
																	<table border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td><img src="<c:url value='/images/egovframework/com/TAB_01.gif' />"  border="0" name="TAB_01" id="TAB_01" style="cursor:pointer;" onClick="fn_changeTAB(this);fnEgovTabNavigation('DIV_01');" onMouseOver="fn_swapImage(this);" onMouseOut="fn_swapImgRestore(this);"></td>
																		<td><img src="<c:url value='/images/egovframework/com/TAB_02_o.gif' />"   border="0" name="TAB_02" id="TAB_02" style="cursor:pointer;" onClick="fn_changeTAB(this);fnEgovTabNavigation('DIV_02');" onMouseOver="fn_swapImage(this);" onMouseOut="fn_swapImgRestore(this);"></td>
																		<td><img src="<c:url value='/images/egovframework/com/TAB_03.gif' />"   border="0" name="TAB_03" id="TAB_03" style="cursor:pointer;" onClick="fn_changeTAB(this);fnEgovTabNavigation('DIV_03');" onMouseOver="fn_swapImage(this);" onMouseOut="fn_swapImgRestore(this);"></td>
																	</tr>
																	</table>
																</td>
															</tr>
															<tr height="100">
																<td bgcolor="#B6D58F" align="center">
																	<!-- 개인정보 -->
																	<div id="DIV_01" name="DIV_01" style="display:none">
																	<table border="0" bgcolor="FFFFFF" width="430" height="80">
																		<tr>
																			<td>개인정보</td>
																		</tr>
																	</table>
																	</div>
																	<!-- 부서일정관리  -->
																	<div id="DIV_02" name="DIV_02" style="display:;width:430px;height:80px;background-color:#FFFFFF;">
																	<c:import charEncoding="utf-8" url="/cop/smt/sdm/EgovDeptSchdulManageMainList.do" ></c:import>
																	</div>
																	<!-- 일정관리 -->
																	<div id="DIV_03" name="DIV_03" style="display:none;width:430px;height:80px;background-color:#FFFFFF;">
																	<c:import charEncoding="utf-8" url="/cop/smt/sim/EgovIndvdlSchdulManageMainList.do" ></c:import>
																	</div>
																</td>
															</tr>
			    								</table>
											</TD>
										</TR>
										<tr height="10"><td>&nbsp; </td></tr>
										<TR>
											<TD>
											<table width="450" border="0" cellspacing="0" cellpadding="0" style="tableNoWrap">
															<tr>
																<td>
																	<table border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />"  border="0" name="TAB_01" id="TAB_01" style="cursor:pointer;" onClick="fn_changeTAB(this);" onMouseOver="fn_swapImage(this);" onMouseOut="fn_swapImgRestore(this);"></td>
																		<td>환율정보</td>
															</tr>
																	</table>
																</td>
															</tr>
															<tr height="300">
																<td bgcolor="#B6D58F" align="center">
																	<table border="0" bgcolor="FFFFFF" width="300" >
																		<tr height="280">
																			<td><iframe src="http://community.fxkeb.com/fxportal/jsp/RS/DEPLOY_EXRATE/fxrate_all.html" width="430"  height="280" border="0" frameborder="no" scrolling="no" marginwidth="0" hspace="0" vspace="0"></iframe>
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
			    								</table>
											</TD>
										</TR>
							</TABLE>
				</TD>
			</TR>
			</TABLE>
    </td>
        </tr>
        </table>
<!-- 배너추가 -->
<table border="0" cellspacing="0" cellpadding="0" width="900">
  <tr>
    <td align="center">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center">
                <c:import url="/uss/ion/bnr/getBannerImage.do" charEncoding="utf-8">
                    <c:param name="atchFileId" value="${banner.bannerImageFile}" />
                </c:import>
            </td>
          </tr>
        </table>
    </td>
  </tr>
</table>
<!-- 배너추가 -->

<!-- bottom -->
<c:import url="./main_bottom.jsp" />
</div>
</body>
</html>
