<%--
  Created by IntelliJ IDEA.
  User: hate5
  Date: 2020-09-06
  Time: 오후 4:54
  To change this template use File | Settings | File Templates.
--%>
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
                <!-- Content Row -->

                <div class="row">
                    <!-- Earnings (Monthly) Card Example 1-->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-bottom-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">금일 휴가자 수</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">5명</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa-solid fa-bell text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Pending Requests Card Example 2-->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-bottom-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">프로젝트 D-day</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">D-20</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa-solid fa-calendar text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Earnings (Monthly) Card Example 3-->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-bottom-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">내게 할당된 진행중 이슈/위험</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">10건</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa-solid fa-bug text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Earnings (Monthly) Card Example4 -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-bottom-danger shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">긴급 이슈/위험</div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">1건</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa-solid fa-bolt-lightning text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Content Row -->

                <div class="row">
                    <!-- Bar Chart -->
                    <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-gray-700">주간 이슈/위험 등록 현황</h6>
                                <div class="dropdown no-arrow">

                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa-solid fa-caret-down text-gray-600"> 이슈</i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-header" href="#"><i class="fa-solid fa-bug text-gray-600">&nbsp이슈</i> </a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-header" href="#"><i class="fa-solid fa-explosion text-gray-600">&nbsp위험</i></a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-bar">
                                    <canvas id="myBarChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pie Chart -->
                    <div class="col-xl-4 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-gray-700">전체 이슈/위험</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa-solid fa-caret-down text-gray-600"> 이슈</i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-header" href="#"><i class="fa-solid fa-bug text-gray-600">&nbsp이슈</i> </a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-header" href="#"><i class="fa-solid fa-explosion text-gray-600">&nbsp위험</i></a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-pie pt-4 pb-2">
                                    <canvas id="myPieChart"></canvas>
                                </div>
                                <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-secondary"> 대기</i>
                    </span>
                                    <span class="mr-2">
                      <i class="fas fa-circle text-warning"> 처리 중</i>
                    </span>
                                    <span class="mr-2">
                      <i class="fas fa-circle text-success"> 완료</i>
                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Content Row -->
                <div class="row">

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-4 col-md-6 mb-4">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">최근 공지사항</div>
                        <div class="card border-left-primary">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-4 col-md-6 mb-4">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">내 게시물에 달린 댓글</div>
                        <div class="card border-left-success">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-4 col-md-6 mb-4">
                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">다가오는 일정</div>
                        <div class="card border-left-info">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">- </div>
                                    </div>
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
    </div>
    <!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->

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
