<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../include/header.jsp" flush="true" />
<jsp:include page="../../include/sidebar.jsp" flush="true" />

<script src="<c:url value="/resources/js/demo/filedelete.js"/>"></script>
<%int test = Integer.parseInt(request.getParameter("post_num"));
    pageContext.setAttribute("test", test);%>
<script>
    function chk_form() {
        if (document.getElementById("title").value == '' || document.getElementById("contents").value == '') {
            $('#exampleModal').modal('show')
        } else {
            if(${test ne '0'}){

                var theForm = document.fileuploadform;
                theForm.method = "post";
                theForm.action = "/datacenter_update.do?post_num=${PostList.post_num}";
                theForm.submit();

            }
            else{

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
                formData.append("writer", writer);
                formData.append("contents", contents);
                document.getElementById('fileuploadform').submit();


            }


        }
    }

</script>
<script>
    //update 파라미터 받기

    //update 에 따라 버튼 수정 및 등록 반영
    window.onload = function() {
        if(${test eq '0'}){
            document.getElementById("pagetitle").innerHTML = '<h6 class="m-0 font-weight-bold text-primary text-center">글 등록</h6>';
            document.getElementById("writebutton").innerHTML = '등록';
        }
        else {
            document.getElementById("pagetitle").innerHTML = '<h6 class="m-0 font-weight-bold text-primary text-center">게시물 수정</h6>';
            document.getElementById("writebutton").innerHTML = '수정';
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
                        <a class="d-block card-header py-3" >
                            <div id="pagetitle"></div>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">

                                <form method="post" id="fileuploadform" action="datacenter_insert.do" name="fileuploadform" enctype="multipart/form-data" class="form-horizontal" >
                                    <div id="filedelete">

                                    </div>
                                    <input type="hidden" name="post_num" value="${PostList.post_num}">
                                    <input type="hidden" name="file_name" value="">
                                <input type="hidden" id="cus_num" name="cus_num" value=${login.cus_num}>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="title" class=" form-control-label fa-solid text-gray-800 mt-2">
                                                <sup class="text-danger small">*</sup>제목</label></div>
                                            <div class="col-12 col-md-7">
                                                <input  id="title" name="title" maxlength="40" placeholder="제목을 입력해주세요."
                                                        class="form-control" value='${PostList.nor_tit}'>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="contents"
                                                                                        class=" form-control-label fa-solid text-gray-800 mt-2"><sup
                                                    class="text-danger small">*</sup>내용</label></div>
                                            <div class="col-12 col-md-7">
                                                <textarea name="contents" id="contents" rows="9"
                                                          placeholder="내용을 입력해주세요." maxlength="1000"
                                                          class="form-control">${PostList.nor_cnt}</textarea>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="uploadFile"
                                                                                        class=" form-control-label fa-solid text-gray-800 mt-2">첨부파일</label>
                                            </div>
                                            <div class="col-12 col-md-9"><input type="file" id="uploadFile"
                                                                                name="uploadFile" multiple></div>
                                        </div>
                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-3" > &nbsp;&nbsp;&nbsp;첨부 파일<br>
                                            <c:forEach items="${FileList}" var="file">
                                                <div class="row form-group">
                                                    <a href="/download.do?file_name=${file.file_name}" id = "${file.file_name}"> &nbsp; ${file.file_name}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                                    <a onclick="delete_form(${file.cate},${file.post_num},'${file.file_name}')" id = "x_${file.file_name}">
                                                        <i class="fa-solid fa-trash"></i>
                                                            <%--<i class="fa-solid fa-circle-xmark"></i>--%>
                                                    </a>
                                                    <br>
                                                </div>
                                            </c:forEach>
                                            <br><br>
                                        </div>
                                        <div class="col-4" >
                                        </div>

                                    </div>
                                        <input type="hidden" id="cate" name="cate" placeholder="제목을 입력해주세요."
                                               class="form-control" value="1">
                                        <input type="hidden" id="prj_num" name="prj_num" placeholder="제목을 입력해주세요."
                                               class="form-control" value="${prj_list.prj_num}">
                                    </form>

                            </div>

                            <div class="text-center d-block card-header py-3">
                                <a href="javascript:chk_form();" class="btn btn btn-info btn-icon-split" id="uploadBtn">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                    <span class="text" id="writebutton">글쓰기</span>
                                </a>

                                <%--</button>--%>
                                <a href="outputs.do" class="btn btn-secondary">
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

<jsp:include page="../../include/logoutModal.jsp" flush="true" />
<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>

