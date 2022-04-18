<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/header.jsp" flush="true" />
<jsp:include page="include/sidebar.jsp" flush="true" />

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column" >

        <!-- Main Content -->
        <div id="content">
            <jsp:include page="include/topbar.jsp" flush="true" />
            <!-- Begin Page Content -->
            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">

                        <!-- Collapsable Card Example -->
                        <div class="card shadow mb-4">
                            <!-- Card Header - Accordion -->
                            <a class="d-block card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">행사 등록</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="collapseCardExample">
                                <div class="card-body">
                                    <form method="post" action="update.do" id="updateform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="title-input" class=" form-control-label"><sup>*</sup>행사명</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="title-input" name="text-input" placeholder="행사명을 입력해주세요." class="form-control" value="${title}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="purpose-input" class=" form-control-label">행사목적</label></div>
                                            <div class="col-12 col-md-7"><input type="email" id="purpose-input" name="purpose-input" placeholder="행사목적을 입력해주세요." class="form-control" value="${writer}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="date-input" class=" form-control-label"><sup>*</sup>행사기간</label></div>
                                            <div class="col-12 col-md-2"><input name="date-input" id="date-input" placeholder="행사시작일" class="form-control" disabled>${contents}</input></div>
                                            <div>달력</div>
                                            <div class="col-12 col-md-1 text-center">~</div>
                                            <div class="col-12 col-md-2"><input name="date-input2" id="date-input2" placeholder="행사종료일" class="form-control" disabled>${contents}</input></div>
                                            <div>달력</div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="host-input" class=" form-control-label">행사주최</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="host-input" name="host-input" placeholder="행사주최를 입력해주세요." class="form-control" value="${writer}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="supervise-input" class=" form-control-label">행사주관</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="supervise-input" name="supervise-input" placeholder="행사주관을 입력해주세요." class="form-control" value="${writer}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="location-input" class=" form-control-label"><sup>*</sup>행사장소</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="location-input" name="location-input" placeholder="행사장소를 입력해주세요." class="form-control" value="${writer}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="url-input" class=" form-control-label">URL</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="url-input" name="url-input" placeholder="참고URL을 입력해주세요." class="form-control" value="${writer}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="contents" class=" form-control-label">행사내용</label></div>
                                            <div class="col-12 col-md-7"><textarea name="contents" id="contents" rows="5" placeholder="행사내용을 입력해주세요." class="form-control"></textarea></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="price-input" class=" form-control-label"><sup>*</sup>참가비용</label></div>
                                            <div class="col-12 col-md-7"><input type="number" id="price-input" name="price-input" placeholder="참가비용을 입력해주세요." class="form-control" value="${writer}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="limit-input" class=" form-control-label"><sup>*</sup>정원</label></div>
                                            <div class="col-12 col-md-7"><input type="number" id="limit-input" name="limit-input" placeholder="정원을 입력해주세요." class="form-control" value="${writer}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="accceptdate-input" class=" form-control-label"><sup>*</sup>행사기간</label></div>
                                            <div class="col-12 col-md-2"><input name="accceptdate-input" id="accceptdate-input" placeholder="행사시작일" class="form-control" disabled>${contents}</input></div>
                                            <div>달력</div>
                                            <div class="col-12 col-md-1 text-center">~</div>
                                            <div class="col-12 col-md-2"><input name="accceptdate-input2" id="accceptdate-input2" placeholder="행사종료일" class="form-control" disabled>${contents}</input></div>
                                            <div>달력</div>
                                        </div>



                                        <div class="text-center">
                                            <a href="javascript:goUpdate();" class="btn btn-info btn-icon-split">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-pen"></i>
                                                </span>
                                                <span class="text">등록</span>
                                            </a>

<%--                                            <a href="#" class="btn btn-danger btn-icon-split">--%>
<%--                                                <span class="icon text-white-50">--%>
<%--                                                    <i class="fas fa-trash-alt"></i>--%>
<%--                                                </span>--%>
<%--                                                <span class="text">글삭제</span>--%>
<%--                                            </a>--%>

                                            <a href="/event.do" class="btn btn-secondary btn-icon-split">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-list"></i>
                                                </span>
                                                <span class="text">취소</span>
                                            </a>
                                        </div>
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
























<jsp:include page="include/footer.jsp" flush="true" />

<jsp:include page="include/logoutModal.jsp" flush="true" />

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