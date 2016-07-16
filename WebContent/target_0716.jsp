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
	<div id="ground" style="float: left;"></div>
	<div id="list">
		<div id="participate_wrapper" style="float: left;">
			<label for="#participate">라인업</label><br/>
			<select id="participate" size="20"></select>
		</div>
		<div id="member_wrapper">
			<label for="#member">등번호 이름</label><br/>
			<select id="member" size="20"></select><br/>
			<input type="button" value="등록" onclick="fnRegister()"/>
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
// 테스트용

	// 등록된 선수 객체 저장 배열, 등록할 객체 인스턴스, 제거할 객체 인스턴스
	var register_arr = new Array(),
		register_instance,
		remove_instance;
	
	var $member = $("#member");
	var $ground = $("#ground");
	
	// 등록할 사용자 이름, 등번호, 등록될 위치 
	var name,
		backnumber,
		center_top,
		center_left;
	
	// 멤버 리스트 가져오기
	function fnTest(){
		$member.html("");
		var num;
		for(var i=0; i<20; i++){
			num = i;
			if(i<10){
				num = "0" + i;
			}
			$member.append("<option>" + num + " name" + i + "</option>");
		}
	}
	
	// 등록할 멤버가 이미 등록되었는지 확인하기
	function isRegistered(backnumber){
		var result = false;
		for(var i=0; i<register_arr.length; i++){
			if(register_arr[i].getBacknumber() == backnumber){
				result = true;
			}
		}
		return result;
	}
	
	var offset = 40;
	// 라인업에 선수 등록
	function fnRegister(){
		var pos_top = $ground.position().top,
			pos_left = $ground.position().left,
			off_top = $ground.height()/2,
			off_left = $ground.width()/2;
		
		center_top = eval(pos_top + off_top) - offset;
		center_left = eval(pos_left + off_left) - offset;
		
		var select_val = $member.val();
		backnumber = select_val.split(" ")[0];
		name = select_val.split(" ")[1];
		
		if(isRegistered(backnumber)){
			alert("이미 등록된 선수 입니다.");
			return;
		}
		
		console.log("position top: " + $ground.position().top + "/ left: " + $ground.position().left);
		console.log("add top: " + ($ground.height() / 2) + "/ left: " + ($ground.width() / 2));
		console.log("added top: " + center_top + "/ left: " + center_left);
		console.log("test top: " + eval(parseInt($ground.position().top) + parseInt($ground.height()/2)) + "/ left: " + eval(parseInt($ground.position().left) + parseInt(100)));
		console.log("test2 top: " + eval(($ground.position().top) + ($ground.height()/2)) + "/ left: " + eval(($ground.position().left) + ($ground.width()/2)));
		
		$ground.append("<div id='player" + backnumber + "' class='uniform' style='top:" + center_top + "px; left:" + center_left + "px'><span class='backnumber'>"+backnumber+"</span></div>");
		
		register_instance = new Uniform();
		register_instance.setBacknumber(backnumber);
		register_instance.setName(name);
		register_instance.setLocation(new Location(center_top, center_left));
		register_arr.push(register_instance);
		
		// draggable 설정
		$("#player" + backnumber).draggable({
			containment: "#ground",		// 지정된곳 안에서만 드래그 가능
			scroll: false,
			addClasses: true,
			create: function(event, ui){
				$("#formation").append(	"<div id='popover" + backnumber + "' class='uniform_popover'>" +
											"<table>" + 
												"<tr>" +
													"<td><span class='uniform_menu' onclick='fnDelete("+ backnumber +")'>삭제</span></td>" +
												"</tr>" +
												"<tr>" +
													"<td><span class='uniform_menu' onclick='fnClose("+ backnumber +")'>창닫기</span></td>" +
												"</tr>" +
											"</table>" +
										"</div>");
				$("#popover" + backnumber).hide();
				// 추가된 div 태그에 이벤트 등록
				$(this).click(function(){
					$("#popover" + backnumber).attr("style", "top:" + register_instance.getLocation().getTop() + "; left:" + register_instance.getLocation().getLeft());
					$("#popover" + backnumber).show();
// 					$("#popover" + backnumber).toggle();
				});
			},
			start: function(event, ui){
				console.log("drag start!!!");
			},
			drag: function(event, ui){
				console.log("dragging!!!");
			},
			stop: function(event, ui){
				console.log("drag stop!!! left: " + $("#player"+backnumber).position().left + ", top: " + $("#player"+backnumber).position().top + ", test : " + $(this).position().top);
				var loc = register_instance.getLocation();
				loc.setTop($(this).position().top);
				loc.setLeft($(this).position().left);
			}
		});
		
		// 다음에 추가될 div 위치 변경
		offset -= 10;
	}
	
	// 등번호로 등록된 객체 인덱스 찾기
	function fnFindByBacknumber(backnumber){
		for(var i=0; i<register_arr.length; i++){
			if(register_arr[i].getBacknumber() == backnumber){
				return i;
			}
		}
	}
	
	// 제거
	function fnDelete(backnumber){
		$("#player"+backnumber).remove();
		register_arr.pop(fnFindByBacknumber(backnumber));
		for(var i=0; i<register_arr.length; i++){
			console.log("등록된 등번호 목록 : " + register_arr[i].getBacknumber());
		}
		fnClose(backnumber);
		$("#popover"+backnumber).remove();
	}
	
	// 창닫기
	function fnClose(backnumber){
		$("#popover" + backnumber).hide();
	}
	
</script>
<script>
	$(document).ready(function(){
		// ground 그리기
		$("#ground").ground();
	});
	
	
</script>
</body>
</html>