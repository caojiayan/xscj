<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<style>
			#gradeService {
				margin-left: 100px;
			}
		</style>
		<script>
			$(function() {
				$("#gradeService").tabs();
				$(".button").button();
			});
		</script>
	</head>

	<body>
		<jsp:include page="navigation.jsp"></jsp:include>
		<!--<div id="gradeService">
			<div id="gradeService-1">
				<a href="gradeSetUp.action"><button class="button">班级信息添加</button></a>&nbsp;&nbsp;
				<a href="gradeTeachingChose.action"><button class="button">班级教学安排</button></a>&nbsp;&nbsp;
				<a href="gradeAll.action"><button class="button">班级信息删除</button></a>&nbsp;&nbsp;
			</div>
		</div>-->
	</body>
    <script>
    	$(function(){
		 	$('#gradeService-a').append('<div class="gradeService navUl">'+
			    '<ul id="gradeService-1">'+
				    '<li><a href="gradeSetUp.action">班级信息添加</a></li>'+
				    '<li><a href="gradeTeachingChose.action">班级教学安排</a></li>'+
				    '<li><a href="gradeAll.action">班级信息删除</a></li>'+
			    '</ul>'+
		    '</div>');
	});
	</script>
</html>