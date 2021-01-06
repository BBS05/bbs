<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
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
<script type="text/javascript">
	/* 当页面加载完成之后 */
	$(document).ready(function() {
		goTo(1);
		$('.mfb-component__button--main').click(function(evt) {
			evt.preventDefault()
		});
	});
	function goTo(currentPageNumber) {
		// 每页帖子数
		var pageSize = 3;
		// 获取版块ID
		var blockId = ${requestScope.blockId};
		// 根据版块ID对帖子进行分页查询，先展示首页，每页展示10条
		$.ajax({
			url:"${pageContext.request.contextPath}/json/postPageList",
			dataType:"json",
			type:"post",
			contentType:"application/json",
			data:JSON.stringify({"queryPage":{"page":currentPageNumber-1,"pageSize":pageSize},"blockId":blockId}),
			async:true,
			success:function(data) {
				// 当前页面帖子列表所有内容
				var postAll="";
				// 总帖子数
				var totalPostNumber = data.totalPostNumber;
				// 总页面数
				var pageEnd = Math.ceil(totalPostNumber/pageSize);
				// 帖子列表内容填充
				var postList = data.postList;
				$.each(postList, function(index, post){
					var postId = post.id;
					var postTitle = post.title;
					var postContent = delHtmlTag(post.content).substring(1,70)+"......";
					var postSection = "<div id=" + postId + " class=\"notification\"><a href=\"${pageContext.request.contextPath}/postShow/" + postId + "\"><strong>" + postTitle + "</strong><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + postContent + "</a></div>";
					postAll = postAll + postSection;
				});
				$("#postAll").html(postAll);
				
				
				// 当前页面分页导航栏所有内容
				var paginationAll = ""; 
				// 如果当前页码大于1
				if (currentPageNumber > 1) {
					// 上一页的页码
					var previousPageNumber = currentPageNumber - 1;
					// 上一页
					paginationAll = paginationAll + "<a href=\"javascript:void(0);\" onclick=\"goTo(" + previousPageNumber + ")\" class=\"pagination-previous\">Previous</a>"
				}
				// 如果当前页码小于尾页
				if (currentPageNumber < pageEnd) {
					// 下一页的页码
					var nextPageNumber = currentPageNumber + 1;
					// 下一页
					paginationAll = paginationAll + "<a href=\"javascript:void(0);\" onclick=\"goTo(" + nextPageNumber + ")\" class=\"pagination-next\">Next page</a>"
				}
				/* alert(paginationAll); */
				// 添加页码按钮列表
				paginationAll = paginationAll + "<ul class=\"pagination-list\">";
					// 如果当前页面大于1
					if (currentPageNumber > 1) {
						// 首页
						paginationAll = paginationAll + "<li><a class=\"pagination-link\" href=\"javascript:void(0);\" onclick=\"goTo(" + 1 + ")\" aria-label=\"Goto page 1\">1</a></li>";
						
					}
					if (currentPageNumber > 2) {
						// 省略号
						paginationAll = paginationAll + "<li><span class=\"pagination-ellipsis\">&hellip;</span></li>";
					}
					// 当前页
					paginationAll = paginationAll + "<li><a id=\"currentPageNumber\" class=\"pagination-link is-current\" href=\"javascript:void(0);\" onclick=\"goTo(" + currentPageNumber + ")\" aria-label=\"Page 46\" aria-current=\"page\">" + currentPageNumber + "</a></li>";
					// 如果当前页面距离尾页超过1页
					if (currentPageNumber + 1 < pageEnd) {
						// 省略号
						paginationAll = paginationAll + "<li><span class=\"pagination-ellipsis\">&hellip;</span></li>";
					}
					
					// 如果当前页面小于尾页
					if (currentPageNumber < pageEnd) {
						// 末页
						paginationAll = paginationAll + "<li><a class=\"pagination-link\" href=\"javascript:void(0);\" onclick=\"goTo(" + pageEnd + ")\" aria-label=\"Goto page " + pageEnd + "\">" + pageEnd + "</a></li>";
					}
				paginationAll = paginationAll + "</ul>";
				
				$("#paginationAll").html(paginationAll);
			},
			error:function(){
				alert("帖子分页列表请求失败");
			}
		});
	}
	// js过滤所有的html标签
	function delHtmlTag(str)
	{
	      return str.replace(/<[^>]+>/g,"");//去掉所有的html标记
	}
