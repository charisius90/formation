<%@page import="java.util.ArrayList"%>
<%@page import="java.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/formation.css">
</head>
<body>
<h1>hello</h1>
<div id="formation">
	<div id="ground" class="ground"></div>
	<div id="list">
		<div id="participate_wrapper" style="float: left;">
			<label for="#participate">라인업</label><br/>
			<select id="participate" size="20"></select>
		</div>
		<div id="member_wrapper">
			<label for="#member">등번호 이름</label><br/>
			<select id="member" size="20"></select><br/>
			<input type="button" value="등록" onclick="fnRegisterProc()"/>
		</div>
	</div>
	<form id="request" method="POST" action="list.action">
		<input type="button" value="멤버 가져오기" onclick="fnTest()"/>
	</form>
</div>
<!--Import jQuery before formation.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script type="text/javascript" src="/js/formation.js"></script>
<script>

</script>
<script>
// 	$(document).ready(function(){
// 		// ground 그리기
// 		$("#ground").ground();
// 	});
</script>
</body>
</html>