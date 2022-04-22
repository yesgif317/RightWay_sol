<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../include/header.jsp" flush="true" />
<jsp:include page="../include/sidebar.jsp" flush="true" />

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column" >

    <!-- Main Content -->
    <div id="content">
        <jsp:include page="../include/topbar.jsp" flush="true" />
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
                                <form method="post" action="update.do" id="updateform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label fa-solid m-2">ID</label></div>
                                        <div class="col-12 col-md-7 text-gray-900 fa-solid m-2">${title} test</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label fa-solid m-2">이름</label></div>
                                        <div class="col-12 col-md-7 text-gray-900 fa-solid m-2">${title} 박현수</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label fa-solid m-2">이메일</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">
                                            <input type="email" id="email-input" name="email-input" placeholder="이메일주소를 입력해주세요." class="form-control" value="${writer}">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label fa-solid m-2">연락처</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">
                                            <input type="text" id="phone-input" name="phone-input" placeholder="연락처를 입력해주세요.( - 제외 숫자만 입력)" class="form-control" value="${writer}">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label fa-solid m-2">부서</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">
                                            <input type="text" id="dep-input" name="dep-input" placeholder="소속부서를 입력해주세요." class="form-control" value="${writer}">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label fa-solid m-2">직책</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">
                                            <input type="text" id="position-input" name="position-input" placeholder="직책을 입력해주세요." class="form-control" value="${writer}">
                                        </div>
                                    </div>




                                </form>
                            </div>
                            <div class="text-center d-block card-header py-3">
                                <a href="" class="btn btn-info btn-icon-split">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-pen"></i>
                                                </span>
                                    <span class="text">비밀번호변경</span>
                                </a>
                                <a href="index.do" class="btn btn-secondary btn-icon-split">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-list"></i>
                                                </span>
                                    <span class="text">메인</span>
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
























    <jsp:include page="../include/footer.jsp" flush="true" />

    <jsp:include page="../include/logoutModal.jsp" flush="true" />

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

    <!-- Page level plugins -->
    <script src="<c:url value="/resources/vendor/chart.js/Chart.min.js"/>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value="/resources/js/demo/chart-bar-demo.js"/>"></script>
    <script src="<c:url value="/resources/js/demo/chart-pie-demo.js"/>"></script>
    <script src="<c:url value="/resources/js/demo/chart-pie-demo.js"/>"></script>