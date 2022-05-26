<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MY - SIM</title>

    <!-- Custom fonts for this template-->
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
    <script>

        function findpw() {
            console.log("비밀번호 찾기 버튼실행");
            $.ajax({
                url: "forgot_password.do",
                type: "POST",
                data: {
                    cus_id: document.getElementById("InputCusId").value,
                    cus_email: document.getElementById("InputCusEmail").value
                },
                success: function (result) {
                    alert(result);
                }
            });
        }
    </script>
</head>

<body class="bg-gradient-dark">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9" style="margin-top: 10%">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-2">비밀번호를 잊어버리셨나요?</h1>
                                    <p class="mb-4">아래에 이메일 주소를 입력하시면 <br>해당하는 암호를 재설정 해드립니다.</p>
                                </div>
                                <form class="user">
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user mb-2" id="InputCusId"
                                               name="InputCusId" placeholder="사용자 아이디." required>
                                        <input type="email" class="form-control form-control-user" id="InputCusEmail"
                                               name="InputCusEmail" placeholder="사용자 이메일" required>
                                    </div>
                                    <button type="button" id="findBtn" class="btn btn-dark btn-user btn-block" onclick="findpw()">
                                        비밀번호 찾기
                                    </button>
                                </form>
                                <hr>
                                <div class="text-center mb-1">
                                    <a class="small" href="/register.do">회원 가입</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="/login.do">로그인</a>
                                </div>
                            </div>
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

</body>

</html>
