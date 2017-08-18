<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>洛天工作室</title>
    <link href="css/ui-lightness/jquery-ui-1.10.4.custom.css"
	rel="stylesheet">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript">
	$(function(){
		$("#accordion").accordion();
	});
</script>
<style type="text/css">
	html{
		width: 100%;
	height: 100%;
	}
body {
	width: 100%;
	height: 100%;
	font: 72.5% "Trebuchet MS", sans-serif;
	margin: 50px;
	background-color:#FFF;
	background: url(image/lbg.jpg) no-repeat center center;
	background-size: 100% 100%;
}
#info{
	height:400px;
}
#accordion{
	margin-left: 100px;
}
</style>
  </head>
  
  <body>
    <jsp:include page="stuServiceNavigation.jsp"></jsp:include>
    <div id="accordion">
    	<h3>欢迎您的使用成绩管理系统</h3>
    </div>
  </body>
</html>
