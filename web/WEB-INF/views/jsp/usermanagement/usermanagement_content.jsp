<%--
  Created by IntelliJ IDEA.
  User: hate5
  Date: 2020-09-06
  Time: 오후 9:25
  To change this template use File | Settings | File Templates.
--%>

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
            <h1 class="h4 mb-2 text-gray-800 ">정기보고서</h1>
            <p class="mb-4">
                사업내용 등을 기재한 사업•반기•분기보고서
            </p>


            <div class="row">
                <div class="col-lg-12">

                    <!-- Collapsable Card Example -->
                    <div class="card shadow mb-4">
                        <!-- Card Header - Accordion -->
                        <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                            <h6 class="m-0 font-weight-bold text-primary">이슈 조회</h6>

                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <form autocomplete="off" method="post" role="form">
                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">작성자</small>
                                            <input style="border:0 solid whitesmoke;" type="text" id="writer" name="writer" value="${BoardList.writer}" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">작성일</small>
                                            <input style="border:0 solid whitesmoke;"  id="date" name="date" value="${BoardList.refdate}" readonly="readonly" disabled/>

                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-2"></div>
                                        <div class="col-8" style="border-top:  2px solid #808080;border-bottom: 2px solid #808080;">
                                            <textarea style="border:0 solid whitesmoke;" name="contents" id="contents" rows="5" class="form-control mt-3 mb-3" readonly="readonly" disabled>${BoardList.contents}</textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- 수정/삭제/목록 버튼 -->
                        <div class="text-center d-block card-header py-3">
                            <a href="outputs_update.do?no=${BoardList.no}" class="btn btn-info">
                                              <span class="icon text-white-50">
                                              <i class="fas fa-pen"></i>
                                              </span>
                                <span class="text"> 수정</span>
                            </a>

                            <a  class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                                                 <span class="icon text-white-50">
                                                   <i class="fa-regular fa-trash-can"></i>
                                                 </span>
                                <span class="text" style="color:white">  삭제</span>

                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                게시물을 정말 삭제하시겠습니까?
                                            </div>
                                            <div class="modal-footer">
                                                <button href="outputs_delete.do?no=${BoardList.no}" type="button" class="btn btn-primary">삭제하기</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="http://localhost:8089/outputs.do" class="btn btn-secondary">
                                             <span class="icon text-white-50">
                                              <i class="fas fa-list"></i>
                                             </span>
                                <span class="text">목록</span>
                            </a>
                        </div>  <!-- end of button list -->
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

<!-- Core plugin JavaScript-->
<script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>

<script src="<c:url value="/resources/vendor/datatables/dataTable.js"/>"></script>
<!-- Page level plugins -->
<script src="<c:url value="/resources/vendor/chart.js/Chart.min.js"/>"></script>

<!-- Page level custom scripts -->
<script src="<c:url value="/resources/js/demo/chart-bar-demo.js"/>"></script>
<script src="<c:url value="/resources/js/demo/chart-pie-demo.js"/>"></script>
<script type="text/javascript">
    function goSubmit() {
        var form = document.getElementById('tableswriteform').submit();
    }
</script>

</body>

</html>
