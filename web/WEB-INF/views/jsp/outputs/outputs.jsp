<%--
  Created by IntelliJ IDEA.
  User: hate5
  Date: 2020-09-06
  Time: 오후 5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../../include/header.jsp" flush="true"/>
<jsp:include page="../../include/sidebar.jsp" flush="true"/>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
        <jsp:include page="../../include/topbar.jsp" flush="true"/>
        <!-- Begin Page Content -->
        <div class="container-fluid">
            <h1 class="h4 mb-2 text-gray-800 ">산출물</h1>
            <p class="mb-4">
                산출물이란 프로젝트나 프로그램의 가시적이고 측정 가능한 결과물을 말합니다.
            </p>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">산출물 게시판 목록</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover row-border" id="dataTable" width="100%"cellspacing="0">
                            <thead>
                            <tr>
                                <th width="10%">번호</th>
                                <th width="50%">산출물</th>
                                <th>작성자</th>
                                <th>작성날짜</th>
                                <th>프로젝트</th>
                            </tr>
                            </thead>
                            <tfoot>
                            </tfoot>
                            <tbody>
                            <c:forEach items="${PostList}" var="post">
                                <%--<c:if test="${post.cate eq 1}">--%>
                                <tr onClick="location.href='outputs_content.do?post_num=${post.post_num}'">
                                        <td>${post.post_num}</td>
                                        <td>${post.nor_tit}</td>
                                        <td>${post.cus_name}</td>
                                        <td><fmt:formatDate value="${post.nor_reg}" pattern="yyyy-MM-dd"/></td>
                                        <td>${post.prj_name}</td>
                                    </tr>
                                <%--</c:if>--%>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>

                </div>
                <div style="text-align: center" class="text-center d-block card-header py-3">
                    <a href="/outputs_write.do?update=0&post_num=0" class="btn btn-info">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                        <span class="text">글 작성</span>
                    </a>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- End of Main Content -->
    <jsp:include page="../../include/footer.jsp" flush="true"/>
</div>
<!-- End of Page Wrapper -->


<jsp:include page="../../include/logoutModal.jsp" flush="true"/>
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

