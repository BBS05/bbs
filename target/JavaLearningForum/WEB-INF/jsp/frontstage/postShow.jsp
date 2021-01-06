<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>帖子页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bulma框架样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bulma.min.css" type="text/css" />
<!-- 我自己的页面样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/extra.css" />
<!-- jquery文件 -->
<script src="${pageContext.request.contextPath}/js/jquery3.2.1.min.js"></script>
<!-- 导航栏Js文件 -->
<script src="${pageContext.request.contextPath}/js/navbar.js"></script>
<!-- bulma框架引入的字体样式 -->
<script src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

<!-- 控制浮动按钮的样式和js文件 -->
<link href="${pageContext.request.contextPath}/plugins/material-floating-button/mfb.css" rel="stylesheet">
<script defer src="${pageContext.request.contextPath}/plugins/material-floating-button/mfb.js"></script>
<!-- 我另行导入的字体样式 -->
<link href="${pageContext.request.contextPath}/plugins/Ionicons/css/ionicons.min.css" rel="stylesheet">
<!-- summernote插件的css/js文件 -->
<link href="${pageContext.request.contextPath }/plugins/summernote-0.8.10/summernote-lite.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/plugins/summernote-0.8.10/summernote-lite.js"></script>
<script>
<!-- 当页面加载完成之后，加载分页版块列表 -->
$(document).ready(function() {
	getCommentPageList();
	getPostAuthor();
	$('.mfb-component__button--main').click(function(evt) {
		evt.preventDefault()
	});
});

// 获取帖子作者信息
function getPostAuthor() {
	var userId = ${requestScope.currentPost.userId};

	$.ajax({
		url:"${pageContext.request.contextPath}/user/json/user",
		dataType:"json",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify({"id":userId}),
		async:true,
		success:function(data) {
			var userUsername = data.username;
			var userPassword = data.password;
			var userAvatar = data.avatar;
			var userNickname = data.nickname;
			var userEmail = data.email;
			var userSex = data.sex;
			var userPersonalDescription = data.personalDescription;
			var userAll =  "<div class=\"card\">"
								+ "<div class=\"card-image\">"
									+ "<div style=\"width:100%;height:0;background-image:url(" + userAvatar + ");background-size:cover;padding-bottom: 100%;\"></div>"
								+ "</div>"
								+ "<div class=\"card-content\">"
									+ "<p class=\"title is-4\">" + userNickname + "</p><p class=\"subtitle is-6\">@" + userUsername + "</p>"
									+ "<div class=\"content\">" + userPersonalDescription + "<time datetime=\"2016-1-1\"></time></div>"
								+ "</div>"
							+ "</div>";
			$("#userAll").html(userAll);
		},
		error:function(){
			alert("此回复贴的用户信息请求失败");
		}
	});
}

