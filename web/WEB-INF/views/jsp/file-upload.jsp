<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../include/header.jsp" flush="true"/>
<jsp:include page="../include/sidebar.jsp" flush="true"/>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
    <jsp:include page="../include/topbar.jsp" flush="true"/>
    <div class="collapse show" id="collapseCardExample">
        <!-- Main Content -->

        <div class="card-body">
            <div id="content">

                <!-- Begin Page Content -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">자료실</h1>
                </div>
                <form method="post" action="tableswrite.do" id="file-upload-form" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                    <div class="row form-group">
                        <div class="col col-md-3"><label for="title" class=" form-control-label">제목</label></div>
                        <div class="col-12 col-md-9"><input type="text" id="title" name="title" placeholder="Text" class="form-control"><small class="form-text text-muted">This is a help text</small></div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3"><label for="writer" class=" form-control-label">작성자</label></div>
                        <div class="col-12 col-md-9"><input type="email" id="writer" name="writer" placeholder="Enter Email" class="form-control"><small class="help-block form-text">Please enter your email</small></div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3"><label for="contents" class=" form-control-label">내용 작성</label></div>
                        <div class="col-12 col-md-9"><textarea name="contents" id="contents" rows="9" placeholder="Content..." class="form-control"></textarea></div>
                    </div>

                    <div class="row form-group">
                        <div class="col col-md-3"><label for="contents" class=" form-control-label">업로드 파일</label></div>
                        <div class="col-12 col-md-9"><input type="file" name="uploadFile" multiple></div>
                    </div>
                    <div>
                        <a href="javascript:goSubmit();" class="btn btn-primary btn-icon-split" id="uploadBtn">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                            <span class="text">글쓰기</span>
                        </a>
                    </div>
                </form>
            </div>
        </div>



    </div>


    <script src="http://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>

    <script>
        $(document).ready(function () {
            $("#uploadBtn").on("click", function (e) {
                var formData = new FormData();
                var inputFile = $("input[name='uploadFile']");
                var title = $("input[name='title']").val();
                var writer = $("input[name='writer']").val();
                var contents = $("textarea[name='contents']").val();

                var files = inputFile[0].files;

                console.log(files);
                console.log(title + writer + contents)

                for (var i = 0; i < files.length; i++) {
                    formData.append("uploadFile", files[i]);
                }
                formData.append("title", title[0]);
                formData.append("writer",writer[0]);
                formData.append("contents",contents[0]);


                $.ajax({
                    url: "file-upload.do",
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: "POST",
                    success: function (result) {
                        alert("Uploaded");
                    },
                    error: function (request,error){
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                });
            });
        });
    </script>

</div>
<!-- End of Main Content -->
<jsp:include page="../include/footer.jsp" flush="true"/>

<jsp:include page="../include/logoutModal.jsp" flush="true"/>

<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>
