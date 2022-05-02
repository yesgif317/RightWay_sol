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
                                            <input style="border:0 solid whitesmoke;" type="text" id="writer" name="writer" value="${BoardList.writer}행사명" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">접수기간</small>
                                            <input style="border:0 solid whitesmoke; width:203px;" id="event_eccept" name="event_eccept" value="${BoardList.refdate}2022-04-20 ~ 2022-04-25" readonly="readonly" disabled/>

                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">행사목적</small>
                                            <input style="border:0 solid whitesmoke;" type="text" id="event_purpose" name="event_purpose" value="${BoardList.writer}-" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">행사기간</small>
                                            <input style="border:0 solid whitesmoke; width:203px;"  id="event_date" name="event_date" value="${BoardList.refdate}2022-04-26 ~ 2022-04-30" readonly="readonly" disabled/>

                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">행사주관</small>
                                            <input style="border:0 solid whitesmoke;" type="text" id="event_admin" name="event_admin" value="${BoardList.writer}-" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">행사장소</small>
                                            <input style="border:0 solid whitesmoke;"  id="event_location" name="event_location" value="${BoardList.refdate}4층 1회의실" readonly="readonly" disabled/>

                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">정원</small>
                                            <input style="border:0 solid whitesmoke;" type="text" id="event_limit" name="event_limit" value="${BoardList.writer}5명" readonly="readonly" disabled/>
                                        </div>
                                        <div class="col-4" >
                                            <small class="help-block form-text">참가비용</small>
                                            <input style="border:0 solid whitesmoke;"  id="event_price" name="event_price" value="${BoardList.refdate}10000원" readonly="readonly" disabled/>

                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">행사URL</small>
                                            <a href="javascript:thisWin(this);" id="event_link">www.sample.com</a>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-2"></div>
                                        <div class="col-8" style="border-top:  2px solid #808080;border-bottom: 2px solid #808080;">
                                            <textarea style="border:0 solid whitesmoke;" name="event_contents" id="event_contents" rows="5" class="form-control mt-3 mb-3" readonly="readonly" disabled
                                            >${BoardList.contents}코로나19 확산으로 음식 배달이나 택배 배송 수요가 급증하면서 배달업 종사자 수가 역대 최고치를 기록했다. 19일 통계청이 발표한 '2021년 하반기 지역별 고용조사-취업자의 산업 및 직업별 특성' 보고서에 따르면 지난해 10월 배달원 수는 42만8000명으로 1년 전보다 9.7% 증가했다. 이는 지난 2013년 관련 통계 이래 역대 최다 수치다. 배달원 수는 지난 2019년 10월 기준 34만9000명으로 2020년(39만명)보다 11.8% 급증한 바 있다.
                                            </textarea>
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

    <!-- Page level plugins -->
    <script src="<c:url value="/resources/vendor/chart.js/Chart.min.js"/>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value="/resources/js/demo/chart-bar-demo.js"/>"></script>
    <script src="<c:url value="/resources/js/demo/chart-pie-demo.js"/>"></script>