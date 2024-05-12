<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>색상선택</title>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialogCallee.js'/>" ></script>
<script type="text/javaScript" language="javascript">
	/* ********************************************************
	 * 부모창에 변경 색상코드 넘겨주기
	 ******************************************************** */
	function r(hval) {
		getDialogArguments();
		var opener = window.dialogArguments;
		opener.document.IndvdlPgeManage.getElementById("titleBarColor").value = hval;
	}

	/* ********************************************************
	 * 컬러chooser 창 닫기
	 ******************************************************** */
	function hideColorTable() {
		window.close();
	}
</script>
</head>
<body leftmargin="0" topmargin="0">
    <!-- 색상 선택 테이블 -->
    <DIV align="center" id="colorTable" onClick="hideColorTable(); return false;">
        <TABLE borderColor="black" cellSpacing="0" borderColorDark="white" cellPadding="0" borderColorLight="black" border="1">
            <TR>
                <TD height="10" width="10" bgColor="black"><A onmouseover="r('#000000');return false;"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#000033"><A onmouseover="r('#000033'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#000066"><A onmouseover="r('#000066'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#000099"><A onmouseover="r('#000099'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#0000cc"><A onmouseover="r('#0000cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="blue"><A onmouseover="r('#0000ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#006600"><A onmouseover="r('#006600'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#006633"><A onmouseover="r('#006633'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#006666"><A onmouseover="r('#006666'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#006699"><A onmouseover="r('#006699'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#0066cc"><A onmouseover="r('#0066cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#0066ff"><A onmouseover="r('#0066ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#00cc00"><A onmouseover="r('#00cc00'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#00cc33"><A onmouseover="r('#00cc33'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#00cc66"><A onmouseover="r('#00cc66'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#00cc99"><A onmouseover="r('#00cc99'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#00cccc"><A onmouseover="r('#00cccc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#00ccff"><A onmouseover="r('#00ccff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
            </TR>
            <TR>
                <TD height="10" width="10" bgColor="#003300"><A onmouseover="r('#003300'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#003333"><A onmouseover="r('#003333'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#003366"><A onmouseover="r('#003366'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#003399"><A onmouseover="r('#003399'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#0033cc"><A onmouseover="r('#0033cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#0033ff"><A onmouseover="r('#0033ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#009900"><A onmouseover="r('#009900'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#009933"><A onmouseover="r('#009933'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#009966"><A onmouseover="r('#009966'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#009999"><A onmouseover="r('#009999'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#0099cc"><A onmouseover="r('#0099cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#0099ff"><A onmouseover="r('#0099ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="lime"><A onmouseover="r('#00ff00'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#00ff33"><A onmouseover="r('#00ff33'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#00ff66"><A onmouseover="r('#00ff66'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#00ff99"><A onmouseover="r('#00ff99'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#00ffcc"><A onmouseover="r('#00ffcc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="aqua"><A onmouseover="r('#00ffff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
            </TR>
            <TR>
                <TD height="10" width="10" bgColor="#330000"><A onmouseover="r('#330000'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#330033"><A onmouseover="r('#330033'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#330066"><A onmouseover="r('#330066'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#330099"><A onmouseover="r('#330099'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#3300cc"><A onmouseover="r('#3300cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#3300ff"><A onmouseover="r('#3300ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#336600"><A onmouseover="r('#336600'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#336633"><A onmouseover="r('#336633'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#336666"><A onmouseover="r('#336666'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#336699"><A onmouseover="r('#336699'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#3366cc"><A onmouseover="r('#3366cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#3366ff"><A onmouseover="r('#3366ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#33cc00"><A onmouseover="r('#33cc00'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#33cc33"><A onmouseover="r('#33cc33'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#33cc66"><A onmouseover="r('#33cc66'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#33cc99"><A onmouseover="r('#33cc99'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#33cccc"><A onmouseover="r('#33cccc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#33ccff"><A onmouseover="r('#33ccff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
            </TR>
            <TR>
                <TD height="10" width="10" bgColor="#333300"><A onmouseover="r('#333300'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#333333"><A onmouseover="r('#333333'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#333366"><A onmouseover="r('#333366'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#333399"><A onmouseover="r('#333399'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#3333cc"><A onmouseover="r('#3333cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#3333ff"><A onmouseover="r('#3333ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#339900"><A onmouseover="r('#339900'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#339933"><A onmouseover="r('#339933'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#339966"><A onmouseover="r('#339966'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#339999"><A onmouseover="r('#339999'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#3399cc"><A onmouseover="r('#3399cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#3399ff"><A onmouseover="r('#3399ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#33ff00"><A onmouseover="r('#33ff00'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#33ff33"><A onmouseover="r('#33ff33'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#33ff66"><A onmouseover="r('#33ff66'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#33ff99"><A onmouseover="r('#33ff99'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#33ffcc"><A onmouseover="r('#33ffcc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#33ffff"><A onmouseover="r('#33ffff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
            </TR>
            <TR>
                <TD height="10" width="10" bgColor="#660000"><A onmouseover="r('#660000'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#660033"><A onmouseover="r('#660033'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#660066"><A onmouseover="r('#660066'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#660099"><A onmouseover="r('#660099'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#6600cc"><A onmouseover="r('#6600cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#6600ff"><A onmouseover="r('#6600ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#666600"><A onmouseover="r('#666600'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#666633"><A onmouseover="r('#666633'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#666666"><A onmouseover="r('#666666'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#666699"><A onmouseover="r('#666699'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#6666cc"><A onmouseover="r('#6666cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#6666ff"><A onmouseover="r('#6666ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#66cc00"><A onmouseover="r('#66cc00'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#66cc33"><A onmouseover="r('#66cc33'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#66cc66"><A onmouseover="r('#66cc66'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#66cc99"><A onmouseover="r('#66cc99'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#66cccc"><A onmouseover="r('#66cccc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#66ccff"><A onmouseover="r('#66ccff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
            </TR>
            <TR>
                <TD height="10" width="10" bgColor="#663300"><A onmouseover="r('#663300'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#663333"><A onmouseover="r('#663333'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#663366"><A onmouseover="r('#663366'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#663399"><A onmouseover="r('#663399'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#6633cc"><A onmouseover="r('#6633cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#6633ff"><A onmouseover="r('#6633ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#669900"><A onmouseover="r('#669900'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#669933"><A onmouseover="r('#669933'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#669966"><A onmouseover="r('#669966'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#669999"><A onmouseover="r('#669999'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#6699cc"><A onmouseover="r('#6699cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#6699ff"><A onmouseover="r('#6699ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#66ff00"><A onmouseover="r('#66ff00'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#66ff33"><A onmouseover="r('#66ff33'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#66ff66"><A onmouseover="r('#66ff66'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#66ff99"><A onmouseover="r('#66ff99'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#66ffcc"><A onmouseover="r('#66ffcc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#66ffff"><A onmouseover="r('#66ffff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
            </TR>
            <TR>
                <TD height="10" width="10" bgColor="#990000"><A onmouseover="r('#990000'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#990033"><A onmouseover="r('#990033'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#990066"><A onmouseover="r('#990066'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#990099"><A onmouseover="r('#990099'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#9900cc"><A onmouseover="r('#9900cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#9900ff"><A onmouseover="r('#9900ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#996600"><A onmouseover="r('#996600'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#996633"><A onmouseover="r('#996633'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#996666"><A onmouseover="r('#996666'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#996699"><A onmouseover="r('#996699'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#9966cc"><A onmouseover="r('#9966cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#9966ff"><A onmouseover="r('#9966ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#99cc00"><A onmouseover="r('#99cc00'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#99cc33"><A onmouseover="r('#99cc33'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#99cc66"><A onmouseover="r('#99cc66'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#99cc99"><A onmouseover="r('#99cc99'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#99cccc"><A onmouseover="r('#99cccc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#99ccff"><A onmouseover="r('#99ccff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
            </TR>
            <TR>
                <TD height="10" width="10" bgColor="#993300"><A onmouseover="r('#993300'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#993333"><A onmouseover="r('#993333'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#993366"><A onmouseover="r('#993366'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#993399"><A onmouseover="r('#993399'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#9933cc"><A onmouseover="r('#9933cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#9933ff"><A onmouseover="r('#9933ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#999900"><A onmouseover="r('#999900'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#999933"><A onmouseover="r('#999933'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#999966"><A onmouseover="r('#999966'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#999999"><A onmouseover="r('#999999'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#9999cc"><A onmouseover="r('#9999cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#9999ff"><A onmouseover="r('#9999ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#99ff00"><A onmouseover="r('#99ff00'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#99ff33"><A onmouseover="r('#99ff33'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#99ff66"><A onmouseover="r('#99ff66'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#99ff99"><A onmouseover="r('#99ff99'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#99ffcc"><A onmouseover="r('#99ffcc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#99ffff"><A onmouseover="r('#99ffff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
            </TR>
            <TR>
                <TD height="10" width="10" bgColor="#cc0000"><A onmouseover="r('#cc0000'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc0033"><A onmouseover="r('#cc0033'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc0066"><A onmouseover="r('#cc0066'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc0099"><A onmouseover="r('#cc0099'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc00cc"><A onmouseover="r('#cc00cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc00ff"><A onmouseover="r('#cc00ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc6600"><A onmouseover="r('#cc6600'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc6633"><A onmouseover="r('#cc6633'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc6666"><A onmouseover="r('#cc6666'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc6699"><A onmouseover="r('#cc6699'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc66cc"><A onmouseover="r('#cc66cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc66ff"><A onmouseover="r('#cc66ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cccc00"><A onmouseover="r('#cccc00'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cccc33"><A onmouseover="r('#cccc33'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cccc66"><A onmouseover="r('#cccc66'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cccc99"><A onmouseover="r('#cccc99'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cccccc"><A onmouseover="r('#cccccc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ccccff"><A onmouseover="r('#ccccff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
            </TR>
            <TR>
                <TD height="10" width="10" bgColor="#cc3300"><A onmouseover="r('#cc3300'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc3333"><A onmouseover="r('#cc3333'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc3366"><A onmouseover="r('#cc3366'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc3399"><A onmouseover="r('#cc3399'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc33cc"><A onmouseover="r('#cc33cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc33ff"><A onmouseover="r('#cc33ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc9900"><A onmouseover="r('#cc9900'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc9933"><A onmouseover="r('#cc9933'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc9966"><A onmouseover="r('#cc9966'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc9999"><A onmouseover="r('#cc9999'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc99cc"><A onmouseover="r('#cc99cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#cc99ff"><A onmouseover="r('#cc99ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ccff00"><A onmouseover="r('#ccff00'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ccff33"><A onmouseover="r('#ccff33'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ccff66"><A onmouseover="r('#ccff66'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ccff99"><A onmouseover="r('#ccff99'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ccffcc"><A onmouseover="r('#ccffcc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ccffff"><A onmouseover="r('#ccffff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
            </TR>
            <TR>
                <TD height="10" width="10" bgColor="red"><A onmouseover="r('#ff0000'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff0033"><A onmouseover="r('#ff0033'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff0066"><A onmouseover="r('#ff0066'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff0099"><A onmouseover="r('#ff0099'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff00cc"><A onmouseover="r('#ff00cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="fuchsia"><A onmouseover="r('#ff00ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff6600"><A onmouseover="r('#ff6600'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff6633"><A onmouseover="r('#ff6633'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff6666"><A onmouseover="r('#ff6666'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff6699"><A onmouseover="r('#ff6699'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff66cc"><A onmouseover="r('#ff66cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff66ff"><A onmouseover="r('#ff66ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ffcc00"><A onmouseover="r('#ffcc00'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ffcc33"><A onmouseover="r('#ffcc33'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ffcc66"><A onmouseover="r('#ffcc66'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ffcc99"><A onmouseover="r('#ffcc99'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ffcccc"><A onmouseover="r('#ffcccc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ffccff"><A onmouseover="r('#ffccff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
            </TR>
            <TR>
                <TD height="10" width="10" bgColor="#ff3300"><A onmouseover="r('#ff3300'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff3333"><A onmouseover="r('#ff3333'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff3366"><A onmouseover="r('#ff3366'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff3399"><A onmouseover="r('#ff3399'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff33cc"><A onmouseover="r('#ff33cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff33ff"><A onmouseover="r('#ff33ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff9900"><A onmouseover="r('#ff9900'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff9933"><A onmouseover="r('#ff9933'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff9966"><A onmouseover="r('#ff9966'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff9999"><A onmouseover="r('#ff9999'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff99cc"><A onmouseover="r('#ff99cc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ff99ff"><A onmouseover="r('#ff99ff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="yellow"><A onmouseover="r('#ffff00'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ffff33"><A onmouseover="r('#ffff33'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ffff66"><A onmouseover="r('#ffff66'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ffff99"><A onmouseover="r('#ffff99'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="#ffffcc"><A onmouseover="r('#ffffcc'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
                <TD height="10" width="10" bgColor="white"><A onmouseover="r('#ffffff'); return true"><IMG height="10" src="" width="10" border="0"></A></TD>
            </TR>
        </TABLE>
    </DIV>
    <!-- 색상 선택 테이블 끝 -->
</body>
</html>