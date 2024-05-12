if(!jwork) var jwork = {};

/**
 * 생성자
 * @param elementId 파일업로드 컴포넌트를 삽입할 위치의 ID
 * @param ctx		웹 컨텐츠 root 명
 * @param fileId	서버에 저장되어 있는 파일을 가져올 경우 사용되는 fileId
 * @param options	fileDownload에 필요한 option 집합
 */
jwork.fileDownload = function(elementId, ctx, fileId, options) {
	// 필수 데이터
	this.elementId = elementId;
	this.ctx = ctx;
	this.fileId = fileId;
	
	// options
	this.initProperties(ctx);
	if(options) {
		this.setOptions(options);
	}
	
	// HTML 로드 
	this.initHtml();
	
	// File List 가져오기
	this.getFileList();
}


////////////////////////////////Static Area ////////////////////////////////
/**
 * 화면에 표시할 파일 크기 문자열 생성(Byte, KB, MB)
 * @param fileSize 바이트 크기 정수
 * @return 생성된 문자열
 */
jwork.fileDownload.getFileSizeDisplayString = function(fileSize) {
	var displayString = "";
	
	if(fileSize < 1024)
		displayString  = fileSize + " Byte";
	else if(fileSize >= 1024 && fileSize < 1024*1024)
		displayString = (fileSize/1024).toFixed(1)+" KB";
	else if(fileSize >= 1024*1024)
		displayString = (fileSize/1024/1024).toFixed(1)+" MB";
	
	return displayString;
}
/////////////////////////////////////////////////////////////////////////////

/**
 * fileId getter
 * @param	fileId
 */
jwork.fileDownload.prototype.getFileId = function() {
	return fileId;
}

/**
 * fileId setter
 * @param	fileId
 */
jwork.fileDownload.prototype.setFileId = function(fileId) {
	this.fileId = fileId;
}

/**
 * 현재 객체의 멤버 필드와 멤버 함수 초기화. options에 명시하지 않은 필드와 함수는 초기화 정보 이용
 * @return
 */
jwork.fileDownload.prototype.initProperties = function() {
	this.fileList = {};
	this.htmlUrl = this.ctx+"/jfile/jfiledownloadForm.do"
	this.beanId = "";
	this.uploadPathKey = "";
	this.downloadCompleted = function(){};
	this.totalSize = 0;
	this.usePreview = false;
	this.previewType = "click";
	this.previewDelay = 1000;
}

/**
 * 사용자가 options에 명시한 내용으로 값 변경
 * @param options 변경할 값을 가진 options 객체
 * @return
 */
jwork.fileDownload.prototype.setOptions = function(options) {
	for(var i in options) {
		if(options[i]) {
			this[i] = options[i];
		}
	}
}

/**
 * 화면에 파일다운로드 컴포넌트 표시
 * @return
 */
jwork.fileDownload.prototype.initHtml = function() {
	var element = jQuery("#" + this.elementId);
	jQuery.ajax({
		url : this.htmlUrl,
		async : false,
		success : function(resultText, status) {
			element.html(resultText);
		},
		error : function(xhr, ajaxSettings, thrownError){
			if (xhr.status == 901) {
				alert("세션이 종료 되었습니다.");
				self.location.href= this.ctx;
			}else{
				alert('프로세스 수행 중 장애가 발생 하였습니다. ');
			}
		}
	});
	
	var spanAllDown = element.find("#spanButtonAllDown");
	spanAllDown.hover(
		function() {
			jQuery(this).addClass("hover");
		},
		function() {
			jQuery(this).removeClass("hover");
		}
	);
	
	if(this.usePreview !== true) {
		element.find("div.content_left").hide();
		element.find("div.content_right").css("margin-left", "0px");
	}
}

/**
 * 서버에 저장되어 있는 파일 리스트를 가져온다.
 * @return
 */
jwork.fileDownload.prototype.getFileList = function() {
	var fileDownload = this;
		
	jQuery.ajax({
		url : this.ctx + "/jfile/readDownloadFiles.do",
		data : { fileId : this.fileId, beanId : this.beanId, uploadPathKey : this.uploadPathKey },
		dataType : "json",
		success : function(result) {
			switch(result.JsonResultCode) {
			case "success":
				fileDownload.insertFileList(result.fileList);
				break;
			case "failure":
				alert("파일 목록을 서버에서 가져오는 중에 에러가 발생하였습니다.\n 관리자에게 문의하십시오.");
				break;
			default:
				break;
			}
		},
		error : function(xhr, ajaxSettings, thrownError){
			if (xhr.status == 901) {
				alert("세션이 종료 되었습니다.");
				self.location.href= this.ctx;
			}else{
				alert('프로세스 수행 중 장애가 발생 하였습니다. ');
			}
		}
	});

}

/**
 * 서버에서 받아온 파일 리스트의 정보를 현재 객체와 페이지에 저장
 * @param fileList 서버에서 받아온 파일 리스트
 * @return
 */
