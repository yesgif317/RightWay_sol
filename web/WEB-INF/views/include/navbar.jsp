<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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

        <li class="nav-item">
            <!--<a class="nav-link" href="/blank.do" data-toggle="modal" data-target="#logoutModal">-->
            <a class="nav-link" href="/blank.do">
                <i class="fa-solid fa-sign-out-alt"></i>
                <span>blank</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->


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