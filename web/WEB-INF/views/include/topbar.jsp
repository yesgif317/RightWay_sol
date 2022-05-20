<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

    <%--    <div class="navbar-custom-menu">--%>
    <%--        <ul class="nav navbar-nav">--%>


    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars text-gray-600"></i>
    </button>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>

    <script>
        function pro_check(prj_name) {
            console.log("함수 실행후");
            var form = new FormData();
            form.append("prj_name", prj_name);
            $.ajax({
                url: "Select_project.do",
                type: "POST",
                data: form,
                processData: false,
                contentType: false,
                success: function () {
                    alert("프로젝트가 변경되었습니다.")
                    window.location.reload();
                },
                error: function (request) {
                    alert("code:" + request.status + "\n" + "message: 프로젝트를 다시 선택해주세요.");
                }
            });

        }
    </script>

    <!-- Topbar Search -->

    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
        <div class="d-sm-flex align-items-center justify-content-between mb-4"></div>
        <div class="dropdown no-arrow mb-4">

            <button class="btn btn-dark.disabled dropdown-toggle" type="button" id="dropdownMenuButton"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <c:choose>
                    <c:when test="${prj_list != null}">
                        <i class="fa-solid fa-align-justify" id="prj_name"> 프로젝트 : ${prj_list.prj_name}</i>
                    </c:when>
                    <c:otherwise>
                        <i class="fa-solid fa-align-justify" id="prj_name"> 프로젝트를 선택해주세요.</i>
                    </c:otherwise>
                </c:choose>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" id="pro.prj_name">
                    <c:choose>
                        <c:when test="${ProjectList != null}">
                            <c:forEach items="${ProjectList}" var="pro">
                                <a href="#" onclick="pro_check(this.id);" class="dropdown-item text-gray-600"
                                   id="${pro.prj_name}">${pro.prj_name}</a>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <a href="#" class="dropdown-item text-gray-600">해당하는 프로젝트가 없습니다.</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </button>
        </div>
    </form>


    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">
        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
        <li class="nav-item dropdown no-arrow d-sm-none">
            <button class="btn btn-dark.disabled dropdown-toggle" type="button" id="dropdownMenuButton1"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <c:choose>
                    <c:when test="${prj_list != null}">
                        <i class="fa-solid fa-align-justify" id="prj_name"> 프로젝트 : ${prj_list.prj_name}</i>
                    </c:when>
                    <c:otherwise>
                        <i class="fa-solid fa-align-justify" id="prj_name"> 프로젝트를 선택해주세요.</i>
                    </c:otherwise>
                </c:choose>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" id="pro.prj_name">
                    <c:choose>
                        <c:when test="${ProjectList != null}">
                            <c:forEach items="${ProjectList}" var="pro">
                                <a href="#" onclick="pro_check(this.id);" class="dropdown-item text-gray-600"
                                   id="${pro.prj_name}">${pro.prj_name}</a>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <a href="#" class="dropdown-item text-gray-600">해당하는 프로젝트가 없습니다.</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </button>
        </li>
    </ul>


    <ul class="navbar-nav ml-auto">
        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a href="#" class="nav-link dropdown-toggle" role="button"
               data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fa-solid fa-user text-gray-700"> ${login.com_name} / ${login.cus_dep}
                    / ${login.cus_position} / ${login.cus_name}</i>
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="userDropdown">
                <a class="dropdown-item" href="/mypage.do">
                    <i class="fa-solid fa-id-card fa-sm fa-fw mr-2 text-gray-400"></i>
                    마이페이지
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/logout.do" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    로그아웃
                </a>
            </div>
        </li>
    </ul>


    <%--    <c:if test="${empty login}">--%>

    <%--        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">--%>
    <%--            <div class="d-sm-flex align-items-center justify-content-between mb-4"></div>--%>
    <%--            <div class="dropdown no-arrow mb-4">--%>
    <%--                <button class="btn btn-dark.disabled dropdown-toggle" type="button"--%>
    <%--                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
    <%--                    <i class="fa-solid fa-align-justify"> 해당 프로젝트가 없습니다.</i>--%>
    <%--                </button>--%>
    <%--                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </form>--%>


    <%--        <!-- Topbar Navbar -->--%>
    <%--        <ul class="navbar-nav ml-auto">--%>
    <%--            <!-- Nav Item - Search Dropdown (Visible Only XS) -->--%>
    <%--            <li class="nav-item dropdown no-arrow d-sm-none">--%>
    <%--                <button class="btn btn-dark.disabled dropdown-toggle" type="button"--%>
    <%--                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
    <%--                    <i class="fa-solid fa-angles-down"></i>--%>
    <%--                </button>--%>
    <%--                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">--%>
    <%--                </div>--%>
    <%--                </a>--%>
    <%--            </li>--%>


    <%--            <li class="nav-item dropdown no-arrow">--%>
    <%--                <a href="/login.do" class="nav-link dropdown-toggle text-right" role="button"--%>
    <%--                   data-toggle="dropdown"--%>
    <%--                   aria-haspopup="true" aria-expanded="false">--%>
    <%--                    <span class="hidden-xs"> 회원가입 또는 로그인 </span>--%>
    <%--                </a>--%>
    <%--                <!-- Dropdown - User Information -->--%>
    <%--            </li>--%>
    <%--        </ul>--%>
    <%--    </c:if>--%>

    <%--    </ul>--%>
    <%--    </div>--%>
</nav>
<!-- End of Topbar -->