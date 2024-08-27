<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- HTML comment : 개발자 도구탭(f12) > Elements에서 보여짐, Java코드 및 JSP관련 구문을 주석처리 할 수 없음 -->
	<%-- JSP comment : 개발자 도구탭(f12) > Elements에서 안보여짐, Java코드 및 JSP관련 구문을 주석처리 가능 --%>

	<h2>JSP 스크립팅 원소 (Scripting Elements) : jsp 에서 Java코드를 기술할 수 있게 해주는 표현법</h2>
	
	<%--
		1. 스클립틀릿 (Scriptlet)
		   1) Java코드 작성시 사용하는 기본 표현법
		   2) 변수 선언, 제어문(조건문, 반복문) 등 작성
		   3) <% Java 코드작성 %>
	--%>
	<% 
		int sum = 0;
		for(int i=1; i<=100; i++){
			sum += i;
		}
		System.out.println("덧셈결과: " + sum);
	%>
	
	<b>덧셈결과: <% out.println(sum); %></b> <br>
	
	
	<%--
		2. 표현식 (Expression)
		   1) Java에서의 값(변수, 메소드반환)을 출력할 때 사용
		   2) 표현식 안에 메소드 호출구문 작성시 ; 찍어서는 안됨
		   3) <%= Java값 %>
	--%>
	<b>덧셈결과: <%= sum %></b>  <%-- 내부적으로 <% out.println(sum); %> --%>
	<br>
	
	<% String[] name = {"김말똥", "홍길동", "강개순", "김말순"}; %>
	
	배열의 길이: <%= name.length %> <br>
	배열에 담긴 값: <%= String.join("-", name) %> <br>
	
	<%-- for문 활용 --%>
	<ul>
		<% for(int i=0; i<name.length; i++) { %>
			<li><%= name[i] %></li>
		<% } %>
	</ul>
	
	
	<%--
		3. 선언식 
		   1) 메소드를 정의해둘 때 사용 
		   2) 선언식으로 정의된 메소드는 해당 jsp에서 호출가능
		   3) <%! 메소드 정의 %>
	--%>
	

</body>
</html>