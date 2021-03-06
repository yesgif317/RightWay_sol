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
            <h1 class="h3 mb-2 text-gray-800">팀관리</h1>
            <p class="mb-4">팀별 정보를 관리하는 페이지입니다.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="col-auto text-left">
                        <h6 class="m-0 font-weight-bold text-primary">팀 목록</h6>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="dataTable">
                            <thead>
                            <tr>
                                <th width="10%">NO</th>
                                <th width="15%">팀명</th>
                                <th width="50%"> 팀설명</th>
                                <th width="15%">팀장</th>
                                <th>인원수</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${TeamList}" var="team" varStatus="status" >
                                <tr onClick="location.href='team_content.do?team_num=${team.team_num}'"
                                    onmouseover="this.style.fontWeight='bold';this.style.color='black'"  onmouseout=" this.style.fontWeight='';this.style.color='#858796'">
                                            <td>${status.count}</td>
                                            <td>${team.team_name}</td>
                                            <td>${team.team_desc}</td>
                                            <td>${team.cus_name}</td>
                                            <td>
                                                <c:set var="count" value="1" />

                                <c:forEach items="${TeammemberList}" var="teammember"  >
                                    <c:choose>
                                        <c:when test="${team.team_num eq teammember.team_num}" >
                                            <c:set var="count" value="${teammember.cus_num}" />
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                                <c:out value="${count}" />
                                            </td>
                                        </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="text-center d-block card-header py-3">
                    <a href="/team_write.do?update=0&team_num=0" class="btn btn-info">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                        <span class="text">팀등록</span>
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