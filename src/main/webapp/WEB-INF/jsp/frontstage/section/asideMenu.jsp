<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="box">
	<div class="breadcrumb is-small" aria-label="breadcrumbs">
		<ul>
			<li><a href="${pageContext.request.contextPath }/home">主页</a></li>
			<li class="is-active"><a href="#" aria-current="page">控制台</a></li>
		</ul>
	</div>
</div>
<div class="box">
	<aside class="menu">
		<p class="menu-label subtitle is-5">账号信息管理</p>
		<ul class="menu-list">
			<li><a href="${pageContext.request.contextPath }/user/userConsole">设置个人信息</a></li>
			<li><a href="${pageContext.request.contextPath }/user/passwordUpdateForm">修改账号密码</a></li>
		</ul>
		<p class="menu-label subtitle is-5">帖子与回复管理</p>
		<ul class="menu-list">
			<li><a href="${pageContext.request.contextPath }/user/myPostManager">已发帖子管理</a></li>
			<li><a href="${pageContext.request.contextPath }/user/myCommentManager">已发回复管理</a></li>
			<li><a href="${pageContext.request.contextPath }/user/othersCommentManager">已收回复管理</a></li>
		</ul>
	</aside>
</div>