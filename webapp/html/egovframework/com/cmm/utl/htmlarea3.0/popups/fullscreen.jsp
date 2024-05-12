<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %><% /**  * @Class Name : fullscreen.jsp  * @Description : 웹에디터 전체 화면  * @Modification Information  * @  * @  수정일      수정자            수정내용  * @ ----------   --------    ---------------------------  * @ 2011.09.06   이기하          기존 html -> jsp로 수정하여 contextpath 적용  *  *  @author 공통서비스 개발팀 이기하  *  @since 2011.09.06  *  @version 1.0  *  @see  *  */%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html lang="ko">
  <head>
    <title>Fullscreen HTMLArea</title>
    <script type="text/javascript">
      _editor_url = window.opener._editor_url || '../';
      _editor_lang = window.opener._editor_lang;
      _editor_css = window.opener._editor_css;
      var BASE = window.opener.document.baseURI || window.opener.document.URL;
      var head = document.getElementsByTagName("head")[0];
      var base = document.createElement("base");
      base.href = BASE;
      head.appendChild(base);
    </script>

    <script type="text/javascript">
        document.write('<scr' + 'ipt type="text/javascript" src="' + "<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/'/>" + 'htmlarea.js"></scr' + 'ipt>');
    </script>
    <script type="text/javascript">
	// load HTMLArea scripts that are present in the opener frame
	var scripts = window.opener.HTMLArea._scripts;
	for (var i = 3; i < scripts.length; ++i) {
           //document.write("<scr" + "ipt type='text/javascript' src='" + scripts[i] + "'></scr" + "ipt>");
           HTMLArea.loadScript(scripts[i]);
        }
    </script>

    <!-- browser takes a coffee break here -->
    <script type="text/javascript">
var parent_object  = null;
var editor	   = null;	// to be initialized later [ function init() ]

/* ---------------------------------------------------------------------- *\
   Function    :
   Description :
\* ---------------------------------------------------------------------- */

function _CloseOnEsc(ev) {
	ev || (ev = window.event) || (ev = editor._iframe.contentWindow.event);
	if (ev.keyCode == 27) {
		// update_parent();
		window.close();
		return;
	}
}

/* ---------------------------------------------------------------------- *\
   Function    : resize_editor
   Description : resize the editor when the user resizes the popup
\* ---------------------------------------------------------------------- */

function resize_editor() {  // resize editor to fix window
	var newHeight;
	if (document.all) {
		// IE
		newHeight = document.body.offsetHeight - editor._toolbar.offsetHeight;
		if (newHeight < 0) { newHeight = 0; }
	} else {
		// Gecko
		newHeight = window.innerHeight - editor._toolbar.offsetHeight;
	}
	if (editor.config.statusBar) {
		newHeight -= editor._statusBar.offsetHeight;
	}
	editor._textArea.style.height = editor._iframe.style.height = newHeight - (HTMLArea.is_gecko ? 8 : 0) + "px";
}

/* ---------------------------------------------------------------------- *\
   Function    : init
   Description : run this code on page load
\* ---------------------------------------------------------------------- */

function init() {
	parent_object	   = opener.HTMLArea._object;
	var config	   = HTMLArea.cloneObject( parent_object.config );
	config.width	   = "100%";
	config.height	   = "auto";

	// change maximize button to minimize button
	config.btnList["popupeditor"] = [ 'Minimize Editor', _editor_url + 'images/fullscreen_minimize.gif', true,
					  function() { window.close(); } ];

	// generate editor and resize it
	editor = new HTMLArea("editor", config);

	// register the plugins, if any
	for (var i in parent_object.plugins) {
		var plugin = parent_object.plugins[i];
		try {
			eval(plugin.name);
			editor.registerPlugin2(plugin.name, plugin.args);
		} catch(e) {};
	}
	// and restore the original toolbar
        config.toolbar = parent_object.config.toolbar;
	editor.generate();
	editor._iframe.style.width = "100%";
	editor._textArea.style.width = "100%";
	resize_editor();

	editor.doctype = parent_object.doctype;

	// set child window contents and event handlers, after a small delay
	setTimeout(function() {
			   editor.setHTML(parent_object.getInnerHTML());

			   // switch mode if needed
			   if (parent_object._mode == "textmode") { editor.setMode("textmode"); }

			   // continuously update parent editor window
			   setInterval(update_parent, 500);

			   // setup event handlers
			   document.body.onkeypress = _CloseOnEsc;
			   editor._doc.body.onkeypress = _CloseOnEsc;
			   editor._textArea.onkeypress = _CloseOnEsc;
			   window.onresize = resize_editor;
		   }, 333);			 // give it some time to meet the new frame
}

/* ---------------------------------------------------------------------- *\
   Function    : update_parent
   Description : update parent window editor field with contents from child window
   \* ---------------------------------------------------------------------- */

function update_parent() {
	// use the fast version
	parent_object.setHTML(editor.getInnerHTML());
}

    </script>
    <style type="text/css"> html, body { height: 100%; margin: 0px; border: 0px; background-color: buttonface; } </style>
  </head>
  <body scroll="no" onload="HTMLArea.onload = init; HTMLArea.init();" onunload="update_parent()">
    <form style="margin: 0px; border: 1px solid; border-color: threedshadow threedhighlight threedhighlight threedshadow;">
      <textarea name="editor" id="editor" style="width:100%; height:300px">&nbsp;</textarea>
    </form>
  </body>
</html>
