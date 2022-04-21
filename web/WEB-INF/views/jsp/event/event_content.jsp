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
                            <h6 class="m-0 font-weight-bold text-primary text-center">행사상세</h6>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <form method="post" action="update.do" id="updateform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">행사명</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">${title} 행사명</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">행사목적</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">-${title}</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">행사기간</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">${title} 2022-04-26 ~ 2022-04-30</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">행사주관</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">${title} 사업부</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">행사장소</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">${title} 4층 1회의실</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">행사URL</label></div>
                                        <div class="col-12 col-md-7 text-gray-900"><a href=""> ${title} www.sample.com</a></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">행사내용</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">${title} 코로나19 확산으로 음식 배달이나 택배 배송 수요가 급증하면서 배달업 종사자 수가 역대 최고치를 기록했다.

                                            19일 통계청이 발표한 '2021년 하반기 지역별 고용조사-취업자의 산업 및 직업별 특성' 보고서에 따르면 지난해 10월 배달원 수는 42만8000명으로 1년 전보다 9.7% 증가했다. 이는 지난 2013년 관련 통계 이래 역대 최다 수치다.

                                            배달원 수는 지난 2019년 10월 기준 34만9000명으로 2020년(39만명)보다 11.8% 급증한 바 있다. </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">참가비용</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">${title}10000원</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">정원</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">${title}5명</div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class="form-control-label">접수기간</label></div>
                                        <div class="col-12 col-md-7 text-gray-900">${title} 2022-04-20 ~ 2022-04-25</div>
                                    </div>




                                    <div class="text-center">
                                        <a href="/event.do" class="btn btn-secondary btn-icon-split">
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