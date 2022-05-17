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
            <h1 class="h3 mb-2 text-gray-800">투입인력관리</h1>
            <p class="mb-4">프로젝트에 참여하는 인력정보를 관리하는 페이지입니다.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="dataTable">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>이름</th>
                                <th>직급</th>
                                <th>회사</th>
                                <th>이메일</th>
                                <th>연락처</th>
                                <th>승인여부</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${CustomerList}" var="cust">
                                <tr>
                                    <td><a href ="usermanagement_content.do?cus_num=${cust.cus_num}">${cust.cus_id}</a></td>
                                    <td><a href ="usermanagement_content.do?cus_num=${cust.cus_num}">${cust.cus_name}</a></td>
                                    <td>${cust.cus_position}</td>
                                    <td>${cust.com_name}</td>
                                    <td>${cust.cus_email}</td>
                                    <td>${cust.cus_phone}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${cust.cus_state eq '1'}">
                                                승인
                                            </c:when>
                                            <c:otherwise>
                                                미승인
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
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
