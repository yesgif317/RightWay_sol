<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:include page="../../include/header.jsp" flush="true" />
<jsp:include page="../../include/sidebar.jsp" flush="true" />
<script>
    $(document).ready( function() {
        $('dataTable').dataTable( {
            // 예시 1)
            "sDom": '<"top"i>rt<"bottom"><"clear">'


        } );
    } );
</script>

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
                        <a class="d-block card-header py-3">
                            <h5 class="m-0 font-weight-bold text-primary text-center">팀상세</h5>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <form autocomplete="off" method="post" role="form">
                                    <div class="row form-group">
                                        <div class="col-2"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">팀명</small>
                                            <input style="background-color:white;border:none" value="${TeamList.team_name}" type="text" id="team_name" name="team_name" class="form-control" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">프로젝트</small>
                                            <input style="background-color:white;border:none" value="${TeamList.prj_name}" type="text"  id="team_company" name="team_company" class="form-control" readonly="readonly" disabled/>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-2"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">팀장</small>
                                            <input style="background-color:white;border:none" value="${TeamList.cus_position} ${TeamList.cus_name}" type="text" id="cus_num" name="cus_num" class="form-control" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">팀장 이메일 </small>
                                            <input style="background-color:white;border:none" value="${TeamList.cus_email}" type="text"   name="team_company" class="form-control" readonly="readonly" disabled/>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-2"></div>
                                        <div class="col-5">
                                            <small class="help-block form-text">팀설명</small>
                                            <textarea class="form-control" style="border:0; background-color:white; width: 100%; border: none; resize: none;" readonly="readonly">${TeamList.team_desc}</textarea>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-2"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">팀원목록</small>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-2"></div>
                                        <div class="col-8" style="border-top:  2px solid #808080;border-bottom: 2px solid #808080;">
                                            <div class="row form-group">
                                                <div class="col col-md-1 text-right"><label class="form-control-label fa-solid m-2"></label></div>
                                                <div class="col-12 col-md-12 text-gray-900 fa-solid m-2">
                                                    <!-- DataTales Example -->
                                                    <div class="card mb-4">
                                                        <div class="card-body">
                                                            <div class="table-responsive">
                                                                <table class="table table-bordered" id="dataTable">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>이름</th>
                                                                        <th>직책</th>
                                                                        <th>연락처</th>
                                                                        <th>이메일</th>
                                                                        <th>부서</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <c:forEach items="${TeammemberList}" var="teammember"  >

                                                                    <c:forEach items="${CustomerList}" var="customer"  >
                                                                        <c:if test="${teammember.cus_num eq customer.cus_num}">
                                                                        <tr >
                                                                            <td >${customer.cus_name}</td>
                                                                            <td>${customer.cus_position}</td>
                                                                            <td>${customer.cus_phone}</td>
                                                                            <td>${customer.cus_email}</td>
                                                                            <td>${customer.cus_dep}</td>
                                                                        </tr>
                                                                        </c:if>
                                                                    </c:forEach>
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

                            <a href="team_write.do?team_num=${TeamList.team_num}&update=1" class="btn btn-info">
                                              <span class="icon text-white-50">
                                              <i class="fas fa-pen"></i>
                                              </span>
                                <span class="text"> 정보 수정 및 팀원 추가 </span>
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
                                                <h5 class="modal-title" id="exampleModalLabel">팀 해체</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                팀을 정말 해체하시겠습니까?
                                            </div>
                                            <div class="modal-footer">
                                                <button onclick = "location.href = 'team_delete.do?team_num=${TeamList.team_num}'" type="button" class="btn btn-danger">해체하기</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="team.do" class="btn btn-secondary">
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
    <%--<script src="<c:url value="/resources/js/demo/datatables-demo.js"/>"></script>--%>

    <!-- Page level plugins -->
    <script src="<c:url value="/resources/vendor/chart.js/Chart.min.js"/>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value="/resources/js/demo/chart-bar-demo.js"/>"></script>
    <script src="<c:url value="/resources/js/demo/chart-pie-demo.js"/>"></script>
    <script src="<c:url value="/resources/js/demo/chart-pie-demo.js"/>"></script>