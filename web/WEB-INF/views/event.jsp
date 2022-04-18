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

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">행사관리</h1>
            <p class="mb-4">각종 행사 및 일정을 관리하는 페이지입니다.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="col-auto text-left">
                        <div class="">
                            <a href="event_write.do" class="btn btn-info btn-user">행사등록</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable">
                            <thead>
                            <tr>
                                <th>NO</th>
                                <th>행사명</th>
                                <th>행사장소</th>
                                <th>행사구분</th>
                                <th>행사일자</th>
                                <th>기간</th>
                                <th>참여/정원</th>
                                <th>접수시작일</th>
                                <th>접수종료일</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${BoardList}" var="board">
                                <tr>
                                    <td>${board.no}</td>
                                    <td><a href ="event_write.do?id=${board.no}">${board.title}</a></td>
                                    <td>${board.writer}</td>
                                    <td>${board.writer}</td>
                                    <td>${board.writer}</td>
                                    <td>${board.writer}</td>
                                    <td>${board.writer}</td>
                                    <td>${board.refdate}</td>
                                    <td>${board.refdate}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
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