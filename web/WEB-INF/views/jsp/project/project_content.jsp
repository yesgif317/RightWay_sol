<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../../include/header.jsp" flush="true" />
<jsp:include page="../../include/sidebar.jsp" flush="true" />
<script>
    function delete_form () {
        document.getElementById('deleteform').submit();
    }
</script>
<form   method="post" action="/project_delete.do" id="deleteform">
    <input type="hidden" name="_method" value="delete" />
    <input style="border:0 solid whitesmoke;width:100%;" name="prj_num" type="hidden" value="${ProjectList1.prj_num}" \/>
</form>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column" >

    <!-- Main Content -->
    <div id="content">
        <jsp:include page="../../include/topbar.jsp" flush="true" />
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">

                    <!-- Collapsable Card Example -->
                    <div class="card shadow mb-4">
                        <!-- Card Header - Accordion -->
                        <a class="d-block card-header py-3"  style="text-align: center">
                            <h6 class="m-0 font-weight-bold text-primary">
                                프로젝트 상세
                            </h6>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <form autocomplete="off" method="post" role="form">
                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">프로젝트 명</small>
                                            <input style="border:0 solid whitesmoke;width:100%; width: 100%" type="text" value="${ProjectList1.prj_name}" readonly="readonly" disabled/>
                                        </div>

                                        <div class="col-4" >
                                            <small class="help-block form-text">PL</small>
                                            <input style="border:0 solid whitesmoke;width:100%; width:100%;" type="text" value="${ProjectList1.cus_name}/${ProjectList1.cus_position}" readonly="readonly" disabled/>

                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">프로젝트기간</small>
                                            <input style="border:0 solid whitesmoke;width:100%;" type="text" value="${ProjectList1.prj_start}~${ProjectList1.prj_end}" readonly="readonly" disabled/>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">등록일</small>
                                            <input style="border:0 solid whitesmoke;width:100%;" type="text" value="${ProjectList1.prj_reg}" readonly="readonly" disabled/>
                                        </div>

                                        <div class="col-4" >
                                            <small class="help-block form-text">수정일</small>
                                            <input style="border:0 solid whitesmoke;width:100%; width:100%;" type="text" value="${ProjectList1.prj_upd}" readonly="readonly" disabled/>

                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-2"></div>
                                        <div class="col-8" style="border-top:  2px solid #808080;border-bottom: 2px solid #808080;">
                                            <div class="row form-group">
                                                <div class="col col-md-1 text-right"><label class="form-control-label fa-solid m-2"></label></div>
                                                <div class="col-12 col-md-12 text-gray-900 m-2">
                                                    <!-- DataTales Example -->
                                                    <div class="card mb-4">
                                                        <div class="card-body">
                                                            <div class="table-responsive">
                                                                <table class="table table-bordered" id="dataTable">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>이름</th>
                                                                        <th>직책</th>
                                                                        <th>번호</th>
                                                                        <th>이메일</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <c:forEach items="${Project_detailList}" var="project_detail">
                                                                        <tr>
                                                                            <td>${project_detail.cus_name}</td>
                                                                            <td>${project_detail.cus_position}</td>
                                                                            <td>${project_detail.cus_phone}</td>
                                                                            <td>${project_detail.cus_email}</td>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- 수정/삭제/목록 버튼 -->
                        <div class="text-center d-block card-header py-3">
                            <c:if test="${login.cus_num eq ProjectList1.cus_num || login.cus_state eq 3}">
                            <a href="project_write.do?prj_num=${ProjectList1.prj_num}&update=1" class="btn btn-info">
                                              <span class="icon text-white-50">
                                              <i class="fas fa-pen"></i>
                                              </span>
                                <span class="text"> 수정 및 프로젝트원 추가</span>
                            </a>

                            <a  class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                                                 <span class="icon text-white-50">
                                                   <i class="fa-regular fa-trash-can"></i>
                                                 </span>
                                <span class="text" style="color:white">  삭제</span>
                            </a>

                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">프로젝트 삭제</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                프로젝트를 삭제 하시겠습니까?<br>
                                                <p class="text-danger">프로젝트의 모든 게시물이 함께 삭제되며 복구가 불가능합니다.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button onclick="return delete_form()" type="button" class="btn btn-danger">삭제하기</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <a href="project.do" class="btn btn-secondary">
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