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
				<div class="box">已发回复管理</div>
				<div class="box">
					<div class="file is-boxed">
						<label class="file-label"> <input class="file-input"
							type="file" name="resume"> <span class="file-cta">
								<span class="file-icon"> <i class="fas fa-upload"></i>
							</span> <span class="file-label">选择新的头像</span>
						</span>
						</label>
					</div>
					<div class="field">
						<label class="label">昵称</label>
						<div class="control has-icons-left has-icons-right">
							<input class="input is-success" type="text" placeholder="用户昵称">
							<span class="icon is-small is-left"> <i
								class="fas fa-user"></i>
							</span> <span class="icon is-small is-right"> <i
								class="fas fa-check"></i>
							</span>
						</div>
						<p class="help is-success">昵称可用</p>
					</div>

					<div class="field">
						<label class="label">邮箱</label>
						<div class="control has-icons-left has-icons-right">
							<input class="input is-danger" type="email" placeholder="用户邮箱">
							<span class="icon is-small is-left"> <i
								class="fas fa-envelope"></i>
							</span> <span class="icon is-small is-right"> <i
								class="fas fa-exclamation-triangle"></i>
							</span>
						</div>
						<p class="help is-danger">邮箱不可用</p>
					</div>

					<div class="field">
						<label class="label">性别</label>
						<div class="control">
							<div class="select">
								<select>
									<option>选择性别</option>
									<option>男</option>
									<option>女</option>
									<option>其他</option>
								</select>
							</div>
						</div>
					</div>
					<div class="field">
						<label class="label">个人描述</label>
						<div class="control">
							<textarea class="textarea" placeholder="可以使用个性标签，每个个性标签以#开始，以#结束"></textarea>
						</div>
					</div>

					<div class="field is-grouped">
						<div class="control">
							<button class="button is-link">更新设置</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>