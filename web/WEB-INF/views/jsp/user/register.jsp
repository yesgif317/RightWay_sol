<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

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

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                        </div>

                        <!-- form -->
                        <form class="register" action="/register.do" method="POST" name="joinform">
                            <div class="form-group row">
                                <div class="form-label-group">
                                    <input type="text" name="c_id" class="form-control" placeholder="ID" required autofocus value="${c_id}">
                                    <input type="hidden" name="reid" id="reid">
                                </div>

                                <div class="form-label-group">
                                    <button
                                            class="btn btn-dark btn-user btn-block"
                                            type="button" onclick="idcheck()">중복 확인
                                    </button>
                                </div>

                            </div>

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user" name="c_pwd"
                                           placeholder="비밀번호">
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user" name="c_pwdcheck"
                                           placeholder="비밀번호 확인">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" name="c_name"
                                       placeholder="이름">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" name="c_email"
                                       placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" name="c_phone"
                                       placeholder="연락처 (-제외 숫자만 입력)">
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-3 mb-3 mb-sm-0">
                                    <a href="" class="btn btn-dark btn-user btn-block">
                                        회사선택
                                    </a>
                                </div>
                                <div class="col-sm-9 ">
                                    <input type="text" class="form-control form-control-user" name="com_name"
                                           placeholder="회사명" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" name="c_dep"
                                       placeholder="부서명">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" name="c_position"
                                       placeholder="직책">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="d-block text-center mt-2 small">회원 가입</button>
                            </div>
                        </form>
                        <hr>
                        <div class="text-center">
                            <a class="small text-gray-700" href="/forgot_password.do">비밀번호 찾기</a>
                        </div>
                        <div class="text-center">
                            <a class="small text-gray-700" href="/login.do">로그인페이지로 이동</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<script>
    function idcheck() {
        if (document.joinform.c_id.value == "") {
            alert("아이디를 입력해주세요.");
            document.joinform.c_id.focus();
            return false;
        }

        var url = "/idCheck.do";

        window.open(url, "_blank_1",
            "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=300");
    }
</script>

</body>

</html>
