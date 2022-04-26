<%--
  Created by IntelliJ IDEA.
  User: hate5
  Date: 2020-09-06
  Time: 오후 5:22
  To change this template use File | Settings | File Templates.
--%>
<style media="screen">
    div.dt_title{
        color:green;
        float:left;
        font-size:20px;
    }
    div.dt_btn{
        padding:5px;
    }
</style>
<script type="text/javascript">

    var example_tbl = null
    $(function() {
        example_tbl = $('#dataTable').DataTable( {
            dom: '<"dt_title">fti<"dt_btn">'
        });

        $("div.dt_title").html('dom 커스텀 하기');
        $("div.dt_btn").html('<button id="btn1" class="btn btn-info pull-right">버튼1</button>');

        $('#btn1').click(function(){
            $('#example th, #example td').css("background-color",'#'+Math.random().toString(16).substr(-6))
        })
    });
</script>




<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<jsp:include page="../../include/header.jsp" flush="true" />
<jsp:include page="../../include/sidebar.jsp" flush="true" />

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column" >

    <!-- Main Content -->
    <div id="content">

            <jsp:include page="../../include/topbar.jsp" flush="true" />
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <%--<div class="box-container">
                <div class="col-2 " style="float:left">
                    <h1 >산출물</h1>
                </div>
                <div class="col-11 " >
                    <h6 > 산출물이란 프로젝트나 프로그램의 가시적이고 측정 가능한 결과물을 말합니다.
                        <br>
                        산출물에는 설계 모델, 사양 문서, 원형 등이 있습니다.
                        <br>
                        이 페이지에서 산출물에 가입하고 산출물을 참조할 수 있습니다.
                    </h6>
                </div>
                </div>--%>
                    <h1 class="h4 mb-2 text-gray-800 ">산출물</h1>
                    <p class="mb-4">
                        산출물이란 프로젝트나 프로그램의 가시적이고 측정 가능한 결과물을 말합니다.
                    </p>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">산출물 게시판 목록</h6>
                    </div>
                    <div class="card-body"  >
                        <div class="table-responsive" >

                            <table class="table table-bordered table-hover row-border" id="dataTable" width="90%" cellspacing="0" style="scroll: no;overflow: hidden;overflow-x: hidden;">
                                <thead>
                                <tr >
                                    <th width="10%">번호</th>
                                    <th width="50%">산출물</th>
                                    <th>작성자</th>
                                    <th>작성날짜</th>
                                    <th>조회수</th>
                                </tr>
                                </thead>
                                <tfoot>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${BoardList}" var="board">
                                    <tr>
                                        <td>${board.no}</td>
                                        <td><a href ="outputs_content.do?no=${board.no}">${board.title}</a></td>
                                        <td>${board.writer}</td>
                                        <td><fmt:formatDate value="${board.refdate}" pattern="yyyy-MM-dd" /></td>

                                        <td>${board.count}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div style="text-align: center">
                                <a href="/outputs_write.do" class="btn btn-primary btn-icon-split">
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
