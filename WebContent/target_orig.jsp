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
<div id="container" class="formation_container" style="border: 1px solid gray;">
	<div id="ground_wrapper" class="ground_wrapper">
		<!-- 인원수, 포메이션 지정 select 태그 위치 -->
		<div id="select" class="select"></div>
		<!-- 축구장 그림 띄울 div에 id="ground" 지정 -->
		<div id="ground"></div>
	</div>
	<!-- 선수 명단 뿌릴 div에 id="line_up" 지정 -->
	<div id="player_list" class="buttons">
		<div id="line_up_list">
			<div id="startings_wrapper">
				<select id="startings" size="10">
					<c:forEach items="${startings}" var="member">
						<option>이름 : ${member.name}</option>
					</c:forEach>
				</select>
			</div>
			<div id="substitutes_wrapper">
				<select id="substitutes" size="10">
					<c:forEach items="${substitutes}" var="member">
						<option>이름 : ${member.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div id="member_list">
			<select id="members" size="10">
				<c:forEach items="${members}" var="member">
					<option>이름 : ${member.name}</option>
				</c:forEach>
				<option>이름: 선수1</option>
				<option>이름: 선수2</option>
				<option>이름: 선수3</option>
				<option>이름: 선수4</option>
				<option>이름: 선수5</option>
				<option>이름: 선수6</option>
				<option>이름: 선수7</option>
				<option>이름: 선수8</option>
				<option>이름: 선수9</option>
				<option>이름: 선수10</option>
				<option>이름: 선수11</option>
			</select>
			<button id="register">등록</button>
		</div>
	</div>
</div>
<!--Import jQuery before formation.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script type="text/javascript" src="/js/formation.js"></script>
<script>
	$(document).ready(function(){
		// ground 그리기
		$("#ground").ground();
		
		// select태그 추가하고 change마다 유니폼 뿌려주는 이벤트 등록
		$("#select").select();
	});
</script>
</body>
</html>