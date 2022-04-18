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
</head>
<body>
<script type="text/javascript">
    function idok() {
        opener.joinform.id.value = "${id}";
        opener.joinform.reid.value = "${id}";
        self.close();
    }

</script>

<form method="post" class="form-signin" action="id_check_form" name="joinform">
    <div class="form-label-group">
        <input type="text" id="id" name="id" class="form-control" value="${id}"/>
    </div>

    <div class="form-label-group">
        <input class="btn btn-lg btn-secondary btn-block text-uppercase"
               type="submit" value="check">
    </div>

    <!-- 아이디가 존재할 때 -->
    <c:if test="${check == 1}">
        <script>
            opener.document.joinform.id.value = "";
        </script>
        ${id}는 사용중인 아이디입니다.
    </c:if>

    <!-- 아이디가 존재하지 않을 때 -->
    <c:if test="${check == 0 }">
        ${id}는 사용가능한 아이디입니다.
        <div class="form-label-group">
            <input class="btn btn-lg btn-secondary btn-block text-uppercase"
                   type="button" value="use this ID" onclick="idok()">
        </div>
    </c:if>

</form>

<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>
</body>

</html>