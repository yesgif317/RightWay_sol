<%--
  Created by IntelliJ IDEA.
  User: hate5
  Date: 2020-09-06
  Time: 오후 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">산출물</h1>
            <p class="mb-4"> 산출물이란 프로젝트나 프로그램의 가시적이고 측정 가능한 결과물을 말합니다.
                <br>
                산출물에는 설계 모델, 사양 문서, 원형 등이 있습니다.
                <br>
                이 페이지에서 산출물에 가입하고 산출물을 참조할 수 있습니다.
            </p>

            <div class="row">
                <div class="col-lg-12">

                    <!-- Collapsable Card Example -->
                    <div class="card shadow mb-4">
                        <!-- Card Header - Accordion -->
                        <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                            <h6 class="m-0 font-weight-bold text-primary">산출물 게시물 작성 중</h6>

                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <form method="post" action="outputs_move_write.do" id="tableswriteform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-2"><label for="title" class=" form-control-label">제목</label></div>
                                        <div class="col-12 col-md-7"><input type="text" id="title" name="title" placeholder="Text" class="form-control"><small class="form-text text-muted">This is a help text</small></div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col col-md-2"><label class=" form-control-label">작성자</label></div>
                                        <div class="col-12 col-md-7"><input type="text" id="writer" name="writer" placeholder="Text" class="form-control"><small class="help-block form-text">산출물에 대해 작성해주세요.</small></div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col col-md-2"><label for="contents" class=" form-control-label">내용 작성</label></div>
                                        <div class="col-12 col-md-7"> <textarea name="contents" id="contents" rows="9" placeholder="Content" class="form-control"></textarea></div>
                                    </div>
                                    <div style="text-align: center">
                                        <a <%--href="javascript:goSubmit();"--%> onclick="return chk_form()" class="btn btn-primary btn-icon-split">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                            <span class="text" style="color:white">  글쓰기</span>


                                            <script>
                                                function chk_form() {
                                                    if( document.getElementById("contents").value==''){
                                                        $('#exampleModal').modal('show')
                                                    }
                                                    else if ( document.getElementById("title").value=='' ) {
                                                        $('#exampleModal').modal('show')
                                                    }
                                                    else {
                                                        document.getElementById('outputswriteform').submit();
                                                    }
                                                }
                                            </script>



                                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel" align="center">작성글 확인</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            제목 또는 내용이 작성되지 않았습니다.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>




                                        </a>
                                        <a href="javascript:goSubmit();" class="btn btn-primary btn-icon-split">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                            <span class="text">  임시저장</span>

                                        </a>
                                        <a href="javascript:goSubmit();" class="btn btn-primary btn-icon-split">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                            <span class="text">  불러오기</span>

                                        </a>
                                    </div>
                                    <br>
                                    <br>
                                </form>
                            </div>
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
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<jsp:include page="../../include/logoutModal.jsp" flush="true" />
<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<script src="<c:url value="/resources/vendor/datatables/dataTable.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>

<script type="text/javascript">
    function goSubmit() {
        var form = document.getElementById('tableswriteform').submit();
    }
</script>

</body>