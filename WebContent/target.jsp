<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/formation.css">
</head>
<body>
<h1>hello</h1>
<div id="container" style="border: 1px solid gray;">
	<div id="ground_wrapper">
		<div id="select">
		</div>
		<!-- 축구장 그림 띄울 div에 id="ground" 지정 -->
		<div id="ground"></div>
	</div>
	<!-- 선수 명단 뿌릴 div에 id="line_up" 지정 -->
	<div id="line_up"></div>
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