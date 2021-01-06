<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Java论坛</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bulma.css" />
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</head>
<body>
	<section class="hero is-fullheight is-white is-bold">
		<div class="hero-head">
			<nav class="navbar is-transparent">
				<div class="navbar-brand">
					<!-- 主页LOGO跳转 -->
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
						<a class="navbar-item"
							href="${pageContext.request.contextPath}/home"> 主页 </a>
					</div>

					<div class="navbar-end">
						<div class="navbar-item">
							<div class="field is-grouped">
								<p class="control">
									<a class="bd-tw-button button" target="_blank"
										href="//shang.qq.com/wpa/qunwpa?idkey=832a8468000c6628a34260be3443854c511831f14cb38060b8cb919c0d3428ba">
										<span class="icon"> <i class="fab fa-qq"></i>
									</span> <span> 官方Q群 </span>
									</a>
								</p>
								<p class="control">
									<a class="button is-black"> <span class="icon"> <i
											class="far fa-envelope"></i>
									</span> <span>联系站长</span>
									</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</div>
		<div class="hero-body">
			<div class="columns container is-fullhd">


				<!--论坛名称区域-->
				<div class="has-text-centered column is-offset-2 is-one-quarter">
					<h1 class="title is-1">
						Java <span class="title is-2">论坛</span>
					</h1>
					<h2 class="subtitle">让您从零开始，逐步进阶</h2>
					<!--<br />-->
					<!--直接进入的按钮-->
					<a class="button is-large is-black is-outlined" href="home"> <span>游客入口</span>
					</a>
				</div>
				<!--<div class="column"></div>-->
				<!--登录注册区域-->
				<div class="column is-offset-2 is-one-quarter">
					<div class="field">
						<label class="label">用户名</label>
						<div class="control has-icons-left has-icons-right">
							<input class="input is-dark" type="text" placeholder="用户名">
							<span class="icon is-small is-left"> <i
								class="fas fa-user"></i>
							</span> <span class="icon is-small is-right"> <i
								class="fas fa-check"></i>
							</span>
						</div>
						<!--<p class="help is-success">此用户名可用</p>-->
					</div>
					<div class="field">
						<label class="label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
						<div class="control has-icons-left has-icons-right">
							<input class="input is-dark" type="password" placeholder="密码">
							<span class="icon is-small is-left"> <i
								class="fas fa-lock"></i>
							</span> <span class="icon is-small is-right"> <i
								class="fas fa-exclamation-triangle"></i>
							</span>
						</div>
						<!--<p class="help is-danger">该密码不安全</p>-->
					</div>
					<div class="field is-grouped">
						<div class="control">
							<button class="button is-dark is-outlined">登录</button>
						</div>
						<div class="control">
							<button class="button is-text">注册</button>
						</div>
					</div>
					<p class="help is-danger">用户名或密码错误</p>
				</div>
				<!--<div class="column"></div>-->
			</div>
		</div>
		<div class="hero-foot">
			<section class="hero">
				<div class="hero-body level">

					<div class="level-item has-text-centered">
						<div>
							<p class="heading">帖子总数</p>
							<p class="title">456K</p>
						</div>
					</div>
					<div class="level-item has-text-centered">
						<div>
							<p class="heading">历史最高在线人数</p>
							<p class="title">3,456</p>
						</div>
					</div>
					<div class="level-item has-text-centered">
						<div>
							<p class="heading">当前在线游客</p>
							<p class="title">123</p>
						</div>
					</div>

					<div class="level-item has-text-centered">
						<div>
							<p class="heading">当前在线会员</p>
							<p class="title">789</p>
						</div>
					</div>

				</div>
			</section>
		</div>
	</section>
</body>
</html>
