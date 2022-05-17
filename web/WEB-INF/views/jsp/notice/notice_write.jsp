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
                        <a class="d-block card-header py-3">
                            <%
                                int test = Integer.parseInt(request.getParameter("update")) ;
                                pageContext.setAttribute("test", test) ;
                            %>
                            <c:choose>
                                <c:when test="${test eq '1'}">
                                    <h6 class="m-0 font-weight-bold text-primary text-center">공지사항 수정</h6>
                                </c:when>
                                <c:otherwise>
                                    <h6 class="m-0 font-weight-bold text-primary text-center">공지사항 등록</h6>
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <c:choose>
                                <c:when test="${test eq '1'}">
                                <form method="post" action="notice_update.do" id="noticeupdateform" enctype="multipart/form-data" class="form-horizontal">
                                    </c:when>
                                    <c:otherwise>
                                    <form method="post" action="notice_insert.do" id="noticewriteform" enctype="multipart/form-data" class="form-horizontal">
                                        </c:otherwise>
                                        </c:choose>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="title" class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>제목</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="title" name="title" placeholder="제목을 입력해주세요." class="form-control" value=""></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="contents" class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>내용</label></div>
                                            <div class="col-12 col-md-7"> <textarea name="contents" id="contents" rows="9" placeholder="공지사항 내용을 입력해주세요." class="form-control"></textarea></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="contents" class=" form-control-label fa-solid text-gray-800 mt-2">첨부파일</label></div>
                                            <div class="col-12 col-md-9"><input type="file" name="uploadFile" multiple></div>
                                        </div>
                                        <input type="hidden" name="cus_num" value="${login.cus_num}">
<%--                                                                            <input type="hidden" name = "prj_num" value="${login.prj_num}">--%>
                                    </form>

                            </div>
                            <div class="text-center d-block card-header py-3">
                                <%--<button type="submit" style="border:none;">--%>
                                <a <%--href="javascript:goSubmit();"--%>  onclick="return chk_form()" class="btn btn-info">
                                                <span class="icon text-white-50">
                                                       <i class="fas fa-pen"></i>
                                                </span>
                                    <span class="text" style="color:white" >
                                        <c:choose>
                                            <c:when test="${test eq '1'}">
                                                <span  class="text" style="color:white">수정</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span  class="text" style="color:white" id="uploadBtn" onclick="chk_form()">등록</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                    <script>
                                        function chk_form() {
                                            if( document.getElementById("contents").value==''){
                                                $('#exampleModal').modal('show')
                                            }
                                            else if ( document.getElementById("title").value=='' ) {
                                                $('#exampleModal').modal('show')
                                            }

                                            var formData = new FormData();
                                            var inputFile = $("input[name='uploadFile']");
                                            var title = $("input[name='title']").val();
                                            var writer = $("input[name='cus_num']").val();
                                            var contents = $("textarea[name='contents']").val();

                                            var files = inputFile[0].files;

                                            console.log(files);
                                            console.log(title + "/" + writer + "/" + contents)

                                            for (var i = 0; i < files.length; i++) {
                                                formData.append("uploadFile", files[i]);
                                            }
                                            formData.append("title", title);
                                            formData.append("writer",writer);
                                            formData.append("contents",contents);

                                            document.getElementById('noticewriteform').submit();

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
                                                    제목 또는 내용이 작성되지 않았습니다.
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                                <%--</button>--%>
                                <a href="notice.do" class="btn btn-secondary">
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
