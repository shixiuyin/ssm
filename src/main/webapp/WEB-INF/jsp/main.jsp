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
				<h1 class="page-header">Dashboard</h1>


				<div class="row">
					<div class="col-md-6">
						<div class="btn-group" role="group" aria-label="...">
							<a href="${pageContext.request.contextPath}/emp" type="button"
								class="btn btn-default  btn-primary" id="btn_add"> <span
								class="glyphicon glyphicon-plus-sign"></span>添加
							</a>
							<button type="button" class="btn btn-default  btn-danger"
								onclick="dels()">
								<span class="glyphicon glyphicon-trash"></span>批量删除
							</button>
							<button type="button"
								class="btn btn-default  btn-success btn-selectAll">
								<span class="glyphicon glyphicon-unchecked">全选</span>
							</button>
						</div>
					</div>

					<div class="col-md-6">
						<form id="myform" class="form-inline"
							action="${pageContext.request.contextPath}/emp/search?ename=aa"
							method="get">
							<div class="form-group">
								<select class="form-control" id="deptSelect" name="deptno">

									<option value="-1">查询全部</option>
									<c:forEach items="${deptList}" var="dept">
										<c:if test="${param.deptno==dept.deptno }">
											<option value="${dept.deptno}" selected="selected">${dept.dname}</option>
										</c:if>
										<c:if test="${param.deptno!=dept.deptno }">
											<option value="${dept.deptno}">${dept.dname}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail2">名称:</label> <input type="text"
									class="form-control" id="exampleInputEmail2"
									placeholder="zhangsan" name="ename" value="${param.ename}">
							</div>

							<button type="submit" class="btn btn-default">查询</button>
						</form>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>序列</th>
								<th>员工编号</th>
								<th>员工名称</th>
								<th>岗位</th>
								<th>入职日期</th>
								<th>薪水</th>
								<th>部门</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${pageInfo.list}" var="emp" varStatus="vs">
								<tr>
									<td><input type="checkbox" name="checkbox_name">
										${vs.index+1}</td>
									<td>${emp.empno}</td>
									<td>${emp.ename}</td>
									<td>${emp.job}</td>
									<td><fmt:formatDate value="${emp.hiredate}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>${emp.sal}</td>
									<td>${emp.dname}</td>
									<td><a
										href="${pageContext.request.contextPath}/emp/${emp.empno}"
										class="btn btn-sm btn-primary">修改</a> <a
										href="javascript:del(${emp.empno})"
										class="btn btn-sm btn-danger">删除</a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 删除delete  -->
					<form action="${pageContext.request.contextPath}/emp/${emp.empno}"
						id="delForm" method="post">
						<!--替换请求方式为DELETE  name:重新指定请求方式  -->
						<input type="hidden" name="_method" value="DELETE">
					</form>

					<!-- 批量删除 -->
					<form action="${pageContext.request.contextPath}/emps"
						id="delsForm" method="post">
						<!--替换请求方式为DELETE  name:重新指定请求方式  -->
						<input type="hidden" name="_method" value="DELETE">
					</form>


				</div>

				<!-- 分页 -->
				<nav aria-label="Page navigation">
					<ul class="pagination">

						<c:if test="${pageInfo.hasPreviousPage}">

							<li><a
								href="${pageContext.request.contextPath}/emp/main/${pageInfo.pageNum-1}/${pageInfo.pageSize}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<!--navigatepageNums:连续出现的页码  -->
						<c:forEach items="${pageInfo.navigatepageNums}" var="page">
							<!-- 如果是当前页 高亮 -->

							<c:if test="${page == pageInfo.pageNum}">
								<li class="active"><a
									href="${pageContext.request.contextPath}/emp/main/${page}/${pageInfo.pageSize}">${page}</a></li>
							</c:if>
							
							<c:if test="${page != pageInfo.pageNum}">
								<li><a
									href="${pageContext.request.contextPath}/emp/main/${page}/${pageInfo.pageSize}">${page}</a></li>
							</c:if>

						</c:forEach>

						<c:if test="${pageInfo.hasNextPage}">
							<li><a
								href="${pageContext.request.contextPath}/emp/main/${pageInfo.pageNum+1}/${pageInfo.pageSize}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
				</nav>

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
		/* 单个删除 */
		function del(empno) {
			//更新action，请求地址
			$("#delForm").attr("action",
					"${pageContext.request.contextPath}/emp/" + empno).submit();
		}

		/* 批量删除 */
		function dels() {

			//1.获取选中的内容
			var checkObj = $("input[name='checkbox_name']:checked");
			if (checkObj.length <= 0) {
				alert("请选择需要删除的数据!!!");
				return
			}
			//2.提示是否删除
			var flag = window.confirm("是否确认删除??")
			if(flag)
			{
			
				//3.封装参数
				$.each(checkObj,function(index,obj){
					//根据节点信息，获取对应的 empno
					var paramVal = $(obj).parent().next().text();
					$("<input type='hidden' name='emps' value='"+paramVal+"' />").appendTo("#delsForm");
				});
				//4.提交
					$("#delsForm").submit();
			}			
		}

		/* 全选  点击全选按钮*/
		$(".btn-selectAll")
				.click(
						function() {
							//多选框
							var dates = $("input[name='checkbox_name']");

							//查找是否包含关键字unchecked，如果包含证明之前没有被选中
							if ($(this).find("span").attr("class").indexOf(
									"unchecked") != -1) {
								//将所有的内容选中
								$.each(dates, function(index, data) {
									data.checked = true;
								})
								//将图标设置为全选
								$(this).find("span").attr("class",
										"glyphicon glyphicon-check");
							} else {
								//否则设置为未选中
								$.each(dates, function(index, data) {
									data.checked = false;
								})
								//图标设置为未选中
								$(this).find("span").attr("class",
										"glyphicon glyphicon-unchecked");
							}
						});
	</script>
</body>
</html>
