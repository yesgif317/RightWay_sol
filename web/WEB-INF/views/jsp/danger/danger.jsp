<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
            <h1 class="h4 mb-2 text-gray-800 ">위험관리</h1>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">위험 목록</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="dataTable">

                            <thead>
                            <tr >
                                <th>번호</th>
                                <th width="25%">제목</th>
                                <th>중요도</th>
                                <th>담당자</th>
                                <th>진행상태</th>
                                <th>보고자</th>
                                <th>시작/종료일</th>
                                <th>등록/수정일</th>
                            </tr>
                            </thead>
                            <tfoot>
                            </tfoot>
                            <tbody>
                            <c:forEach items="${RiskList}" var="risk">
                                    <tr onClick="location.href='danger_content.do?post_num=${risk.post_num}'"
                                    onmouseover="this.style.fontSize='18 ';this.style.color='black'"  onmouseout="this.style.fontSize='16';this.style.color='#858796'">
                                    <td>${risk.post_num}</td>
                                    <td>${risk.risk_tit}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${risk.risk_imp eq 'High'}">
                                                <div class="bg-danger text-gray-100 text-center">${risk.risk_imp}</div>
                                            </c:when>
                                            <c:when test="${risk.risk_imp eq 'Medium'}">
                                                <div class="bg-warning text-gray-100 text-center">${risk.risk_imp}</div>
                                            </c:when>
                                            <c:when test="${risk.risk_imp eq 'Low'}">
                                                <div class="bg-success text-gray-100 text-center">${risk.risk_imp}</div>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>${risk.mng_name}/${risk.mng_position}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${risk.risk_pgs eq '대기'}">
                                                <div class="bg-secondary text-gray-100 text-center">${risk.risk_pgs}</div>
                                            </c:when>
                                            <c:when test="${risk.risk_pgs eq '진행 중'}">
                                                <div class="bg-warning text-gray-100 text-center">${risk.risk_pgs}</div>
                                            </c:when>
                                            <c:when test="${risk.risk_pgs eq '종료'}">
                                                <div class="bg-success text-gray-100 text-center">${risk.risk_pgs}</div>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>${risk.cus_name}/${risk.cus_position}</td>
                                    <td>${risk.risk_start} ~ ${risk.risk_end}</td>
                                    <td>${risk.risk_reg}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
                <div class="text-center d-block card-header py-3">
                    <a href="/danger_write.do?post_num=0&update=0" class="btn btn-info">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                        <span class="text">위험등록</span>
                    </a>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->


    </div>
    <!-- End of Main Content -->

    <jsp:include page="../../include/footer.jsp" flush="true" />

</div>
<!-- End of Page Wrapper -->




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
<script src="https://kit.fontawesome.com/55082abfe9.js" crossorigin="anonymous"></script>
