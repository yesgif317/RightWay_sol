<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../include/header.jsp" flush="true"/>
<jsp:include page="../../include/sidebar.jsp" flush="true"/>


<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

        <jsp:include page="../../include/topbar.jsp" flush="true"/>
        <!-- Begin Page Content -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">

                    <!-- Collapsable Card Example -->
                    <div class="card shadow mb-4">
                        <!-- Card Header - Accordion -->
                        <a class="d-block card-header py-3">
                            <%
                                int test = Integer.parseInt(request.getParameter("update"));
                                pageContext.setAttribute("test", test);
                            %>
                            <c:choose>
                                <c:when test="${test eq '1'}">
                                    <h6 class="m-0 font-weight-bold text-primary text-center">정기보고 수정</h6>
                                </c:when>
                                <c:otherwise>
                                    <h6 class="m-0 font-weight-bold text-primary text-center">정기보고 등록</h6>
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <c:choose>
                                <c:when test="${test eq '1'}">
                                <form method="post" action="regularreport_update.do?post_num=${PostList.post_num}" id="regularreportupdateform"
                                      enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                    </c:when>
                                    <c:otherwise>
                                    <form method="post" action="regularreport_insert.do" id="regularreportwriteform"
                                          enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                        </c:otherwise>
                                        </c:choose>
                                            <input type="hidden" id="cus_num" name="cus_num" value=${login.cus_num}>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="nor_tit"
                                                                                        class=" form-control-label fa-solid text-gray-800 mt-2"><sup
                                                    class="text-danger small">*</sup>제목</label></div>
                                            <div class="col-12 col-md-7">
                                                <input type="text" id="nor_tit" name="nor_tit" placeholder="제목을 입력해주세요."
                                                       class="form-control" value=${PostList.nor_tit}>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="nor_cnt"
                                                                                        class=" form-control-label fa-solid text-gray-800 mt-2"><sup
                                                    class="text-danger small">*</sup>내용</label></div>
                                            <div class="col-12 col-md-7">
                                                <textarea name="nor_cnt" id="nor_cnt" rows="9"
                                                          placeholder="정기보고 내용을 입력해주세요."
                                                          class="form-control">${PostList.nor_cnt}</textarea>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="file_link"
                                                                                        class=" form-control-label fa-solid text-gray-800 mt-2">첨부파일</label>
                                            </div>
                                            <div class="col-12 col-md-9"><input type="file" id="file_link"
                                                                                name="file_link" multiple></div>
                                        </div>
                                        <input type="hidden" id="cate" name="cate" placeholder="제목을 입력해주세요."
                                               class="form-control" value="3">
                                        <input type="hidden" id="prj_num" name="prj_num" placeholder="제목을 입력해주세요."
                                               class="form-control" value="1">
                                    </form>

                            </div>

                            <div class="text-center d-block card-header py-3">
                                <a onclick="return chk_form()" class="btn btn-info">
                                                <span class="icon text-white-50">
                                                       <i class="fas fa-pen"></i>
                                                </span>
                                    <span class="text" style="color:white">
                                        <c:choose>
                                            <c:when test="${test eq '1'}">
                                                <span class="text" style="color:white">수정</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text" style="color:white">등록</span>
                                            </c:otherwise>
                                        </c:choose>
                                            </span>
                                    <script>
                                        function chk_form() {
                                            if (document.getElementById("nor_tit").value == '' || document.getElementById("nor_cnt").value == '') {
                                                $('#exampleModal').modal('show')
                                            } else {
                                                <c:choose>
                                                <c:when test="${test eq '1'}">
                                                document.getElementById('regularreportupdateform').submit();
                                                </c:when>
                                                <c:otherwise>
                                                document.getElementById('regularreportwriteform').submit();
                                                </c:otherwise>
                                                </c:choose>
                                            }
                                        }
                                    </script>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">작성글 확인</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    제목 또는 내용이 작성되지 않았습니다.
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button"
                                                            data-dismiss="modal">확인
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </a>
                                <%--</button>--%>
                                <a href="regularreport.do" class="btn btn-secondary">
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

    <jsp:include page="../../include/footer.jsp" flush="true"/>

</div>
<!-- End of Page Wrapper -->

<jsp:include page="../../include/logoutModal.jsp" flush="true"/>
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