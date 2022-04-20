<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-04-15
  Time: 오후 2:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/head.jsp" flush="true" />
<jsp:include page="include/sidebar.jsp" flush="true" />

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="DataTable Example">
    <meta name="author" content="JeongU">
    <title>관리자승인</title>

</head>

<body id="page-top">
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column" >

    <!-- Main Content -->
    <div id="content">
        <jsp:include page="include/header.jsp" flush="true" />
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">관리자승인</h1>
            <p class="mb-4">가입신청 승인페이지 입니다.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-dark">승인대기중인 회원</h6>

                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable">
                            <thead>
                            <tr>
                                <th>NO</th>
                                <th>ID</th>
                                <th>이름</th>
                                <th>회사</th>
                                <th>직급</th>
                                <th>가입일자</th>
                                <th>
                                    <div class="custom-control custom-checkbox small">
                                        <input type="checkbox" class="custom-control-input" name="selectall" id="selectall" onclick="selectAll(this)">
                                        <label class="custom-control-label" for="selectall"></label>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${board.no != null}">
                                <c:forEach items="${BoardList}" var="board">
                                    <tr>
                                        <td>${board.no}</td>
                                        <td><a href ="move_update.do?id=${board.no}">${board.title}</a></td>
                                        <td>${board.writer}</td>
                                        <td>${board.refdate}</td>
                                        <td>${board.refdate}</td>
                                        <td>${board.refdate}</td>
                                        <td><div class="custom-control custom-checkbox small">
                                            <input type="checkbox" class="custom-control-input" name="checkbox" id="checkbox">
                                            <label class="custom-control-label" for="checkbox"></label>
                                        </div></td>
                                    </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="7" align="center">데이터가 없습니다.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
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

</div>
<!-- Page level custom scripts -->
<script src="<c:url value="/resources/js/demo/datatables-demo.js"/>"></script>

</body>

</html>

<jsp:include page="include/logoutModal.jsp" flush="true" />


