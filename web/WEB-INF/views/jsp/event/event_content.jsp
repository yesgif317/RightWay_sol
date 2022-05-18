<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                        <a class="d-block card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary text-center">행사상세</h6>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <form autocomplete="off" method="post" role="form">

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">행사명</small>
                                            <input style="border:0 solid whitesmoke;width:100%" type="text"  name="writer" value="${EventList.evt_tit}" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">행사목적</small>
                                            <input style="border:0 solid whitesmoke;width:100%" type="text"  name="event_purpose" value="${EventList.evt_sbj}" readonly="readonly" disabled/>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">행사기간</small>
                                            <input style="border:0 solid whitesmoke;width:100%" type="text" value="${EventList.evt_start}~${EventList.evt_end}" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">행사장소</small>
                                            <input style="border:0 solid whitesmoke;width:100%"  name="event_location" value="${EventList.evt_loc}" readonly="readonly" disabled/>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">행사주관</small>
                                            <input style="border:0 solid whitesmoke;width:100%" type="text" id="event_admin" name="event_admin" value="${EventList.evt_host}" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">행사주최</small>
                                            <input style="border:0 solid whitesmoke;width:100%"  id="event_location" name="event_location" value="${EventList.evt_supervise}" readonly="readonly" disabled/>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">참가비용</small>
                                            <input style="border:0 solid whitesmoke;width:100%"  id="event_price" name="event_price" value="${EventList.evt_pri}원" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">정원</small>
                                            <input style="border:0 solid whitesmoke;width:100%" type="text" id="event_limit" name="event_limit" value="${EventList.evt_limit}명" readonly="readonly" disabled/>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">접수기간</small>
                                            <input style="border:0 solid whitesmoke;width:100%" type="text"  name="event_purpose" value="${EventList.evt_acptstart}~${EventList.evt_acptend}" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">참고URL</small>
                                            <a href="${EventList.evt_url}" id="event_link">${EventList.evt_url}</a>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">등록일</small>
                                            <input style="border:0 solid whitesmoke;width:100%" type="text"  value="${EventList.evt_reg}" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">수정일</small>
                                            <input style="border:0 solid whitesmoke;width:100%;"  value="${EventList.evt_upd}" readonly="readonly" disabled/>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">작성자</small>
                                            <input style="border:0 solid whitesmoke;width:100%" type="text" name="event_limit" value="${EventList.cus_num}" readonly="readonly" disabled/>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-2"></div>
                                        <div class="col-8" style="border-top:  2px solid #808080;border-bottom: 2px solid #808080;">
                                            <textarea style="border:0 solid whitesmoke;width:100%" name="event_contents" id="event_contents" rows="5" class="form-control mt-3 mb-3" readonly="readonly" disabled>${EventList.evt_cnt}
                                            </textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- 수정/삭제/목록 버튼 -->
                        <div class="text-center d-block card-header py-3">
                            <c:if test="${login.cus_num eq EventList.cus_num}">
                            <a href="event_write.do?post_num=${EventList.post_num}&update=1" class="btn btn-info">
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
                                                <button onclick = "location.href = 'event_delete.do?post_num=${EventList.post_num}'" type="button" class="btn btn-danger">삭제하기</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            </c:if>
                            <a href="event.do" class="btn btn-secondary">
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
