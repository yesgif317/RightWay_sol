<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../../include/header.jsp" flush="true" />
<jsp:include page="../../include/sidebar.jsp" flush="true" />

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column" >
    <jsp:include page="../../include/topbar.jsp" flush="true" />
    <!-- Main Content -->
    <div id="content">
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">

                    <!-- Collapsable Card Example -->
                    <div class="card shadow mb-4">
                        <!-- Card Header - Accordion -->
                        <a class="d-block card-header py-3">
                            <%
                                int test = Integer.parseInt(request.getParameter("update")) ;
                                pageContext.setAttribute("test", test) ;
                            %>
                            <c:choose>
                                <c:when test="${test eq '1'}">
                                    <h6 class="m-0 font-weight-bold text-primary text-center">행사 수정</h6>
                                </c:when>
                                <c:otherwise>
                                    <h6 class="m-0 font-weight-bold text-primary text-center">행사 등록</h6>
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">

                                <c:choose>
                                <c:when test="${test eq '1'}">
                                <form method="post" action="event_update.do?post_num=${EventList.post_num}" id="eventupdateform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                    </c:when>
                                    <c:otherwise>
                                    <form method="post" action="event_insert.do" id="event_write_form" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                        </c:otherwise>
                                        </c:choose>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="evt_tit" class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>행사명</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="evt_tit" name="evt_tit" placeholder="행사명을 입력해주세요." class="form-control" value="${EventList.evt_tit}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="evt_sbj" class=" form-control-label fa-solid text-gray-800 mt-2">행사목적</label></div>
                                            <div class="col-12 col-md-7"><input type="email" id="evt_sbj" name="evt_sbj" placeholder="행사목적을 입력해주세요." class="form-control" value="${EventList.evt_sbj}"></div>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="evt_start" class=" form-control-label fa-solid text-gray-800 mt-2">행사기간</label></div>
                                            <div class="col-12 col-md-2"><input type="date" name="evt_start" id="evt_start" class="form-control" value="${EventList.evt_start}"></div>
                                            <div class="text-center fa-solid text-gray-800 mt-2">~</div>
                                            <div class="col-12 col-md-2"><input type="date" name="evt_end" id="evt_end" class="form-control" value="${EventList.evt_end}"></div>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="evt_host" class=" form-control-label fa-solid text-gray-800 mt-2">행사주최</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="evt_host" name="evt_host" placeholder="행사주최를 입력해주세요." class="form-control" value="${EventList.evt_host}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="evt_supervise" class=" form-control-label fa-solid text-gray-800 mt-2">행사주관</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="evt_supervise" name="evt_supervise" placeholder="행사주관을 입력해주세요." class="form-control" value="${EventList.evt_supervise}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="evt_loc" class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>행사장소</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="evt_loc" name="evt_loc" placeholder="행사장소를 입력해주세요." class="form-control" value="${EventList.evt_loc}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="evt_url" class=" form-control-label fa-solid text-gray-800 mt-2">URL</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="evt_url" name="evt_url" placeholder="참고URL을 입력해주세요." class="form-control" value="${EventList.evt_url}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="evt_cnt" class=" form-control-label fa-solid text-gray-800 mt-2">행사내용</label></div>
                                            <div class="col-12 col-md-7"><textarea name="evt_cnt" id="evt_cnt" rows="5" placeholder="행사내용을 입력해주세요." class="form-control">${EventList.evt_cnt}</textarea></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="evt_pri" class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>참가비용</label></div>
                                            <div class="col-12 col-md-7"><input type="number" id="evt_pri" name="evt_pri" placeholder="참가비용을 입력해주세요." class="form-control" value="${EventList.evt_pri}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="evt_limit" class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>정원</label></div>
                                            <div class="col-12 col-md-7"><input type="number" id="evt_limit" name="evt_limit" placeholder="정원을 입력해주세요." class="form-control" value="${EventList.evt_limit}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="evt_acptstart" class=" form-control-label fa-solid text-gray-800 mt-2">접수기간</label></div>
                                            <div class="col-12 col-md-2"><input type="date" name="evt_acptstart" id="evt_acptstart" class="form-control" value="${EventList.evt_acptstart}"></div>
                                            <div class="text-center fa-solid text-gray-800 mt-2">~</div>
                                            <div class="col-12 col-md-2"><input type="date" name="evt_acptend" id="evt_acptend" class="form-control" value="${EventList.evt_acptend}"></div>
                                        </div>
                                        <input type="hidden" value="${prj_list.prj_num}" name="prj_num">
                                        <input type="hidden" name="cus_num" value="${login.cus_num}">
                                    </form>
                            </div>
                            <div class="text-center d-block card-header py-3">
                                <%--<button type="submit" style="border:none;">--%>
                                <a <%--href="javascript:goSubmit();"--%>  onclick="return chk_form()" class="btn btn-info">
                                                <span class="icon text-white-50">
                                                       <i class="fas fa-pen"></i>
                                                </span>
                                    <c:choose>
                                        <c:when test="${test eq '1'}">
                                            <span OnClick="location.href='javascript:goSubmit();'" class="text" style="color:white">수정</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span OnClick="location.href='javascript:goSubmit();'" class="text" style="color:white">등록</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <script>
                                        function chk_form() {
                                            if( document.getElementById("evt_tit").value===''){
                                                $('#exampleModal').modal('show')
                                            }
                                            else {
                                                <c:choose>
                                                <c:when test="${test eq '1'}">
                                                document.getElementById('eventupdateform').submit();
                                                </c:when>
                                                <c:otherwise>
                                                document.getElementById('event_write_form').submit();
                                                </c:otherwise>
                                                </c:choose>
                                            }
                                        }
                                    </script>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">작성글 확인</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    필수값 데이터가 작성되지 않았습니다.
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </a>
                                <%--</button>--%>
                                <a href="event.do" class="btn btn-secondary">
                                                <span class="icon text-white-50">
                                                       <i class="fas fa-list"></i>
                                                </span>
                                    <span class="text">취소</span>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>
        <!-- /.container-fluid -->

    </div>
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