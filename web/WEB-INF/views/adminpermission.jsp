<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/head.jsp" flush="true" />
<jsp:include page="include/sidebar.jsp" flush="true" />

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column" >

    <!-- Main Content -->
    <div id="content">
        <jsp:include page="include/header.jsp" flush="true" />
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">관리자승인</h1>
            <p class="mb-4">승인대기중인 회원을 승인처리 해주는 페이지 입니다.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="col-sm-10">
                        <div>
                            <a href="" class="btn btn-info btn-user" >일괄승인</a>
                            <a href="" class="btn btn-danger btn-user" >일괄반려</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable">
                            <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" name="selectall" onclick="selectAll(this)">
                                </th>
                                <th>ID</th>
                                <th>이름</th>
                                <th>회사</th>
                                <th>직급</th>
                                <th>가입일자</th>
                                <th class="text-center">승인</th>
                                <th class="text-center">반려</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${BoardList}" var="board">
                                <tr>
                                    <td>
                                        <input type="checkbox" name="checkbox" id="checkbox">
                                    </td>
                                    <td><a href ="move_update.do?id=${board.no}">${board.title}</a></td>
                                    <td>${board.writer}</td>
                                    <td>${board.writer}</td>
                                    <td>${board.writer}</td>
                                    <td>${board.refdate}</td>
                                    <td>
                                        <a href="" class="btn btn-info btn-user btn-block">
                                            승인
                                        </a>
                                    </td>
                                    <td>
                                        <a href="" class="btn btn-danger btn-user btn-block">
                                            반려
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
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





