<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	<!-- 当页面加载完成之后，加载版块列表 -->
	$(document).ready(function() {
		getNavBlockTitleList();
	});

	function getNavBlockTitleList() {
		$.ajax({
				url:"${pageContext.request.contextPath}/json/blockTitleList",
				dataType:"json",
				type:"post",
				contentType:"application/json",
				async:true,
				success:function(data) {
					var blockTitleListStr = "<a class=\"navbar-item\" href=\"#\">即时问答版块 </a><hr class=\"navbar-divider\">";
					$.each(data, function(index, block){
						blockTitleListStr = blockTitleListStr + "<a id=" + block.id + " class=\"navbar-item\" href=\"${pageContext.request.contextPath}/postList/" + block.id + "\">" + block.title + "</a>";
					});
					$("#navBlockTitleList").html(blockTitleListStr);
				},
				error:function(){
					alert("版块列表请求失败");
				}
			});
	}
</script>
<!-- 顶端导航条 -->
<nav class="navbar is-fixed-top">
	<div class="bd-special-shadow"
		style="opacity: 1; transform: scaleY(1);"></div>
	<div class="container">
		<div class="navbar-brand">
			<!-- 设置欢迎页 -->
			<a class="navbar-item" href="${pageContext.request.contextPath}/index">
				<img src="${pageContext.request.contextPath}/images/LOGO.png"
				alt="Bulma: a modern CSS framework based on Flexbox" width="151"
				height="28">
			</a>
			<div class="navbar-burger burger"
				data-target="navbarExampleTransparentExample">
				<span></span> <span></span> <span></span>
			</div>
		</div>
		<div id="navbarExampleTransparentExample" class="navbar-menu">
			<div class="navbar-start">
				<!-- 设置主页跳转 -->
				<a class="navbar-item"
					href="${pageContext.request.contextPath}/home"> 主页 </a>
				<div class="navbar-item has-dropdown is-hoverable">
					<a class="navbar-link">
						版块导航 </a>
					<div id="navBlockTitleList" class="navbar-dropdown is-boxed">
						<!-- 这里是导航条的版块列表 -->
					</div>
				</div>
			</div>

			<div class="navbar-end">
				<div class="navbar-item">
					<div class="field has-addons">
						<p class="control">
							<span class="select"> <select>
									<option>帖子</option>
									<option>作者</option>
							</select>
							</span>
						</p>
						<p class="control is-expanded">
							<input class="input" type="text" placeholder="搜索您感兴趣的内容">
						</p>
						<p class="control">
							<a class="button"> <span class="is-icon is-small"> <i
									class="fab fa-sistrix"></i>
							</span>
							</a>
						</p>
					</div>
				</div>
				<!-- 当用户没有登录的时候 -->
				<c:if test="${empty sessionScope.currentUser }">
					<div class="navbar-item">
						<!-- 登录页面跳转按钮 -->
						<a href="${pageContext.request.contextPath}/loginForm"> <span
							class="button is-inverted is-info">登陆</span></a> <b
							class="has-text-grey-light">|</b>
						<!-- 注册页面跳转按钮 -->
						<a href="${pageContext.request.contextPath}/registerForm"> <span
							class="button is-inverted is-success">注册</span></a>
					</div>
				</c:if>
				<!-- 当用户登录之后 -->
				<c:if test="${!empty sessionScope.currentUser }">
					<div class="navbar-item has-dropdown is-hoverable">
						<a class="navbar-link">${sessionScope.currentUser.username }</a>
						<div class="navbar-dropdown is-boxed">
							<a class="navbar-item" href="${pageContext.request.contextPath}/user/userConsole">我的控制台</a>
							<hr class="navbar-divider">
							<a class="navbar-item" href="${pageContext.request.contextPath}/user/logout">注销账号</a>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</nav>