jwork.fileDownload.prototype.insertFileList = function(fileList) {
	if(fileList.length <=0) {
		return;
	}
	
	for(var i=0; i<fileList.length; i++) {
		var fileInfo = fileList[i];
		
		var file = new Object();
		file.id = this.elementId + "_" + fileInfo.fileSeq;
		file.seq = fileInfo.fileSeq;
		file.name = fileInfo.fileName;
		file.size = fileInfo.fileSize;
		file.count = fileInfo.downloadCount;
		
		this.appendFileRow(file);
	}
	
	this.showBtnAllDown();
}


/**
 * 파일 추가시 컴포넌트 화면에 해당 파일 아이템 표시
 * @param file 추가할 파일의 정보를 담은 객체
 * @return
 */
jwork.fileDownload.prototype.appendFileRow = function(file) {
	var element = jQuery("#" + this.elementId);
	
	// 파일 목록에 저장
	file.isSaved = true;
	this.fileList[file.id] = file;
	
	// 파일총 사이즈 설정
	this.totalSize += file.size;
	var totalSizeStr = jwork.fileUpload.getFileSizeDisplayString(this.totalSize); 
	jQuery("#" + this.elementId).find("#totalFileSizeDisplay").html(totalSizeStr);
	
	// 파일 컨테이너 생성
	element.find("#noDataRow").hide();
	var fileAreaTable = jQuery("#" + this.elementId).find("#fileAreaTable");
	var fileSizeStr = jwork.fileUpload.getFileSizeDisplayString(file.size);
	
	var spanFileName = jQuery("<span>" + file.name + "</span>");
	var btnDownload = this.getBtnDownload(file);
	
	var fileAreaTableTr = 	jQuery("<tr class='fileItem' id='"+file.id+"' ></tr>").append(
								jQuery("<td class='first'></td>").append(spanFileName)).append(
								jQuery("<td class='right' >" + fileSizeStr + "</td>")).append(
								jQuery("<td class='right'>" + file.count + "</td>")).append(
								jQuery("<td class='center'></td>").append(
										btnDownload));
	this.addHighlightEvent(fileAreaTableTr);
	this.addPreviewEvent(spanFileName);
	
	fileAreaTable.append(fileAreaTableTr);
}

/**
 * 마우스 다운로드 버튼을 생성
 * @param file	다운받을 파일의 정보를 담은 객체
 */
jwork.fileDownload.prototype.getBtnDownload = function(file) {
	var element = jQuery("#" + this.elementId);
	
	var ctx           = this.ctx;
	var fileId        = this.fileId;
	var beanId        = this.beanId;
	var uploadPathKey = this.uploadPathKey;
	return jQuery("<img src=" + this.ctx + "/resource/jfile/swfupload/images/arrow_bg_no1.png />").bind("click", 
				function() {
					var form = jQuery("<form />").attr("method", "get")
												 .attr("action", ctx + "/jfile/readDownloadFile.do");
					
					form.append( jQuery("<input />").attr("type", "hidden")
													.attr("name", "fileId")
													.attr("value", fileId) );
										
					form.append( jQuery("<input />").attr("type", "hidden")
													.attr("name", "fileSeq")
													.attr("value", file.seq) );
					form.append( jQuery("<input />").attr("type", "hidden")
													.attr("name", "beanId")
													.attr("value", beanId) );
					form.append( jQuery("<input />").attr("type", "hidden")
													.attr("name", "uploadPathKey")
													.attr("value", uploadPathKey) );
					element.append(form);
					form.get(0).submit();
			
					form.remove();
				}
			).css("cursor", "pointer");
};

/**
 * 마우스 over시에 해당 줄 하이라이트
 * @param element	미리보기 이벤트 발생 위치
 */
jwork.fileDownload.prototype.addHighlightEvent = function(element) {
	var file = this.fileList[jQuery(element).attr("id")];
	
	element.bind("mouseover",
		function() {
			var mouseoutEvent = jQuery(element).bind("mouseout",
				function() {
					jQuery(element).find("td").css("background", "#ffffff");
					jQuery(element).unbind("mouseout", mouseoutEvent);
				}	
			);
		
			jQuery(element).find("td").css("background", "#f5fafe");
		}
	);
};

/**
 * 미리보기 이벤트 추가
 * @param element	이벤트 발생 위치
 * @return
 */
jwork.fileDownload.prototype.addPreviewEvent = function(element) {
	if(this.usePreview !== true) {
		return;
	}
	
	switch(this.previewType) {
	case "click" :
		this.addPreviewEventByClick(element);
		break;
	case "mouseover" :
		this.addPreviewEventByOver(element);
		break;
	default:
		break;
	}
};

/**
 * 미리보기 이벤트 추가(onmouseover)
 * @param element	미리보기 이벤트 발생 위치
 * @return
 */
