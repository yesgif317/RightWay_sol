<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../include/header.jsp" flush="true" />
<jsp:include page="../../include/sidebar.jsp" flush="true" />

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
    <jsp:include page="../../include/topbar.jsp" flush="true"/>
    <!-- Main Content -->
    <div class="card-body">
        <div id="content">
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Collapsable Card Example -->
                        <div class="card shadow mb-4">
                            <!-- Card Header - Accordion -->
                            <a class="d-block card-header py-3">

                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="collapseCardExample">
                                <div class="card-body">
                                    <form method="post" id="file-upload-form" enctype="multipart/form-data" class="form-horizontal" action="/datacenter_insert.do">
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>제목</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="title" name="title" placeholder="제목을 입력해주세요" class="form-control"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label class=" form-control-label fa-solid text-gray-800 mt-2">작성자</label></div>
                                            <div class="col-12 col-md-7"><input type="email" id="writer" name="writer" placeholder="작성자를 입력해주세요" class="form-control"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>내용 작성</label></div>
                                            <div class="col-12 col-md-7"><textarea name="contents" id="contents" rows="9" placeholder="내용을 입력해주세요" class="form-control"></textarea></div>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label class=" form-control-label fa-solid text-gray-800 mt-2">업로드 파일</label></div>
                                            <div class="col-12 col-md-7"><input type="file" name="uploadFile" multiple></div>
                                        </div>
                                        <input type="text" name="cus_num" value="${login.cus_num}" hidden>
                                        <input type="text" name="prj_num" value="${prj_list.prj_num}" hidden>

                                        <div class="text-center d-block card-header py-3">
                                            <a href="javascript:chk_form();" class="btn btn-primary btn-icon-split" id="uploadBtn">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                                <span class="text">글쓰기</span>
                                            </a>
                                            <%--</button>--%>
                                            <a href="datacenter.do" class="btn btn-secondary">
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
                <!-- /.container-fluid -->
            </div>
        </div>
    </div>


    <script src="http://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>

</div>


<script>
    function chk_form() {
        if( document.getElementById("contents").value==''||document.getElementById("title").value==''){
            $('#exampleModal').modal('show')
        }
        else {
            document.getElementById('file-upload-form').submit();
        }
    }
</script>
<!-- End of Page Wrapper -->

<jsp:include page="../../include/logoutModal.jsp" flush="true" />
<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>

