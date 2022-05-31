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

    <title>MY - SIM</title>

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
                            <h5 class="h5 text-gray-900 mb-4">회원가입</h5>
                        </div>
                        <hr>

                        <!-- form -->
                        <form class="register" action="/register.do" method="POST" name="joinform" id="joinform" style="margin-left: 13%">
                            <div class="form-group row">
                                <b class="text-danger small">*</b>
                                <div class="col-sm-5 mb-3 mb-sm-0">
                                    <div class="form-label-group">
                                        <input type="text" name="cus_id" id="cus_id" class="form-control"
                                               placeholder="아이디" required autofocus value="${cus_id}" maxlength="20">
                                        <input type="hidden" name="reid" id="reid">
                                    </div>
                                </div>
                                <div class="form-label-group col-sm-3">
                                    <button
                                            class="btn btn-secondary btn-user btn-block"
                                            type="button" onclick="idcheck()">중복 확인
                                    </button>
                                </div>
                                <small class="mt-2 ml-3">아이디는 영문 소문자와 숫자 4~12자리로 입력되어야 합니다.</small>
                            </div>

                            <div class="form-group row">
                                <b class="text-danger small">*</b>
                                <div class="col-sm-5 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user" name="cus_pwd"
                                           id="cus_pwd"
                                           placeholder="비밀번호" maxlength="20">
                                </div>
                                <b class="text-danger small">*</b>
                                    <div class="col-sm-5 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                               name="cus_pwdcheck"
                                               id="cus_pwdcheck"
                                               placeholder="비밀번호 확인">
                                    </div>
                                <small class="mt-2 ml-3">8~20자리의 길이의 영문자,숫자,특수문자 조합으로 입력되어야 합니다.</small>
                                </div>

                            <div class="form-group row">
                                <b class="text-danger small">*</b>
                                <div class="col-sm-5 mb-3 mb-sm-0">
                                <input type="text" class="form-control form-control-user" name="cus_name" id="cus_name"
                                       placeholder="이름" maxlength="20">
                                </div>
                                <b class="text-danger small">*</b>
                                <div class="col-sm-5 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user mb-1" name="cus_phone"
                                           id="cus_phone"
                                           placeholder="연락처" maxlength="20">
                                    <sup>&nbsp;010-0000-0000 형식으로 입력</sup>
                            </div>
                            </div>

                            <div class="form-group row">
                                <b class="text-danger small">*</b>
                                <div class="col-sm-10 mb-3 mb-sm-0">
                                <input type="email" class="form-control form-control-user" name="cus_email"
                                       id="cus_email"
                                       placeholder="이메일 (example@example.com)" maxlength="30">
                                </div>
                                <small class="mt-2 ml-3">비밀번호 분실시 이메일을 통하여 발급됩니다.</small>
                            </div>


                            <div class="form-group row">
                                <b class="text-danger small">*</b>
                                <div class="col-sm-5 mb-3 mb-sm-0">
                                    <input type="text" class="form-control text" name="com_name" id="com_name"
                                           placeholder="회사명" value="${com_name}" disabled>
                                    <input type="hidden" class="form-control text" name="com_num" id="com_num"
                                           value="${com_num}">
                                </div>
                                <div class="form-label-group col-sm-3">
                                    <button
                                            class="btn btn-secondary btn-user btn-block"
                                            type="button" onclick="comcheck()">회사 선택
                                    </button>
                                </div>
                            </div>

                            <div class="form-group row" >
                                <div class="col-sm-5 mb-3 mb-sm-0" style="margin-left: 1.3%">
                                <input type="text" class="form-control form-control-user" name="cus_dep" id="cus_dep"
                                       placeholder="부서명" maxlength="20">
                            </div>

                                <div class="col-sm-5 mb-3 mb-sm-0">
                                <input type="text" class="form-control form-control-user" name="cus_position"
                                       id="cus_position"
                                       placeholder="직책" maxlength="20">
                            </div>
                            </div>

                            <input type="hidden" name="cus_state" value="0"> <!-- 회원가입 확인하려고 만든 임시변수 -->
                            <div class="form-group row">
                                <div class="col-sm-10 mb-3 mb-sm-0 ml-2">
                                <input type="button" onclick="chk_form()" class="btn btn-info btn-user btn-block pt-2 pb-2"
                                       value="회원 가입"/>
                                </div>
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
        if (document.joinform.cus_id.value == "" || document.joinform.cus_id.length == 0) {
            alert("아이디를 입력해주세요.");
            document.joinform.cus_id.focus();
            return false;
        }


        var id = document.joinform.cus_id.value;

        window.open("/idCheck.do?cus_id=" + id, "",
            "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=300");
    }

    function comcheck() {
        window.open("/comCheck.do?", "", "toolbar=no, menubar=yes, scrollbars=yes, resizable=no, width=800, height=500")

    }


    function chk_form() {
        //id 길이 확인용 변수 선언
        var id = document.joinform.cus_id.value;

        //최소 4자 최대 12자, 영문 소문자 와 숫자로 이루어진 아이디
        var idtext = /^[a-z0-9]{4,12}$/

        //최소 8자, 하나의 이상의 대소문자 및 하나의 숫자, 하나의 특수문자
        var pwdtext = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

        //3자리/ 3,4자리 / 4자리 숫자
        var phonetext = /^\d{3}-\d{3,4}-\d{4}$/;

        //'@' 포함여부와 대문자,소문자를 구분하지않게 표현식끝에 i 사용
        var exptext = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i

        if (document.getElementById("cus_id").value == '') {
            alert("아이디를 입력해주세요.");
            document.joinform.cus_id.focus();
            exit;
        } else if (idtext.test(document.joinform.cus_id.value) == false) {
            alert("아이디는 영문 소문자와 숫자로만 이루어져야 합니다 \n아이디의 길이가 4~12자 이내인지 확인해주세요.")
            document.joinform.cus_id.focus();
            exit;
        } else if (id.length < 4 || id.length > 13) {
            alert("아이디가 4~12자 이내인지 확인해주세요.")
            document.joinform.cus_id.focus();
            exit;
        } else if (document.getElementById("reid").value == '') {
            alert("아이디 중복을 확인해주세요.");
            document.joinform.cus_id.focus();
            exit;
        } else if (document.getElementById("reid").value != document.getElementById("cus_id").value) {
            alert("아이디 중복을 다시 확인해주세요.");
            document.joinform.cus_id.focus();
            exit;
        } else if (document.getElementById("cus_pwd").value == '') {
            alert("비밀번호를 입력해주세요.");
            document.joinform.cus_pwd.focus();
            exit;
        } else if (document.getElementById("cus_pwdcheck").value == '') {
            alert("비밀번호확인을 입력해주세요.");
            document.joinform.cus_pwdcheck.focus();
            exit;
        } else if (document.getElementById("cus_name").value == '') {
            alert("이름을 입력해주세요.");
            document.joinform.cus_name.focus();
            exit;
        } else if (document.getElementById("cus_email").value == '') {
            alert("이메일을 입력해주세요.");
            document.joinform.cus_email.focus();
            exit;
        } else if (document.getElementById("cus_phone").value == '') {
            alert("전화번호를 입력해주세요.");
            document.joinform.cus_phone.focus();
            exit;
        } else if (document.getElementById("com_name").value == '') {
                alert("회사를 선택해주세요.");
                document.joinform.com_name.focus();
                exit;
        }

        if (document.joinform.cus_pwd.value != document.joinform.cus_pwdcheck.value) {
            //비밀번호와 비밀번호 확인의 값이 다를경우
            alert("입력한 2개 의 비밀번호가 일치하지 않습니다.");
            document.joinform.cus_pwd.focus();
            exit;
        }
        if (pwdtext.test(document.joinform.cus_pwd.value) == false) {
            alert("비밀번호 형식이 올바르지 않습니다. 8자 이상의 영문자,숫자,특수문자 조합으로 이루어져야 합니다.");
            document.joinform.cus_pwd.focus();
            exit;
        }

        if (phonetext.test(document.joinform.cus_phone.value) == false) {
            alert("전화번호 형식이 올바르지 않습니다. ex)010-0000-0000");
            document.joinform.cus_phone.focus();
            exit;
        }

        if (exptext.test(document.joinform.cus_email.value) == false) {
            //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우

            alert("이메일형식이 올바르지 않습니다. ex)example@example.com");
            document.joinform.cus_email.focus();
            exit;
        }

        document.joinform.submit();
    }


</script>

</body>

</html>