jwork.fileDownload.prototype.addPreviewEventByOver = function(element) {
	var filedownload = this;
	var tr = jQuery(element).parents().filter("tr").get(0);
	var file = this.fileList[jQuery(tr).attr("id")];
	
	jQuery(tr).bind("mouseover",
		function() {
			var isOver = true;
			
			var mouseoutEvent = jQuery(tr).bind("mouseout",
				function() { 
					isOver = false;
					jQuery(tr).unbind("mouseout", mouseoutEvent);
				}
			);
			
			if(filedownload.usePreview !== true) {
				return;
			}
			
			filedownload.showPreview();
			setTimeout(	
				function() {	
					if(isOver && file.isSaved) {
						filedownload.changePreview(filedownload.fileId, file.seq);	
					}
					else if(isOver && !file.isSaved) {
						filedownload.changePreviewByUrl(filedownload.ctx + "/swfupload/images/no_img.gif");		
					}
				},
				filedownload.previewDelay
			);	
		}
	);
};

/**
 * 미리보기 이벤트 추가(onclick)
 * @param element		미리보기 이벤트 발생 위치
 * @return
 */
jwork.fileDownload.prototype.addPreviewEventByClick = function(element) {
	var filedownload = this;
	var tr = jQuery(element).parents().filter("tr").get(0);
	var file = this.fileList[jQuery(tr).attr("id")];
	
	jQuery(element).bind("click",
		function() {
			if(file.isSaved) {
				filedownload.changePreview(filedownload.fileId, file.seq);	
			}
			else if(!file.isSaved) {
				filedownload.changePreviewByUrl(filedownload.ctx + "/swfupload/images/no_img.gif");		
			}
		}
	).css("cursor", "pointer");
};

/**
 * 파일 미리보기 이미지를 변경
 * @param fileId 서버에 저장되어 있는 파일의 fileId
 * @param fileSeq 서버에 저장되어 있는 파일의 seq
 */
jwork.fileDownload.prototype.changePreview = function(fileId, seq) {
	if(!fileId) {
		fileId = "";
	}	
	if(!seq) {
		seq = "";
	}
	var element = jQuery("#" + this.elementId);
	var img = element.find("#spanThumbnail").find("img").get(0);
	jQuery(img).attr("src", this.ctx + "/jfile/preview.do?fileId=" + fileId + "&fileSeq=" + seq + "&beanId="+this.beanId + "&uploadPathKey="+this.uploadPathKey);
}

/**
 * 파일 미리보기 이미지를 변경(경로를 직접 입력)
 * @param imageUrl 파일의 경로
 */
jwork.fileDownload.prototype.changePreviewByUrl = function(imageUrl) {
	var element = jQuery("#" + this.elementId);
	var img = element.find("#spanThumbnail").find("img").get(0);
	jQuery(img).attr("src", imageUrl);	
}

/**
 * 파일 미리보기 이미지를 보인다.
 */
jwork.fileDownload.prototype.showPreview = function() {
	var element = jQuery("#" + this.elementId);
	var img = element.find("#spanThumbnail").find("img").get(0);
	jQuery(img).show();
}

/**
 * 파일 미리보기 이미지를 숨김
 * @return
 */
jwork.fileDownload.prototype.hidePreview = function() {
	var element = jQuery("#" + this.elementId);
	var img = element.find("#spanThumbnail").find("img").get(0);
	jQuery(img).hide();
}

/**
 * 서버로 부터 해당 fileId의 파일 리스트를 가져와 화면을 갱신한다. 
 * @return
 */
jwork.fileDownload.prototype.refresh = function() {
	this.fileList = {};
	this.totalSize = 0;
	this.initHtml();
	this.hideBtnAllDown();	
	this.getFileList();
}

/**
 * 전체 다운로드 버튼을 숨긴다.
 * @return
 */
jwork.fileDownload.prototype.hideBtnAllDown = function() {
	var btnAllDown = jQuery("#" + this.elementId).find("#spanButtonAllDown");
	
	btnAllDown.unbind("click");
	
	btnAllDown.hide();
}

/**
 * 전체 다운로드 버튼을 보인다.
 * @return
 */
jwork.fileDownload.prototype.showBtnAllDown = function() {
	var element = jQuery("#" + this.elementId);
	var btnAllDown = element.find("#spanButtonAllDown");
	
	var ctx           = this.ctx;
	var fileId        = this.fileId;
	var beanId        = this.beanId;
	var uploadPathKey = this.uploadPathKey;
	btnAllDown.bind("click", function(){
		var form = jQuery("<form />").attr("method", "get")
								.attr("action", ctx + "/jfile/downloadAll.do");
		form.append( jQuery("<input />").attr("type", "hidden")
								   		.attr("name", "fileId")
								   		.attr("value", fileId) );
		form.append( jQuery("<input />").attr("type", "hidden")
										.attr("name", "beanId")
										.attr("value", beanId) );
		form.append( jQuery("<input />").attr("type", "hidden")
										.attr("name", "uploadPathKey")
										.attr("value", uploadPathKey) );
		element.append(form);
		form.get(0).submit();
		
		form.remove();
	});
	
	btnAllDown.show();
}