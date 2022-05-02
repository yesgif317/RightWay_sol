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

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">업체관리</h1>
            <p class="mb-4">프로젝트에 참여하는 업체를 관리하는 페이지입니다.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">업체 목록</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable">
                            <thead>
                            <tr>
                                <th>NO</th>
                                <th>업체명</th>
                                <th>전화번호</th>
                                <th>업체주소</th>
                                <th>주요사업</th>
                                <th>가입된 사원수</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${CompanyList}" var="com">
                                <tr>
                                    <td>${com.com_num}</td>
                                    <td><a href ="company_content.do?com_num=${com.com_num}">${com.com_name}</a></td>
                                    <td>${com.com_tel}</td>
                                    <td>${com.com_addr}</td>
                                    <td>${com.com_business}</td>
                                    <td>일단보류</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="text-center d-block card-header py-3">
                    <a href="/company_write.do?com_num=0&update=0" class="btn btn-info">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                        <span class="text">업체등록</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Main Content -->
























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

    <!-- Page level plugins -->
    <script src="<c:url value="/resources/vendor/chart.js/Chart.min.js"/>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value="/resources/js/demo/chart-bar-demo.js"/>"></script>
    <script src="<c:url value="/resources/js/demo/chart-pie-demo.js"/>"></script>