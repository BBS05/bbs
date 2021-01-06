<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>用户控制台</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bulma框架样式 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bulma.min.css"
	type="text/css" />
<!-- 我自己的页面样式 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/extra.css" />
<!-- jquery文件 -->
<script src="${pageContext.request.contextPath}/js/jquery3.2.1.min.js"></script>
<!-- 导航栏Js文件 -->
<script src="${pageContext.request.contextPath}/js/navbar.js"></script>
<!-- bulma框架引入的字体样式 -->
<script src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script type="text/javascript">
	// 上传头像文件到smms服务器
	function uploadAvatarFile() {
		// 获取file的js对象
		var file = $("input[type='file']")[0].files[0];
		// 构建formData对象
		var formData = new FormData();
		formData.append("smfile", file);
		$.ajax({
			url : "https://sm.ms/api/upload",
			dataType : "json",
			type : "post",
			data : formData,
			processData : false,
			contentType : false,
			async : true,
			success : function(data) {
				alert("图片上传成功");
				var imgSrc = data.data.url;
				$("#currentAvatar").css("background-image","url("+imgSrc+")");
				$("#avatar").val(imgSrc)
			},
			error : function() {
				alert("图片上传失败");
			}
		});
	}
	
	// 页面DOM结构加载完毕后
	$(document).ready(function() {
		
		/* 第一件事儿：将头像控件和个人描述控件的内容放入对应的div中 */
		var imgSrc = $("#avatar").val();
		if(imgSrc.length > 0) {
			$("#currentAvatar").css("background-image","url("+imgSrc+")");
		}
		var personalDescription = $("#personalDescription").val();
		if(personalDescription.length > 0) {
			$("#personalDescriptionTextarea").val(personalDescription);
		}
		
		// 表单提交事件(这个其实是给form表单绑定一个提交事件，那么应该在包含form表单的DOM结构加载出来之后才能绑定事件，所以该事件应该在DOM已经ready之后绑定)
		$("form").submit(function(e) {
			// 将多行文本框中的内容填入input控件中
			$("#personalDescription").val($("#personalDescriptionTextarea").val()); 
		});
	});
	
</script>
</head>
<body>
	<!-- 包含导航条 -->
	<jsp:include page="section/navbar.jsp" />
	<div class="container blank_distance">

		<div class="columns">
			<div class="column is-3">
				<!-- 包含侧边菜单栏 -->
				<jsp:include page="section/asideMenu.jsp" />
			</div>
			<div class="column is-9">
				<div class="box">设置个人信息</div>
				<div class="box">
					<form:form modelAttribute="currentUser" action="${pageContext.request.contextPath}/user/update" method="post">
						<div id="avatarFileController" class="file is-boxed">
							<!-- 用户id控件 -->
							<form:input path="id" type="hidden"/>
							<!-- 头像显示框 -->
							<div id="currentAvatar" class="box" style="width:82px;height:82px;background-size:cover"></div>
							<label class="file-label"> <input class="file-input"
								type="file" name="file" onchange="uploadAvatarFile()"> <span
								class="file-cta"> <span class="file-icon"> <i class="fas fa-upload"></i></span> <span class="file-label">选择新的头像</span>
							</span>
							</label>
						</div>
						<!-- 头像控件 -->
						<form:input path="avatar" type="hidden"/>
						<div class="field">
							<label class="label">昵称</label>
							<div class="control has-icons-left has-icons-right">
								<!-- 昵称控件 -->
								<form:input path="nickname" cssClass="input is-success" type="text" placeholder="用户昵称"/>
								<span class="icon is-small is-left"> <i
									class="fas fa-user"></i>
								</span> <span class="icon is-small is-right"> <i
									class="fas fa-check"></i>
								</span>
							</div>
						</div>

						<div class="field">
							<label class="label">邮箱</label>
							<div class="control has-icons-left has-icons-right">
								<!-- 邮箱控件 -->
								<form:input path="email" cssClass="input is-danger" type="email" placeholder="用户邮箱"/>
								<span class="icon is-small is-left"> <i
									class="fas fa-envelope"></i>
								</span> <span class="icon is-small is-right"><i
									class="fas fa-exclamation-triangle"></i>
								</span>
							</div>
						</div>

						<div class="field">
							<label class="label">性别</label>
							<div class="control">
								<div class="select">
									<form:select path="sex">
										<form:option value="">选择性别</form:option>
										<form:option value="男">男</form:option>
										<form:option value="女">女</form:option>
										<form:option value="其他">其他</form:option>
									</form:select>
								</div>
							</div>
						</div>
						<div class="field">
							<label class="label">个人描述</label>
							<div class="control">
								<div class="control">
									<textarea id="personalDescriptionTextarea" class="textarea" placeholder="可以使用个性标签，每个个性标签以#开始，以#结束"></textarea>
								</div>
								<form:input path="personalDescription" style="display:none;" type="text"/>
							</div>
						</div>
						<div class="field is-grouped">
							<div class="control">
								<!-- 提交按钮 -->
								<input class="button is-link" type="submit" value="更新设置">
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>