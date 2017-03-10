<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>
			JavaScript 图片切割效果（带拖放、缩放效果）
		</title>
<script >
	var path="${request.contextPath}";
</script>
<script type="text/javascript" src="${request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/static/js/mf.ajaxfileupload.js"></script>
<script type="text/javascript" src="${request.contextPath}/static/js/mf.upload.js"></script>
	
	</head>
	<body>
		<style type="text/css">
			#rRight,#rLeft,#rUp,#rDown{
				position:absolute;
				background:#FFF;width:5px;
				height:5px; z-index:500; font-size:0;} 
			#dragDiv{border:1px solid #FFF;}
		</style>
		<input type="file" name="file" id="file"  onchange="mf.upload.imageUp('file');" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="50%">
					<div id="bgDiv" style="width:500px; height:400px;border:solid rgb(100,100,100) 1px;">
						<div id="dragDiv" style="border-radius:50%;">
							<span id="rRight" style="right:0; top:50%;">
							</span>
							<span id="rLeft" style="left:0; top:50%;">
							</span>
							<span id="rUp" style="top:0; left:50%;">
							</span>
							<span id="rDown" style="bottom:0;left:50%;">
							</span>
						</div>
					</div>
				</td>
				<td>
					<div>
						<div id="maxView" style="width:100px; height:100px;border-radius: 50%;behavior: 	url(border-radius.htc);">
						</div>
						100*100像素
					</div>
					<div>
						<div id="viewDiv" style="width:50px; height:50px;border-radius: 50%;behavior: url(border-radius.htc);">
						</div>
						60*60像素
					<div>
					
				</td>
				<td>
					
				</td>
				<td>
					<div>
						<input name="" type="button" value="生成图片" onclick="Create()" />
						<br />
						<div id="imgdiv" style="display:none">
							<img id="imgCreat" style="border-radius:50%;width:100px; height:100px;"/>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<script type="text/javascript" src="${request.contextPath}/static/js/img.js"></script>
		<script>
			var ic = null;
			function Create() {
				if(ic==null){
					alert("请先上传图片");
					return;
				}
				var p = ic.Url,
				x = ic.Drag.offsetLeft,
				y = ic.Drag.offsetTop,

				w = ic.Drag.offsetWidth,
				h = ic.Drag.offsetHeight,

				pw = ic.Width,
				ph = ic.Height;
				_$("imgdiv").style.display="block";
				_$("imgCreat").src = "${request.contextPath}/img/createServlet?p=" + p + "&x=" + x + "&y=" + y + "&w=" + w + "&h=" + h + "&pw=" + pw + "&ph=" + ph;
			}
		</script>
	</body>

</html>