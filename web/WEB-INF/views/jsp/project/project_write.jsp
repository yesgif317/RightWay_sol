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
                            <%
                                int test = Integer.parseInt(request.getParameter("update")) ;
                                pageContext.setAttribute("test", test) ;
                            %>
                            <c:choose>
                                <c:when test="${test eq '1'}">
                                    <h6 class="m-0 font-weight-bold text-primary text-center">프로젝트 수정</h6>
                                </c:when>
                                <c:otherwise>
                                    <h6 class="m-0 font-weight-bold text-primary text-center">프로젝트 등록</h6>
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <c:choose>
                                <c:when test="${test eq '1'}">
                                <form method="post" action="project_update.do?prj_num=${ProjectList.prj_num}" id="projectupdateform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                    </c:when>
                                    <c:otherwise>
                                    <form method="post" action="project_insert.do" id="projectwriteform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                        </c:otherwise>
                                        </c:choose>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="prj_name" class=" form-control-label fa-solid text-gray-800 m-2"><sup class="text-danger small">*</sup>프로젝트명</label></div>
                                        <div class="col-12 col-md-7"><input type="text" id="prj_name" name="prj_name" placeholder="프로젝트명을 입력해주세요." class="form-control" value="${ProjectList.prj_name}"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="cus_num" class=" form-control-label fa-solid text-gray-800 m-2"><sup class="text-danger small">*</sup>PL</label></div>
                                        <div class="col-12 col-md-7 col-sm-4"><input type="text" id="cus_num" name="cus_num" placeholder="PL을 선택해주세요." class="form-control" value="${ProjectList.cus_num}"></div>
                                    </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3 text-right"><label for="prj_start" class=" form-control-label fa-solid text-gray-800 mt-2">프로젝트기간</label></div>
                                                <div class="col-12 col-md-2"><input type="date" name="prj_start" id="prj_start" class="form-control" value="${ProjectList.prj_start}"></div>
                                                <div class="text-center fa-solid text-gray-800 mt-2">~</div>
                                                <div class="col-12 col-md-2"><input type="date" name="prj_end" id="prj_end" class="form-control" value="${ProjectList.prj_end}"></div>
                                            </div>

                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><button class="btn btn-secondary ml-3" type="button" id="member" >
                                            프로젝트원추가
                                        </button>
                                        </div>
                                        <div class="col-12 col-md-7 text-gray-900 fa-solid m-2">${title}박현수</div>
                                    </div>

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
                                            if( document.getElementById("prj_name").value===''){
                                                $('#exampleModal').modal('show')
                                            }
                                            else {
                                                <c:choose>
                                                <c:when test="${test eq '1'}">
                                                document.getElementById('projectupdateform').submit();
                                                </c:when>
                                                <c:otherwise>
                                                document.getElementById('projectwriteform').submit();
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
                                <a href="project.do" class="btn btn-secondary">
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