function getCommentPageList() {
	// 获取帖子ID
	var postId = ${requestScope.currentPost.id};
	// 根据帖子ID对评论进行分页查询，先展示首页的评论，每页展示10条
	$.ajax({
			url:"${pageContext.request.contextPath}/json/commentPageList",
			dataType:"json",
			type:"post",
			contentType:"application/json",
			data:JSON.stringify({"queryPage":{"page":0,"pageSize":6},"postId":postId}),
			async:false,
			success:function(data) {
				var commentAll = "";
				$.each(data, function(index, comment){
					
					var commentId = comment.id;
					var commentContent = comment.content;
					var commentUserId = comment.userId;
					var commentUserUsername;
					var commentUserPassword;
					var commentUserAvatar;
					var commentUserNickname;
					var commentUserEmail;
					var commentUserSex;
					var commentUserPersonalDescription;

					$.ajax({
						url:"${pageContext.request.contextPath}/user/json/user",
						dataType:"json",
						type:"post",
						contentType:"application/json",
						data:JSON.stringify({"id":commentUserId}),
						async:false,
						success:function(data) {
							commentUserUsername = data.username;
							commentUserPassword = data.password;
							commentUserAvatar = data.avatar;
							commentUserNickname = data.nickname;
							commentUserEmail = data.email;
							commentUserSex = data.sex;
							commentUserPersonalDescription = data.personalDescription;
						},
						error:function(){
							alert("此回复贴的用户信息请求失败");
						}
					});
					
					var commentSection ="<div class=\"box\">"
											+ "<article class=\"media\">"
												+ "<div class=\"media-left\" style=\"width:64px;height:64px;background-image:url(" + commentUserAvatar + ");background-size:cover;\"></div>"
												+ "<div class=\"media-content\"  style=\"margin-left:10px;\">"
													+ "<div class=\"content\">"
														+ "<p><strong>" + commentUserNickname + "</strong><small>@" + commentUserUsername + "</small><br>" + commentContent + "</p>"
													+ "</div>"
												+ "</div>"
											+ "</article><br>"
											+ "<nav class=\"level is-mobile\">"
												+ "<a class=\"level-item subtitle is-3 has-text-info\"><i class=\"icon ion-heart\"></i></a>"
												+ "<a class=\"level-item subtitle is-3 has-text-info\"><i class=\"icon ion-thumbsup\"></i></a>"
												+ "<a class=\"level-item subtitle is-3 has-text-info\"><i class=\"icon ion-thumbsdown\"></i></a>"
											+ "</nav>"
										+ "</div>";
					commentAll = commentAll + commentSection;
				});
				$("#commentAll").html(commentAll);
			},
			error:function(){
				alert("评论分页列表请求失败");
			}
		});
}
</script>
</head>
<body>
	<!-- 包含导航条 -->
	<jsp:include page="section/navbar.jsp" />
	<div class="container blank_distance">
		<section class="columns">
			<div class="column is-three-quarters">
				<div class="box">
					<div class="breadcrumb is-small" aria-label="breadcrumbs">
						<ul>
							<li><a href="#">主页</a></li>
							<li><a href="#">版块</a></li>
							<li><a href="#">语言基础版块</a></li>
							<li class="is-active"><a href="#" aria-current="page">Java基本运算符的使用</a></li>
						</ul>
					</div>
				</div>
				<div class="box">
					<div class="content">
						<div class="section has-text-centered">
							<h1 class="title is-4">${requestScope.currentPost.title }</h1>
						</div>
						${requestScope.currentPost.content }
					</div>
				</div>
				<section>
					<!--评论区-->
					<div id="commentAll" class="box"></div>
					<!--针对评论区的分页-->
					<nav class="pagination is-centered" role="navigation"
						aria-label="pagination">
						<a class="pagination-previous">Previous</a> <a
							class="pagination-next">Next page</a>
						<ul class="pagination-list">
							<li><a class="pagination-link" aria-label="Goto page 1">1</a></li>
							<li><span class="pagination-ellipsis">&hellip;</span></li>
							<li><a class="pagination-link" aria-label="Goto page 45">45</a></li>
							<li><a class="pagination-link is-current"
								aria-label="Page 46" aria-current="page">46</a></li>
							<li><a class="pagination-link" aria-label="Goto page 47">47</a></li>
							<li><span class="pagination-ellipsis">&hellip;</span></li>
							<li><a class="pagination-link" aria-label="Goto page 86">86</a></li>
						</ul>
					</nav>
				</section>
			</div>
			<div class="column">
				<!-- 作者的信息卡片 -->
				<div id="userAll"></div>
				<div class="box">
					<b>他的魅力标签：</b>
					<div>
						<a><span class="tag is-rounded is-black">高端技术宅</span></a> <a><span
							class="tag is-rounded is-dark">颜控</span></a> <a><span
							class="tag is-rounded is-light">二次元</span></a> <a><span
							class="tag is-rounded is-white">中二英雄</span></a> <a><span
							class="tag is-rounded is-link">夜猫子</span></a> <a><span
							class="tag is-rounded is-info">男神</span></a> <a><span
							class="tag is-rounded is-success">暴躁</span></a> <a><span
							class="tag is-rounded is-warning">强迫症</span></a> <a><span
							class="tag is-rounded is-danger">其实我还是个戏精</span></a>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- 悬浮按钮 -->
	<ul id="menu" class="mfb-component--br   mfb-slidein-spring "
		data-mfb-toggle="click" style="display: block;">
		<li class="mfb-component__wrap"><a href="#"
			class="mfb-component__button--main"> <i
				class="mfb-component__main-icon--resting ion-plus-round"></i> <i
				class="mfb-component__main-icon--active ion-close-round"></i>
		</a>
			<ul class="mfb-component__list">
				<!-- 回帖时传入当前帖子的ID -->
				<li><a href="${pageContext.request.contextPath}/commentForm/${requestScope.currentPost.id}" data-mfb-label="快速回帖"
					class="mfb-component__button--child"> <i
						class="mfb-component__child-icon ion-chatboxes"></i>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/postForm" data-mfb-label="快速发帖"
					class="mfb-component__button--child"> <i
						class="mfb-component__child-icon ion-edit"></i>
				</a></li>
				<li><a data-mfb-label="收藏此贴"
					class="mfb-component__button--child"> <i
						class="mfb-component__child-icon ion-heart"></i>
				</a></li>
				<li><a data-mfb-label="为此贴点赞"
					class="mfb-component__button--child"> <i
						class="mfb-component__child-icon ion-thumbsup"></i>
				</a></li>
			</ul></li>
	</ul>
	
</body>
</html>