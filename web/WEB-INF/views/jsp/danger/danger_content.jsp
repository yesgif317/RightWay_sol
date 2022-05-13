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
            <div class="row">
                <div class="col-lg-12">

                    <!-- Collapsable Card Example -->
                    <div class="card shadow mb-4">
                        <!-- Card Header - Accordion -->
                        <a class="d-block card-header py-3"  style="text-align: center">
                            <h6 class="m-0 font-weight-bold text-primary"> ${RiskList.risk_tit}
                            </h6>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <form autocomplete="off" method="post" role="form">

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">위험번호</small>
                                            <input style="border:0 solid whitesmoke;width:100%" placeholder="-" type="text" value="${RiskList.post_num}" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">담당자</small>
                                            <input style="border:0 solid whitesmoke;width:100%" placeholder="-" type="text" value="${RiskList.mng_name}/${RiskList.mng_position}" readonly="readonly" disabled/>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">중요도</small>
                                            <c:choose>
                                                <c:when test="${RiskList.risk_imp eq 'High'}">
                                                    <div class="col-4 bg-danger text-gray-100 text-center">${RiskList.risk_imp}</div>
                                                </c:when>
                                                <c:when test="${RiskList.risk_imp eq 'Medium'}">
                                                    <div class="col-4 bg-warning text-gray-100 text-center">${RiskList.risk_imp}</div>
                                                </c:when>
                                                <c:when test="${RiskList.risk_imp eq 'Low'}">
                                                    <div class="col-4 bg-success text-gray-100 text-center">${RiskList.risk_imp}</div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">진행상태</small>
                                            <c:choose>
                                                <c:when test="${RiskList.risk_pgs eq '대기'}">
                                                    <div class="col-3 bg-secondary text-gray-100 text-center">${RiskList.risk_pgs}</div>
                                                </c:when>
                                                <c:when test="${RiskList.risk_pgs eq '진행 중'}">
                                                    <div class="col-3 bg-warning text-gray-100 text-center">${RiskList.risk_pgs}</div>
                                                </c:when>
                                                <c:when test="${RiskList.risk_pgs eq '종료'}">
                                                    <div class="col-3 bg-success text-gray-100 text-center">${RiskList.risk_pgs}</div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">위험 발생일</small>
                                            <input style="border:0 solid whitesmoke;width:100%" placeholder="-" type="text" value="${RiskList.risk_start}" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">위험 해결일</small>
                                            <input style="border:0 solid whitesmoke;width:100%" placeholder="-" type="text" value="${RiskList.risk_end}" readonly="readonly" disabled/>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">보고자</small>
                                            <input style="border:0 solid whitesmoke;width:100%" placeholder="-" type="text" id="danger_ID" name="danger_ID" value="${RiskList.cus_name}/${RiskList.cus_position}" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">등록일</small>
                                            <input style="border:0 solid whitesmoke;width:100%" placeholder="-" type="text" value="${RiskList.risk_reg}" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">수정일</small>
                                            <input style="border:0 solid whitesmoke;width:100%;" placeholder="-" value="${RiskList.risk_upd}" readonly="readonly" disabled/>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-2"></div>
                                        <div class="col-8" style="border-top:  2px solid #808080;border-bottom: 2px solid #808080;">
                                            <textarea style="border:0 solid whitesmoke;width:100%;" name="contents" id="contents" rows="15" class="form-control mt-3 mb-3" readonly="readonly" disabled>${RiskList.risk_con}</textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- 수정/삭제/목록 버튼 -->
                        <div class="text-center d-block card-header py-3">
                            <a href="danger_write.do?post_num=${RiskList.post_num}&update=1" class="btn btn-info">
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
                                                <button onclick = "location.href ='danger_delete.do?post_num=${RiskList.post_num}'" type="button" class="btn btn-danger">삭제하기</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="danger.do" class="btn btn-secondary">
                                             <span class="icon text-white-50">
                                              <i class="fas fa-list"></i>
                                             </span>
                                <span class="text">목록</span>
                            </a>
                        </div>  <!-- end of button list -->

                        <jsp:include page="../../include/comments.jsp" flush="true" />

                    </div>

                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <jsp:include page="../../include/footer.jsp" flush="true" />

    </div>
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

<script type="text/javascript">
    function goSubmit() {
        var form = document.getElementById('tableswriteform').submit();
    }
</script>