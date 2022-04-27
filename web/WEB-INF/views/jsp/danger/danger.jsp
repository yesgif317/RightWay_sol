<%--
  Created by IntelliJ IDEA.
  User: hate5
  Date: 2020-09-06
  Time: 오후 5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../../include/header.jsp" flush="true" />
<jsp:include page="../../include/sidebar.jsp" flush="true" />

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column" >

    <!-- Main Content -->
    <div id="content">

        <jsp:include page="../../include/topbar.jsp" flush="true" />
        <!-- Begin Page Content -->
        <div class="container-fluid">


                <%--<div class="col-11 col-md-8" style="float:right">
                    <h6 > 리스크를 처리하고 잠재적인 결과를 파악합니다.
                        <br>
                        위험요소를 식별하고 평가합니다.
                        <br>
                        법적 책임, 자연 재해, 사고, 관리 오류, 사이버 보안 위협 등 다양한 분야에서 발생할 수 있습니다.
                    </h6>
                </div>--%>
            <!-- Page Heading -->
                    <h1 class="h4 mb-2 text-gray-800 ">위험관리</h1>
                    <p class="mb-4">
                        위험요소를 식별하고 평가합니다.
                    </p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">위험 목록</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table <%--table-borderless--%> table-sm" id="dataTable" width="100%" height="500" cellspacing="0">

                            <thead>
                            <tr >
                                <th>번호</th>
                                <th width="30%">위험</th>
                                <th>담당자</th>
                                <th>프로젝트</th>
                                <th>위험등급</th>
                                <th>진행상황</th>
                                <th width="10%">발생일자</th>
                                <th width="10%">마감기한</th>
                                <th>남은날짜</th>
                                <th>진행률</th>
                                <th>위험ID</th>
                            </tr>
                            </thead>
                            <tfoot>
                            </tfoot>
                            <tbody>
                            <c:forEach items="${BoardList}" var="board">
                                <tr>
                                    <td>${board.no}</td>
                                    <td><a href ="danger_content.do?no=${board.no}">${board.title}</a></td>
                                    <td>${board.writer}</td>
                                    <td>${board.writer}</td>
                                    <td>${board.writer}</td>
                                    <td>${board.writer}</td>
                                    <td><fmt:formatDate value="${board.refdate}" pattern="yyyy-MM-dd" /></td>
                                    <td><fmt:formatDate value="${board.refdate}" pattern="yyyy-MM-dd" /></td>
                                    <td>16일</td>
                                    <td>55%</td>
                                    <td>${board.count}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div style="text-align: center">
                            <a href="/danger_write.do" class="btn btn-primary btn-icon-split">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                <span class="text">글 작성</span>
                            </a>


                        </div>
                    </div>
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
</body>

</html>
