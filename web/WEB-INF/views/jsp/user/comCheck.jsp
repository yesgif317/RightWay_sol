<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회사 선택</title>

    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">

    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>
</head>
<body>
<script type="text/javascript">
    function idok() {
        opener.joinform.com_name.value = "${com_name}";
        self.close();
    }

</script>

<form method="post" class="form-signin" action="/comCheck.do" name="checkform">
    <div class="form-label-group">
        <input type="text" id="com_name" name="com_name" class="form-control" value="${com_name}"/>
    </div>

    <div class="form-label-group">
        <input class="btn btn-lg btn-secondary btn-block text-lowercase"
               type="submit" value="회사 검색">
    </div>


    <c:forEach items="${CompanyList}" var="com">
    <tr>
        <td>${com.com_name}</td>
    </tr>
    </c:forEach>
    <div class="form-label-group">
        <input class="btn btn-lg btn-secondary btn-block text-lowercase"
               type="button" value="use this ID" onclick="idok()">
    </div>
</form>


</body>

</html>