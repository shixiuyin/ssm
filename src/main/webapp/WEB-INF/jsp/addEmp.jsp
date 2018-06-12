<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<title>Dashboard Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link
	href="${pageContext.request.contextPath}/assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/assets/css/dashboard.css"
	rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/assets/js/ie-emulation-modes-warning.js"></script>

</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Project name</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Dashboard</a></li>
					<li><a href="#">Settings</a></li>
					<li><a href="#">Profile</a></li>
					<li><a href="#">Help</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="#">Overview <span
							class="sr-only">(current)</span></a></li>
					<li><a href="#">Reports</a></li>
					<li><a href="#">Analytics</a></li>
					<li><a href="#">Export</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="">Nav item</a></li>
					<li><a href="">Nav item again</a></li>
					<li><a href="">One more nav</a></li>
					<li><a href="">Another nav item</a></li>
					<li><a href="">More navigation</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="">Nav item again</a></li>
					<li><a href="">One more nav</a></li>
					<li><a href="">Another nav item</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">添加员工信息</h1>

				<div class="row">
					<form class="form-horizontal"
						action="${pageContext.request.contextPath}/emp" method="post">

						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputPassword3"
									placeholder="例如:zhangsan" name="ename">
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">岗位</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputPassword3"
									placeholder="例如:保镖" name="job">
							</div>
						</div>


						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">上级</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputPassword3"
									placeholder="例如:1" name="mgr">
							</div>
						</div>


						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">入职日期</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" id="inputPassword3"
									placeholder="例如:2018-6-11" name="hiredate">
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">薪水</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputPassword3"
									placeholder="例如:2000.00" name="sal">
							</div>
						</div>

						<!-- 部门从数据库的下拉框 -->
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">部门</label>
							<div class="col-sm-10">
								<select class="form-control" name="deptno">
									<c:forEach items="${deptList}" var="dept">
										<option value="${dept.deptno}">${dept.dname}</option>
									</c:forEach>

								</select>
							</div>
						</div>





						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">添加</button>
							</div>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/dist/js/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')
	</script>
	<script
		src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script
		src="${pageContext.request.contextPath}/assets/js/vendor/holder.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="${pageContext.request.contextPath}/assets/js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript">
		function del(empno) {
			//更新action，请求地址
			$("#delForm").attr("action",
					"${pageContext.request.contextPath}/emp/" + empno).submit();
		}
	</script>
</body>
</html>
