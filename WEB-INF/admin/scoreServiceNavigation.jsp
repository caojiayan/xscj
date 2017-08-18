<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<style>
  		#scoreService{
  			margin-left: 100px;
  		}
  	</style>
  	 <script>
	$(function() {
		$( "#scoreService" ).tabs();
		$(".button").button();
	});
	</script>
  </head>
  <body>
  <jsp:include page="navigation.jsp"></jsp:include>
<!--<div id="scoreService">
	<div id="scoreService-1">
   		<a href="scoreEnterChose.action"><button class="button">成绩录入</button></a>
    <a href="scoreQuery.action"><button class="button">成绩查询和分析</button></a>
    <a href="scoreModify.action"><button class="button">成绩修改</button></a>
    <a href="scoreDelete.action"><button class="button">成绩删除</button></a>
    <a href="scoreCount.action"><button class="button">成绩统计</button></a>
     <a href="scorePrinter.action"><button class="button">成绩打印</button></a>
    </div>
</div>-->
<script>
	$(function(){
		 	$('#scoreService-a').append('<div class="scoreService navUl">'+
		 		'<ul id="scoreService-1">'+
		 			'<li><a href="scoreEnterChose.action">成绩录入</a></li>'+
		 			'<li><a href="scoreQuery.action">成绩查询和分析</a></li>'+
		 			'<li><a href="scoreModify.action">成绩修改</a></li>'+
		 			'<li><a href="scoreDelete.action">成绩删除</a></li>'+
		 			'<li><a href="scoreCount.action">成绩统计</a></li><li>'+
		 				'<a href="scorePrinter.action">成绩打印</a></li>'+
		 				'</ul></div>');
	});
	</script>
  </body>
</html>