</script>
</head>
<body>
	<!-- 包含导航条 -->
	<jsp:include page="section/navbar.jsp" />
	<div class="container blank_distance">
		<section class="columns">
			<div class="column is-three-fifths">
				<div class="box">
					<div class="breadcrumb is-small" aria-label="breadcrumbs">
						<ul>
							<li><a href="#">主页</a></li>
							<li><a href="#">版块</a></li>
							<li class="is-active"><a href="#" aria-current="page">语言基础版块</a></li>
						</ul>
					</div>
				</div>
				<!-- 所有帖子 -->
				<div id="postAll" class="box">
					<!-- <div class="notification is-primary">
						Primar lorem ipsum dolor sit amet, consectetur adipiscing elit
						lorem ipsum dolor. <strong>Pellentesque risus mi</strong>
						<div>
							相关标签： <a href="http://duyanhan.com"><span
								class="tag is-rounded is-black">IO流</span></a> <a
								href="http://duyanhan.com"><span
								class="tag is-rounded is-dark">数组</span></a> <a
								href="http://duyanhan.com"><span
								class="tag is-rounded is-light">Socket</span></a> <a
								href="http://duyanhan.com"><span
								class="tag is-rounded is-white">多线程</span></a> <a
								href="http://duyanhan.com"><span
								class="tag is-rounded is-link">AWT</span></a> <a
								href="http://duyanhan.com"><span
								class="tag is-rounded is-info">Swing</span></a> <a
								href="http://duyanhan.com"><span
								class="tag is-rounded is-success">JDBC</span></a> <a
								href="http://duyanhan.com"><span
								class="tag is-rounded is-warning">注解</span></a> <a
								href="http://duyanhan.com"><span
								class="tag is-rounded is-danger">编不下去了</span></a>
						</div>
					</div> -->

					<div></div>
					
				</div>

			</div>
			<div class="column">
				<div class="box">
					<b>热门标签</b>
					<div>
						<a href="http://duyanhan.com"><span class="tag is-black">IO流</span></a>
						<a href="http://duyanhan.com"><span class="tag is-dark">数组</span></a>
						<a href="http://duyanhan.com"><span class="tag is-light">Socket</span></a>
						<a href="http://duyanhan.com"><span class="tag is-white">多线程</span></a>
						<a href="http://duyanhan.com"><span class="tag is-link">AWT</span></a>
						<a href="http://duyanhan.com"><span class="tag is-info">Swing</span></a>
						<a href="http://duyanhan.com"><span class="tag is-success">JDBC</span></a>
						<a href="http://duyanhan.com"><span class="tag is-warning">注解</span></a>
						<a href="http://duyanhan.com"><span class="tag is-danger">编不下去了</span></a>
					</div>
				</div>
				<div class="box">
					<a class="has-text-dark" href="http://duyanhan.com"> <b>即时问答版块<span
							class="has-text-orange"> ☆☆☆</span></b>
						<ul>
							<!--默认按照新建时间排序-->
							<li><a class="has-text-danger"
								href="http://blog.csdn.net/czkct">这是第一个热点问题</a></li>
							<li><a class="has-text-info"
								href="http://blog.csdn.net/czkct">这是第二个热点问题</a></li>
							<li><a class="has-text-orange"
								href="http://blog.csdn.net/czkct">这是第三个热点问题</a></li>
							<li><a class="has-text-light"
								href="http://blog.csdn.net/czkct">这是第四个热点问题</a></li>
							<li><a class="has-text-grey-light"
								href="http://blog.csdn.net/czkct">第五个热点问题</a></li>
						</ul>
					</a>
				</div>
				<div class="box">
					<b>当前热帖推荐</b>
					<ul>
						<!--默认按照访问次数排序-->
						<li><a class="has-text-danger"
							href="http://blog.csdn.net/czkct">这是第一个热点问题</a></li>
						<li><a class="has-text-info"
							href="http://blog.csdn.net/czkct">这是第二个热点问题</a></li>
						<li><a class="has-text-orange"
							href="http://blog.csdn.net/czkct">这是第三个热点问题</a></li>
						<li><a class="has-text-light"
							href="http://blog.csdn.net/czkct">这是第四个热点问题</a></li>
						<li><a class="has-text-grey-light"
							href="http://blog.csdn.net/czkct">第五个热点问题</a></li>
					</ul>
				</div>
			</div>
		</section>
	</div>
	<!-- 悬浮按钮 -->
	<ul id="menu" class="mfb-component--br   mfb-slidein-spring "
		data-mfb-toggle="click" style="display: block;">
		<li class="mfb-component__wrap">
			<a class="mfb-component__button--main"> 
				<i class="mfb-component__main-icon--resting ion-plus-round"></i>
				<i class="mfb-component__main-icon--active ion-close-round"></i>
			</a>
			<ul class="mfb-component__list">
				<li>
					<a href="${pageContext.request.contextPath}/postForm" data-mfb-label="快速发帖" class="mfb-component__button--child">
						<i class="mfb-component__child-icon ion-edit"></i>
					</a>
				</li>
			</ul>
		</li>
	</ul>
	<!--分页-->
	<div class="container" style="margin-top:50px">
		<div class="columns">
			<div class="column is-three-fifths">
				<nav id="paginationAll" class="pagination is-centered blank_distance" role="navigation" aria-label="pagination">
				</nav>
			</div>
		</div>
	</div>
</body>
</html>