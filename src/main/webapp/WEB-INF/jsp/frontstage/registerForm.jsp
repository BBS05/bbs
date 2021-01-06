<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>用户登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bulma.css" />
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</head>
<body>
	<section class="hero is-light is-fullheight">

		<div class="hero-body">
			<section class="container">
				<div class="container">
					<div>用户注册</div>
				</div>
				<div class="container">
					<div class="columns">
						<!--登录注册区域-->
						<div class="column is-offset-one-quarter is-half">
						
						
						<form:form modelAttribute="user" method="post" action="${pageContext.request.contextPath }/user/register">
						
							<!-- 用户名标签及输入框 -->
							<div class="field">
									<label class="label">用户名</label>
									<div class="control has-icons-left has-icons-right">
										<form:input path="username" cssClass="input is-dark" type="text" placeholder="用户名"/>
										<span class="icon is-small is-left"> <i class="fas fa-user"></i></span> 
										<span class="icon is-small is-right"> <i class="fas fa-check"></i></span>
									</div>
									<!--<p class="help is-success">此用户名可用</p>-->
							</div>
						
							<!-- 密码标签及输入框 -->
							<div class="field">
								<label class="label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
								<div class="control has-icons-left has-icons-right">
									<form:password path="password" cssClass="input is-dark" placeholder="密码"/>
									<span class="icon is-small is-left"> <i class="fas fa-lock"></i></span>
									<span class="icon is-small is-right"> <i class="fas fa-exclamation-triangle"></i></span>
								</div>
								<!--<p class="help is-danger">该密码不安全</p>-->
							</div>
							
							<!-- 登录表单提交按钮 -->
							<div class="field is-grouped">
								<div class="control">
									<input class="button is-dark is-outlined" type="submit" value="注册"/>
								</div>
								<div class="control">
									<a href="${pageContext.request.contextPath }/loginForm" class="button is-text">登录</a>
								</div>
							</div>
							<!-- <p class="help is-danger">用户名或密码错误</p> -->
						</form:form>
							
							
							
							
							
							
						</div>
					</div>
				</div>
			</section>
		</div>
	</section>

</body>
</html>
