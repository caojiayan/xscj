<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>洛天工作室</title>
<link href="css/ui-lightness/jquery-ui-1.10.4.custom.css"
	rel="stylesheet">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript">
	function judgeFun(){
		var $login = $("input[name=login]");
		$login.bind("click", function(){
		if($.trim($("input[name=username]").val())=="")
		{
			$(".ErrorStyle").empty();
			$("#usernameError").text("用户名不能为空");
			return;
		}
		if($.trim($("input[name=password]").val())=="")
		{
			$(".ErrorStyle").empty();
			$("#passwordError").text("密码不能为空");
			return;
		}
		if($.trim($("input[name=certCode]").val())=="")
		{
			$(".ErrorStyle").empty();
			$("#certCodeError").text("验证码错误");
			return;
		}
		$.ajax(
			{
				type:"post",
				url:"loginJudge.action",
				dataType:"json",
				data:{
					username:$("input[name=username]").val(),
					password:$("input[name=password]").val(),
					certCode:$("input[name=certCode]").val(),
					userRole:$("input[name=userRole]:checked").val()
				},
				success : function(data) {
					var d = eval("(" + data + ")");
					if(d.judge=="certCodeFail")
					{
						$(".ErrorStyle").empty();
						$("#certCodeError").text("验证码错误");
						return;
					}
					if(d.stuFound)
					{
					/* 	alert("找到了学生信息"); */
					window.location.href="stuMain.action";
						return ;
					}
					else if(d.teacherFound)
					{
						/* alert("找到了教师信息"); */
						window.location.href="teacherMain.action";
						return;
					}
					else if(d.administratorFound)
					{
						window.location.href="adminMain.action";
					}
					else{
						alert("用户名或密码错误，系统拒绝了您的访问请求");
						changeimg();
						return ;
					}
					
				},
				error : function() {
					alert("系统异常，请稍后重试！");
				}
			}
			);
		});
	}
	function changeimg()
	{
		var myimg = document.getElementById("code");
		now = new Date();
		myimg.src = "makeCertPic.jsp?code=" + now.getTime();
	}
	$(function (){
		$("input[name=login]").button();
		judgeFun();
	});
</script>
<style type="text/css">
	html{
		width: 100%;
		height: 100%;
	}
	body{
		/*margin: 100px;*/
		position: relative;
		width: 100%;
		height: 100%;
		background: url(image/lbg.jpg)no-repeat center center;
		background-size: 100% 100%;
	}
	body>center{
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -140px;
		margin-left: -532px;
		width: 1064px;
		height: 280px;
	}
	.datalist{
	font-family:Arial;
	border-collapse:collapse;	/* 边框重叠 */
	background-color:#eaf5ff;	/* 表格背景色 */
	font-size:18px;
}
.datalist caption{
	height: 1.8em;
	line-height: 1.8em;
	font-weight:bold;
	font-size: 1.5em;
	color: #FFF;
	text-align:center;
	background-color:#1c94c4;
}
.datalist tr{
 	height: 35px;
	line-height: 35px;
 }
tr.tip{
 	height: 14px;
 	line-height: 14px;
 }
 tr.btn{
 	height: 60px;
	line-height: 60px;
 }
  tr.btn input.ui-button{
  	width: 183px;
  	height: 31px;
  	line-height: 31px;
  	padding: 0;
  	
  }
 .datalist tr input[type='text'],
  .datalist tr input[type='password']{
 	height: 25px;
 	padding-left: 10px;
 	line-height: 25px;
 	border-radius: 4px;
 	border-width: 0;
 	border: 1px solid #ccc;
 	outline: none;
 	box-shadow: none;
 }
.datalist th{
	color: #1c94c4;
	font-weight:bold;
	padding-top:8px; padding-bottom:8px;
	padding-left:16px; padding-right:16px;
	text-align:center;
}
.datalist td{
	text-align:left;
}
.ErrorStyle{
	font-size: 12px;
	color:red;
	padding-left:6px;
}
.re{
	font-size: 14px;
}
</style>
</head>
<body >
	<center>
		<form action="loginCheck.jsp" method="post" id="form1">
		<table class="datalist">
		<caption>欢迎登录成绩管理系统</caption>
			<tr>
				<th>用户名：</th>
				<td><input type="text" name="username" /><span id="usernameError" class="ErrorStyle"></span></td>
			</tr>
			<tr><th> 密&nbsp;&nbsp;&nbsp;&nbsp;码：</th><td><input
				type="password" name="password" /><span id="passwordError" class="ErrorStyle"></span></td></tr>
			<tr><th>验证码：</th><td><input
				type="text" name="certCode" /> <img id="code" src="makeCertPic.jsp"><a class="re"
				href="javascript:changeimg()">换一张 </a></td>
			</tr>
			<tr class="tip">
				<td></td>
				<td><span id="certCodeError" class="ErrorStyle"></span></td></tr>
			</tr>
			<tr>
				<th>角&nbsp;&nbsp;&nbsp;&nbsp;色：</th>
				<td colspan="2">
				<input type="radio" name="userRole" value="学生" checked="checked">学生
				<input type="radio" name="userRole" value="教师">教师
				<input type="radio" name="userRole" value="管理员">管理员
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<!--<input type="button" name="login" value="登录" />-->
				</td>
			</tr>
			<tr class="btn">
				<td></td>
				<td>
					<input type="button" name="login" value="登录" />
				</td>
			</tr>
		</table>
		</form>
		<!--<div>
			<div class="ui-widget">
				<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
					<strong>学生：</strong> 用户名必须是学生本人的学号；<strong>教师：</strong>用户名必须是教师本人编号；<strong>管理员：</strong>用户名必须是管理员本人姓名</p>
				</div>
			</div>
		</div>-->
	</center>
</body>
</html>