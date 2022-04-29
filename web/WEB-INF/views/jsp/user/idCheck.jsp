<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ID check</title>

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
        opener.joinform.cus_id.value = "${cus_id}";
        opener.joinform.reid.value = "${cus_id}";
        self.close();
    }

</script>

<form method="post" class="form-signin" action="/idCheck.do" name="joinform">
    <div class="form-label-group">
        <input type="text" id="cus_id" name="cus_id" class="form-control" value="${cus_id}"/>
    </div>

    <div class="form-label-group">
        <input class="btn btn-lg btn-secondary btn-block text-lowercase"
               type="submit" value="중복확인">
    </div>

    <!-- 아이디가 존재할 때 -->
    <c:if test="${check == 1}">
        <script>
            opener.document.joinform.cus_id.value = "";
        </script>
        ${cus_id}는 사용중인 아이디입니다.
    </c:if>

    <!-- 아이디가 존재하지 않을 때 -->
    <c:if test="${check == 0 }">
        ${cus_id}는 사용가능한 아이디입니다.
        <div class="form-label-group">
            <input class="btn btn-lg btn-secondary btn-block text-lowercase"
                   type="button" value="use this ID" onclick="idok()">
        </div>
    </c:if>

</form>


</body>

</html>