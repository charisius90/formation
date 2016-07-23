<%@page import="java.util.ArrayList"%>
<%@page import="java.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="css/formation.css">
</head>
<body>
	<h1>hello</h1>
	<div id="formation">
		<div id="ground" class="ground"></div>
		<div id="list">
			<table>
				<tr>
					<th><label for="#participate">라인업</label><br /></th>
					<th></th>
					<th><label for="#member">등번호 이름</label><br /></th>
				</tr>
				<tr>
					<td>
						<select id="firstLineUp" onclick="fnFirstLineUpSelect()" size="11"></select>
						<hr width="100%" /> 
						<select id="subLineUp" onclick="fnSubLineUpSelect()" size="6"></select>
					</td>
					<td><div id="">
							<input type="button" value="추가" onclick="fnLineUpRegister()" /> 
							<br/>
							<input type="button" value="제외" onclick="fnLineUpRemove()" />
						</div></td>
					<td><select id="member" size="20"></select><br /></td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="radio" name="lineUpType" value="first" checked="checked">선발 
						<input type="radio" name="lineUpType" value="sub">후보</td>
				</tr>
			</table>
		</div>
		<form id="request" method="POST" action="list.action">
			<input type="button" value="멤버 가져오기" onclick="fnTest()" />
		</form>
	</div>
	<!--Import jQuery before formation.js-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
	<script type="text/javascript" src="js/formation.js"></script>
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