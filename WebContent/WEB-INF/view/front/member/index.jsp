<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/header.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutMain.css" />
	<style></style>
	<script>
		window.onload = function () {
			// alert(getNow());
		}
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<div class="container">
	<header>
		<%@ include file="/include/front/top.jsp" %>
	</header>
	<nav>
		<%@ include file="/include/front/gnb.jsp" %>
	</nav>
	<section class="content">
		<nav></nav>
		<article class="txtCenter">
			프론트 메인입니다.<br/>
		</article>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>