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
            <h1 class="h3 mb-2 text-gray-800">프로젝트 관리</h1>
            <p class="mb-4">전체 프로젝트를 관리하는 페이지입니다.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="col-auto text-left">
                        <h6 class="m-0 font-weight-bold text-primary">프로젝트 목록</h6>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="dataTable">
                            <thead>
                            <tr>
                                <th>NO</th>
                                <th>프로젝트명</th>
                                <th>프로젝트리더</th>
                                <th>프로젝트기간</th>
                                <th>등록/수정일</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${ProjectList1}" var="project" varStatus="status">
                                <tr onClick="location.href='project_content.do?prj_num=${project.prj_num}'"
                                    onmouseover="this.style.fontSize='18 ';this.style.color='black'"  onmouseout="this.style.fontSize='16';this.style.color='#858796'">
                                    <td>${status.count}</td>
                                    <td>${project.prj_name}</td>
                                    <td>${project.cus_name}/${project.cus_position}</td>
                                    <td>${project.prj_start}~${project.prj_end}</td>
                                    <c:choose>
                                        <c:when test="${project.prj_upd eq null}">
                                            <td>등록일 : ${project.prj_reg}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>수정일 : ${project.prj_upd}</td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="text-center d-block card-header py-3">
                    <a href="/project_write.do?prj_num=0&update=0" class="btn btn-info">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                        <span class="text">프로젝트 등록</span>
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
