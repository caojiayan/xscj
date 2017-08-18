<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

	<head>
		<script type="text/javascript">
			$(function() {
				$("#copy").button();
				$("#exit").button();
				$("#dialog2").dialog({
					autoOpen: false,
					width: 400,
					buttons: [{
							text: "修改",
							click: function() {
								if($("input[name=oldPass]").val() == "") {
									$(".ErrorStyle").empty();
									$("#oldPassError").text("旧密码不能为空");
								} else if($("input[name=newPass]").val() == "") {
									$(".ErrorStyle").empty();
									$("#newPassError").text("新密码不能为空");
								} else if($("input[name=newPass]").val() != $("input[name=rePass]").val()) {
									$(".ErrorStyle").empty();
									$("#rePassError").text("两次密码输入不匹配");
								} else {
									$.ajax({
										type: "post",
										url: "adminPassModify.action",
										dataType: "json",
										data: {
											adminName: $("input[name=adminName]").val(),
											oldPass: $("input[name=oldPass]").val(),
											newPass: $("input[name=newPass]").val(),
											rePass: $("input[name=rePass]").val()
										},
										success: function(data) {
											var d = eval("(" + data + ")");
											if(d.flag) {
												alert("密码修改成功,将会跳转到登录页面请用新密码重新登录");
												window.location.href = "index.jsp";
											} else {
												$(".ErrorStyle").empty();
												$("#oldPassError").text("旧密码输入错误");
											}

										},
										error: function() {
											alert("系统异常，请稍后重试！");
										}
									});
								}
							}
						},
						{
							text: "取消",
							click: function() {
								$(this).dialog("close");
							}
						}
					]
				});

				// Link to open the dialog
				$("#dialog2-link").click(function(event) {
					$("#dialog2").dialog("open");
					event.preventDefault();
				});
				
	    });
			
		</script>
		<Style>
			.popInfo {
				text-align: left;
			}
			
			#dialog2-link {
				display: inline-block;
				width:76px;
				height: 28px;
				line-height: 28px;
				text-align: center;
				text-decoration: none;
			}
			
			#dialog2-link span.ui-icon {
				margin: 0 5px 0 0;
				position: absolute;
				left: .2em;
				top: 50%;
				margin-top: -8px;
			}
			
			.ErrorStyle {
				color: red;
				border-left: 6px;
			}
			/*-------2017.8.18-------*/
			
			body {
				background-color: #eee;
				position: relative
			}
			#ui-accordion-accordion-header-0{
				background: #FFF;
			}
			.ui-state-active{
				border-top-right-radius: 0;
				border-top-left-radius: 0;
				border: 1px solid #4bacff;
			}
			
			.ui-widget-content{
				background: #FFF;
			}
			.navLeft {
				position: absolute;
				top: 47px;
				left: 0;
				width: 100px;
				background: #FFF;
			}
			
			.navLeft>a {
				display: block;
				width: 100%;
				box-sizing: border-box;
				margin-bottom: 10px;
				text-decoration: none;
				background-color:#1c94c4;
				color: #fff;
				margin: 0;
				margin-bottom: 1px;
				font-size: 16px;
			}
			.navLeft a.aa{
				font-weight: bold;
			}
			.navLeft>a>span{
				float: right;
			}
			.navLeft li{
				text-decoration: none;
				list-style-type:none;
				background-color: #fff;
				
			}
			.navLeft li a{
				
				text-decoration: none;
			}
			.navLeft a{
				line-height: 35px;
			}
			.navLeft .navUl{
				width: 100%;
			}
			.navLeft .navUl>ul{
				width: 100%;
				padding: 0;
				margin: 0;
			}
			.navLeft .navUl>ul a{
				display: block;
				width: 100%;
				font-size: 14px;
				color: #1c94c4;
			}
		</Style>
	</head>

	<body>
		<s:if test="#session['userName'] != null">
			<div align="right">

				<a href="#" id="dialog2-link" class="ui-state-default ui-corner-all">修改密码</a>
				<a href="exitSystem.action"><button id="exit">退出系统</button></a>&nbsp;&nbsp;登录用户名：
				<s:property value="#session['userName']" /> 用户身份：
				<s:property value="#session['userRole']" /> &nbsp;&nbsp;
			</div>
		</s:if>
		<br>
		<div class="navLeft" align="center">
			
			<a class="stuSerivce-a aa" id="stuSerivce-a"  href="stuForm.action">
				学生管理
				<span style="display: none;">&or;</span>
				<span>&and;</span>
			</a><!--href="stuSearch.action"-->
			
			
			
			<a class="teacherService-a aa" id="teacherService-a" href="teacherForm.action">教师管理<span>&or;</span><span style="display: none;">&and;</span></a>  <!--href="teacherSearch.action"-->
			
		
		
			<a class="courseService-a aa" id="courseService-a" href="courseForm.action">课程管理<span>&or;</span><span style="display: none;">&and;</span></a>
          
		    
		    
			<a class="gradeService-a aa" id="gradeService-a" href="gradeSetUp.action">班级管理<span>&or;</span><span style="display: none;">&and;</span></a>
            
		    
		    
			<a class="scoreService-a aa" id="scoreService-a" href="scoreEnterChose.action" style="margin-bottom:0;">成绩管理<span>&or;</span><span style="display: none;">&and;</span></a>
		
		
		</div>
		<div id="dialog2" title="密码修改" class="popInfo">
			<form action="" method="post" id="form1">
				<input type="hidden" name="adminName" value='<s:property value="#session[' userName ']" />'/>
				<p><strong>原始密码：</strong><input type="password" name="oldPass" /><span id="oldPassError" class="ErrorStyle"></span></p>
				<p><strong>新 &nbsp;密 &nbsp;码：</strong><input type="password" name="newPass" /><span id="newPassError" class="ErrorStyle"></span></p>
				<p><strong>确认密码：</strong><input type="password" name="rePass" /><span id="rePassError" class="ErrorStyle"></span></p>
			</form>
		</div>
	</body>

</html>