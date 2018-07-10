
<html>
<head>
<meta charset="UTF-8">
<title>个人信息修改</title>
<link href="./static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="./static/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="./static/bootstrap/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet" href="./static/css/public.css">
<link rel="stylesheet" href="./static/css/headerAndFooter.css">
<link rel="stylesheet" href="./static/css/index.css">
<link rel="stylesheet" href="./static/css/search.css">

</head>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="cn.njucm.po.User"%>
<%@ page import="cn.njucm.dao.DBUtil"%>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top bg-primary"
		style="margin-bottom: 20px; height: 70px;">
		<div id="header">
			<div id="nav" style="background-color: #fff !important;">
				<div id="logo" class="logo">
					<img id="logo-image" title="iMooc"
						src="./static/images/public/logo.jpg"
						onclick="window.open('./index.html', 'self')">
				</div>
				<ul id="header-nav-items">
					<li><a style="text-decoration: none;" href="#" target="_self"><span
							id="tedu-font-style">达内</span>&nbsp;&nbsp;-&nbsp;&nbsp; <span
							id="NJUCM-font-style">南京中医药大学计算机科学与技术(嵌入式培养)</span>————designed
							By <span id="team-font-style">天龙特攻队</span> </a></li>
					<li><a href=""><span id="slogan-font-style">Never
								Give Up</span></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="./index.html"><h4>团队成员</h4></a></li>
					<li><a href="./index.jsp"><h4>员工信息列表</h4></a></li>
					<li><a href="search.html"><h4>员工检索</h4></a></li>
					<li class="active"><a href="#"><h4>个人信息修改</h4></a></li>
					<li><a href="#"><h4>员工信息修改</h4></a></li>

				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main "
				style="margin-top: 5px; margin-bottom: 40px;padding-right: 400px;padding-bottom: 60px;padding-top: 60px;">
				<%
					User user = null;
					request.setCharacterEncoding("UTF-8");
					String username=((User)session.getAttribute("user")).getUsername();
					user = DBUtil.SelectByUsername(username);
				%>
				<div id="form-container" style="margin-left: 40%">
					<form id="edit_form" action="./edit_save.jsp" method="post">
						<div class="form-group">
							<label>用户名</label> <input type="text" class="form-control"
								id="edit_username" name="username" value=<%=user.getUsername()%>>
						</div>
						<div class="form-group">
							<label>密码</label> <input type="password" class="form-control"
								id="edit_password" name="password" value="">
						</div>
						<div class="form-group">
							<label>确认密码</label> <input type="password" class="form-control"
								id="edit_spassword" name="spassword" value="">
						</div>
						<div class="form-group">
							<label>真实姓名</label> <input type="text" class="form-control"
								id="edit_realname" name="realname" value=<%=user.getRealname()%>>
						</div>
						<div class="form-group">
							<label>年龄</label> <input type="text" class="form-control"
								id="edit_age" name="age" value=<%=user.getAge()%>>
						</div>
						<div class="form-group">
							<label>性别</label> <input type="text" class="form-control"
								id="edit_sex" name="sex" value=<%=user.getSex()%>>
						</div>
						<div class="form-group">
							<label>生日</label> <input type="text" class="form-control"
								id="edit_birthday" name="birthday" value=<%=user.getBirthday()%>>
						</div>
						<div class="form-group">
							<label>薪水</label> <input type="text" class="form-control"
								id="edit_salary" name="salary" value=<%=user.getSalary()%>>
						</div>
						<input class="btn btn-danger" type="submit" id="edit_ok"
							value="提交"> &ensp;&ensp;&ensp;&ensp;&ensp;&ensp; <input
							class="btn btn-warning" type="reset" id="edit_no" value="重置">
					</form>
				</div>





			</div>
		</div>
	</div>
	<nav class="navbar navbar-default navbar-fixed-bottom"
		style="height: 75px">
		<div class="container">
			<div class="footer-link" style="float: left; margin-left: 300px">
				<div>
					<ul class="foot-123">
						<li><a href="/about/cooperate" target="_blank" title="企业合作">企业合作</a></li>
						<li><a href="/about/job" target="_blank" title="人才招聘">人才招聘</a></li>
						<li><a href="/about/contact" target="_blank" title="联系我们">联系我们</a>
						</li>
						<li><a href="/about/faq" target="_blank" title="常见问题">常见问题</a></li>
						<li><a href="/user/feedback" target="_blank" title="意见反馈">意见反馈</a>
						</li>
						<li><a href="/about/friendly" target="_blank" title="友情链接">友情链接</a></li>
					</ul>
				</div>
				<div class="footer-copyright" style="margin-left: 15px">
					<p style="color: #93999F">©&nbsp;2018&nbsp;天龙特攻队&nbsp;&nbsp;南京中医药大学
						计算机科学与技术(嵌入式培养)</p>
				</div>
			</div>
		</div>
	</nav>
</body>
<script type="text/javascript"
	src="static/js/public/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function search() {
		if ($("#search-input-keyword").val() == "") {
			alert("请输入关键字");
		} else {
			var keyword = $("#search-input-keyword").val();
			$.ajax({
				url : "./search.jsp",
				data : {
					keyword : keyword
				},
				success : function(data) {
					console.log(data);
				}
			});
		}
	}
</script>
</html>