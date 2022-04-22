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

            <!-- Page Heading -->
            <h1 class="display-4"<%--class="h3 mb-2 text-gray-800"--%>>이슈관리</h1>
            <p class="mb-4"> 이슈(Issue, 혹은 Problem)은 프로젝트 진행에 차질을 가져올 수 있는 “발생된(Realized)” 위험으로 정의합니다..
                <br>
                버그, 요구사항, 작업내용 등이 있을 때 해당 시스템에 게시물 형태로 올립니다.
                <br>
                이슈ID(착수/계획/분석/설계/구현및인도/완료/하자보수/전체공정) 이슈등급(A/B/C)
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
                                    <%-- <div class="row form-group" >
                                         <div class="col col-md-2">&lt;%&ndash;<label class=" form-control-label">글번호</label>&ndash;%&gt;</div>
                                         <div class="col-12 col-md-7" style="border-top: 4px groove #808080;;"><input style="border:0 ;outline:none;" type="text" id="no" name="no" value="${BoardList.no}" readonly="readonly"  />
                                             <small class="help-block form-text">글번호</small></div>
                                     </div>--%>
                                    <div class="row form-group" >
                                        <div class="col col-md-2"><%--<label  class=" form-control-label">이메일</label>--%></div>
                                        <div class="col-11 col-md-7" style="border-bottom: 2px dotted #808080;border-top: 4px groove #808080;">
                                            <input style="font-size:30px;border:0 solid whitesmoke;outline:none;" type="text" id="title" name="title" value="${BoardList.title}" readonly="readonly" />
                                            <small class="help-block form-text">제목</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-2"><%--<label  class=" form-control-label">이메일</label>--%></div>
                                        <div class="col-11 col-md-3">이메일 자동으로 입력(db연동)
                                            <small class="help-block form-text">이메일</small>
                                        </div>
                                        <div class="col-12 col-md-3"><input style="border:0 solid whitesmoke;" type="text" id="writer" name="writer" value="${BoardList.writer}" readonly="readonly" />
                                            <small class="help-block form-text">작성자</small></div>
                                    </div>
                                    <%--<div class="row form-group" >
                                        <div class="col col-md-2">&lt;%&ndash;<label class=" form-control-label">작성자</label>&ndash;%&gt;</div>
                                        <div class="col-12 col-md-7"><input style="border:0 solid whitesmoke;" type="text" id="writer" name="writer" value="${BoardList.writer}" readonly="readonly" />
                                            <small class="help-block form-text">작성자</small></div>
                                    </div>--%>

                                    <div class="row form-group">
                                        <div class="col col-md-2"><%--<label class=" form-control-label">참고사항</label>--%></div>
                                        <div class="col-12 col-md-3">고객사와 회의한 내용을 반영하여 수행함
                                            <small class="help-block form-text">참고</small></div>
                                        <div class="col-12 col-md-3">설계모델
                                            <small class="help-block form-text">이슈 구분</small></div>
                                    </div>
                                    <%--<div class="row form-group">
                                        <div class="col col-md-2">&lt;%&ndash;<label class=" form-control-label">산출물 구분</label>&ndash;%&gt;</div>
                                        <div class="col-12 col-md-7">설계모델
                                            <small class="help-block form-text">산출물 구분</small></div>
                                    </div>--%>
                                    <div class="row form-group">
                                        <div class="col col-md-2" ><%--<label class=" form-control-label">내용 작성</label>--%></div>
                                        <div class="col-12 col-md-7" style="border-top:  2px dotted #808080;border-bottom: 4px groove #808080;">
                                            <textarea style="font-size:20px;border:0 solid whitesmoke;" name="contents" id="contents" rows="4" placeholder="Content" class="form-control">${BoardList.contents}</textarea>
                                        </div>


                                        <%--<input type="text" id="contents" name="contents" value="${BoardList.contents}" readonly="readonly" />--%>

                                    </div>
                                </form>

                                <br>
                                <br>
                                <br>
                                <div style="text-align: center">
                                    <a  class="btn btn-primary btn-icon-split" data-toggle="modal" data-target="#exampleModal">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
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
                                    <a href="outputs_update.do?no=${BoardList.no}" class="btn btn-primary btn-icon-split">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                        <span class="text">  수정</span>

                                    </a>
                                    <a href="http://localhost:8089/outputs.do" class="btn btn-primary btn-icon-split">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                        <span class="text"

                                        >  목차보기</span>

                                    </a>
                                    <a href ="outputs_content.do?no=${BoardList.no}" class="btn btn-primary btn-icon-split">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                        <span class="text">  이전글</span>

                                    </a>
                                    <a href ="outputs_content.do?no=${BoardList.no}" class="btn btn-primary btn-icon-split">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                        <span class="text">  다음글</span>

                                    </a>
                                </div>
                                <br>
                                <br>
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
