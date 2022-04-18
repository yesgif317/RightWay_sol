<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Statement" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">

</head>

<body class="bg-gradient-dark">

<body>
    <%
String c_id = "";
String c_pwd = "";
String userLevel = "";
if(request.getParameter("c_id") == ""){ %>
<script>
    alert("아이디를 입력하세요");
    document.location.href = './login.jsp'
</script>
    <% }
else if(request.getParameter("c_pwd") == ""){ %>
<script>
    alert("비밀번호를 입력하세요");
    document.location.href = './login.jsp'
</script>
    <% }
else{
c_id = request.getParameter("c_id"); //ID값 가져옴
c_pwd = request.getParameter("c_pwd"); //PW값 가져옴
//여기서 부터 DB 연결 코드
Connection conn = null;
String driverName="oracle.jdbc.driver.OracleDriver";
Class.forName(driverName);
String serverName = "localhost";
String serverPort = "1521";
String sid = "orcl";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String userName = "scott";
String userPassword = "tiger";
conn = DriverManager.getConnection(url, userName, userPassword);
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("select * from customer where ID = '" + c_id + "' AND PW ='" + c_pwd + "'");
Boolean check = false;
while(rs.next()) // 결과값을 하나씩 가져와서 저장하기 위한 while문
{
String id = rs.getString("c_id"); //DB에 있는 ID가져옴
String lv = rs.getString("c_level"); // 사용제 레벨 가져옴(필수 아님)
session.setAttribute("c_id", id); //DB값을 세션에 넣음
session.setAttribute("c_level", lv); // 세션에 레벨값 넣음
check = true;
}
if(check){ //ID,PW가 DB에 존재하는 경우 게시판으로 이동하는 코드
%>
<script>
    document.location.href = '/index.do'
</script>
    <%
rs.close();
conn.close();
} else { //ID,PW가 일치하지 않는 경우
%>
<script>
    alert("ID 또는 PW를 잘못 입력했습니다.");
    document.location.href = '/login.do'
</script>
    <% }
} %>
</html>