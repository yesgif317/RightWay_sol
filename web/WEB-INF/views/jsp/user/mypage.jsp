<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../../include/header.jsp" flush="true" />
<jsp:include page="../../include/sidebar.jsp" flush="true" />

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column" >

    <!-- Main Content -->
    <div id="content">
        <jsp:include page="../../include/topbar.jsp" flush="true" />
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">

                    <!-- Collapsable Card Example -->
                    <div class="card shadow mb-4">
                        <!-- Card Header - Accordion -->
                        <a class="d-block card-header py-3">
                            <h5 class="m-0 font-weight-bold text-primary text-center">마이페이지</h5>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <form method="post" action="mypage_update.do?cus_num=${login.cus_num}" id="updateform" name="updateform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label fa-solid m-2">ID</label></div>
                                        <div class="col-12 col-md-7 text-gray-900 text-lg mt-1">${login.cus_id} <a class="btn btn-sm btn-secondary ml-3 text-gray-100" data-toggle="modal" data-target="#passwordModal">비밀번호변경</a></div>
                                        <input type="hidden" name="login.cus_id" value="">
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label fa-solid m-2">이름</label></div>
                                        <div class="col-12 col-md-7 text-gray-900 text-lg mt-1">${login.cus_name}</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label fa-solid m-2">회사</label></div>
                                        <div class="col-12 col-md-7 text-gray-900 text-lg mt-1">${login.com_name}</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label fa-solid m-2">이메일</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">
                                            <input type="email" id="cus_email" name="cus_email" placeholder="이메일주소를 입력해주세요." class="form-control" value="${login.cus_email}">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label fa-solid m-2">연락처</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">
                                            <input type="text" id="cus_phone" name="cus_phone" placeholder="연락처를 입력해주세요.( - 포함 입력)" class="form-control" value="${login.cus_phone}">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label fa-solid m-2">부서</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">
                                            <input type="text" id="cus_dep" name="cus_dep" placeholder="소속부서를 입력해주세요." class="form-control" value="${login.cus_dep}">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label fa-solid m-2">직책</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">
                                            <input type="text" id="cus_position" name="cus_position" placeholder="직책을 입력해주세요." class="form-control" value="${login.cus_position}">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="text-center d-block card-header py-3">
                                <a  class="btn btn-info" data-toggle="modal" data-target="#exampleModal">
                                                 <span class="icon text-white-50">
                                                   <i class="fas fa-pen"></i>
                                                 </span>
                                    <span class="text" style="color:white">저장</span>
                                </a>
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">회원정보수정</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                수정하시겠습니까?
                                            </div>
                                            <div class="modal-footer">
                                                <button onclick= "document.getElementById('updateform').submit()" type="button" class="btn btn-info">확인</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true" >
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel1">비밀번호변경</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                            </div>
                                            <form method="post" action="updatePassword.do?check_pwd=${login.cus_pwd}" id="passwordform" name="passwordform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <input type="password" class="form-control form-control-user" name="old_pwd"
                                                           id="old_pwd"
                                                           placeholder="기존비밀번호">
                                                </div>
                                                <div class="form-group text-left">
                                                    <input type="password" class="form-control form-control-user" name="cus_pwd"
                                                           id="cus_pwd"
                                                           placeholder="변경비밀번호">
                                                    <small>&nbsp; 8자 이상의 영문자,숫자,특수문자 조합으로 입력되어야 합니다.</small>
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" class="form-control form-control-user" name="new_pwd"
                                                           id="new_pwd"
                                                           placeholder="변경비밀번호확인">
                                                </div>
                                            </div>
                                                <input  type="hidden" name="cus_num" value="${login.cus_num}">
                                                <input  type="hidden" name="cus_id" value="${login.cus_id}">
                                        </form>
                                            <div class="modal-footer">
                                                <button class="btn btn-info" type="button" onclick="chk_form()">변경</button>
                                                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <a href="index.do" class="btn btn-secondary">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-list"></i>
                                                </span>
                                    <span class="text">취소</span>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

<script>
    function chk_form() {
        var pwdtext = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

        if (document.getElementById("old_pwd").value === '') {
            alert("기존비밀번호를 입력해주세요.");
            document.getElementById("old_pwd").focus();
            exit();
        } else if (document.getElementById("cus_pwd").value === '') {
            alert("변경비밀번호를 입력해주세요.");
            document.getElementById("cus_pwd").focus();
            exit();
        }  else if (document.getElementById("new_pwd").value === '') {
            alert("변경비밀번호확인을 입력해주세요.");
            document.getElementById("new_pwd").focus();
            exit();
        }
        if (document.getElementById("cus_pwd").value === document.getElementById("old_pwd").value){
            alert("기존 비밀번호와 동일한 비밀번호로 변경할 수 없습니다.");
            document.getElementById("cus_pwd").focus();
            exit();
        }
        if (pwdtext.test(document.getElementById("cus_pwd").value) === false) {
            alert("비밀번호 형식이 올바르지 않습니다. 8자 이상의 영문자,숫자,특수문자 조합으로 이루어져야 합니다.");
            document.getElementById("cus_pwd").focus();
            exit();
        }
        if (document.getElementById("cus_pwd").value !== document.getElementById("new_pwd").value) {
            //비밀번호와 비밀번호 확인의 값이 다를경우
            alert("변경비밀번호와 비밀번호확인이 일치하지 않습니다.");
            document.getElementById("cus_pwd").focus();
            exit();
        }
        document.passwordform.submit();
    }

    var msg = "${msg}";
    if (msg === "fail") {
        alert("기존비밀번호가 일치하지 않습니다." +
            "비밀번호 확인 후 다시 시도해주세요.");
    } else if (msg === "update") {
        alert("비밀번호가 변경되었습니다.");
    }

</script>






















    <jsp:include page="../../include/footer.jsp" flush="true" />

    <jsp:include page="../../include/logoutModal.jsp" flush="true" />

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>

    <!-- Page level plugins -->
    <script src="<c:url value="/resources/vendor/datatables/jquery.dataTables.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.min.js"/>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value="/resources/js/demo/datatables-demo.js"/>"></script>
