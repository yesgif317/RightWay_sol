<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/header.jsp" flush="true" />
<jsp:include page="include/sidebar.jsp" flush="true" />

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column" >

    <!-- Main Content -->
    <div id="content">
        <jsp:include page="include/topbar.jsp" flush="true" />
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">

                    <!-- Collapsable Card Example -->
                    <div class="card shadow mb-4">
                        <!-- Card Header - Accordion -->
                        <a class="d-block card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary text-center">업체상세</h6>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <form method="post" action="update.do" id="updateform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">회사명</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">${title} 회사명</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">전화번호</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">${title} 전화번호</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">주요업무</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">${title} 개발</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">회사규모</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">${title} 중소기업/중견기업/대기업/공기업</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">계약일</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">${title} 2022-04-20</div>
                                    </div>
                                    <div class="text-center">
                                        <a href="/company.do" class="btn btn-secondary btn-icon-split">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-list"></i>
                                                </span>
                                            <span class="text">목록</span>
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->
























    <jsp:include page="include/footer.jsp" flush="true" />

    <jsp:include page="include/logoutModal.jsp" flush="true" />

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