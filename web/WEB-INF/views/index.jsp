<%--
  Created by IntelliJ IDEA.
  User: hate5
  Date: 2020-09-06
  Time: 오후 4:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="DataTable Example">
    <meta name="author" content="RightWay">

    <title>ISFrame</title>
    <script src="https://kit.fontawesome.com/55082abfe9.js" crossorigin="anonymous"></script>
    <!-- Custom fonts for this template-->
    <link href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/index.do">
            <div class="sidebar-brand-icon rotate-n-0">
                <i class="fa-solid fa-computer"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Solideo</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Project
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-cog"></i>
                <span>프로젝트관리/보고</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header ">프로젝트관리/보고</h6>
                    <a class="collapse-item font-weight-bold text-gray-600" href="../buttons.html">산출물</a>
                    <a class="collapse-item font-weight-bold text-gray-600" href="../cards.html">회의록</a>
                    <a class="collapse-item font-weight-bold text-gray-600" href="../cards.html">정기보고</a>
                    <a class="collapse-item font-weight-bold text-gray-600" href="../cards.html">팀관리</a>
                    <a class="collapse-item font-weight-bold text-gray-600" href="../cards.html">행사관리</a>
                    <a class="collapse-item font-weight-bold text-gray-600" href="../cards.html">업체관리</a>
                    <a class="collapse-item font-weight-bold text-gray-600" href="../cards.html">관리자승인</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span>위험 및 이슈</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">위험 및 이슈</h6>
                    <a class="collapse-item font-weight-bold text-gray-600" href="../utilities-color.html">위험</a>
                    <a class="collapse-item font-weight-bold text-gray-600" href="../utilities-border.html">이슈</a>
                </div>
            </div>
        </li>
        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse3" aria-expanded="true" aria-controls="collapse3">
                <i class="fa-solid fa-person-circle-check"></i>
                <span>투입인력</span>
            </a>
            <div id="collapse3" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">투입인력</h6>
                    <a class="collapse-item font-weight-bold text-gray-600" href="../utilities-color.html">투입인력관리</a>
                    <a class="collapse-item font-weight-bold text-gray-600" href="../utilities-border.html">투입인력보고</a>
                </div>
            </div>
        </li>
        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Notice
        </div>

        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="/charts.html">
                <i class="fa-solid fa-bullhorn"></i>
                <span>공지사항</span></a>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="/tables.do">
                <i class="fa-solid fa-book"></i>
                <span>자료실</span></a>
        </li>
        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="/tables.do">
                <i class="fa-solid fa-check"></i>
                <span>요청사항</span></a>
        </li>
        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">
        <!-- Heading -->
        <div class="sidebar-heading">
            My
        </div>
        <!-- Nav Item - Mypage -->
        <li class="nav-item">
            <a class="nav-link" href="/tables.do">
                <i class="fa-solid fa-id-card"></i>
                <span>마이페이지</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-toggle="modal" data-target="#logoutModal">
                <i class="fa-solid fa-sign-out-alt"></i>
                <span>로그아웃</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column" >

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars text-gray-600"></i>
                </button>

                <!-- Topbar Search -->
                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4"></div>
                    <div class="dropdown no-arrow mb-4">
                        <button class="btn btn-dark.disabled dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa-solid fa-align-justify"> 프로젝트 선택</i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item text-gray-600" href="#" >프로젝트A</a>
                            <a class="dropdown-item text-gray-600" href="#">프로젝트B</a>
                            <a class="dropdown-item text-gray-600" href="#">프로젝트C</a>
                        </div>
                    </div>
                </form>


                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">
                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <button class="btn btn-dark.disabled dropdown-toggle" type="button" id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                            <i class="fa-solid fa-angles-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                            <a class="dropdown-item text-gray-600" href="#">프로젝트A</a>
                            <a class="dropdown-item text-gray-600" href="#">프로젝트B</a>
                            <a class="dropdown-item text-gray-600" href="#">프로젝트C</a>
                        </div>
                    </li>

                </ul>

                    <ul class="navbar-nav ml-auto">
                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa-solid fa-user text-gray-700"> 솔리데오/개발1팀/사원/박현수</i>
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fa-solid fa-id-card fa-sm fa-fw mr-2 text-gray-400"></i>
                                MyPage
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->


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

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">로그아웃 하시겠습니까?</div>
            <div class="modal-footer">
                <a class="btn btn-dark" href="/login.do">로그아웃</a>
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>

<!-- Page level plugins -->
<script src="<c:url value="/resources/vendor/chart.js/Chart.min.js"/>"></script>

<!-- Page level custom scripts -->
<script src="<c:url value="/resources/js/demo/chart-bar-demo.js"/>"></script>
<script src="<c:url value="/resources/js/demo/chart-pie-demo.js"/>"></script>

</body>

</html>
