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
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">

</head>

<body class="bg-gradient-dark">

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-3 d-none d-lg-block"></div>
                <div class="col-lg-6">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                        </div>
                        <form class="user">
                            <div class="form-group row">
                                <div class="col-sm-9 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" id="ID" placeholder="ID">
                                </div>

                                <div class="col-sm-3">
                                    <a href="" class="btn btn-dark btn-user btn-block">
                                    중복확인
                                </a>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user" id="InputPassword" placeholder="비밀번호">
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user" id="RepeatPassword" placeholder="비밀번호 확인">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="Name" placeholder="이름">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="Email" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="Phone" placeholder="연락처 (-제외 숫자만 입력)">
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-3 mb-3 mb-sm-0">
                                    <a href="" class="btn btn-dark btn-user btn-block">
                                        회사선택
                                    </a>
                                </div>
                                <div class="col-sm-9 ">
                                    <input type="text" class="form-control form-control-user" id="Company" placeholder="회사명" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="Dep" placeholder="부서명">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="Position" placeholder="직책">
                            </div>
                            <a href="/login.do" class="btn btn-dark btn-user btn-block">
                               회원가입
                            </a>
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
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

</body>

</html>
