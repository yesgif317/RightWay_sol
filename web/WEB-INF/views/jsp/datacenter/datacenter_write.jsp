<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../include/header.jsp" flush="true" />
<jsp:include page="../../include/sidebar.jsp" flush="true" />

<script>
    //update 파라미터 받기
    <%int test = Integer.parseInt(request.getParameter("post_num"));
    pageContext.setAttribute("post_num", test);%>
    //update 에 따라 버튼 수정 및 등록 반영
    window.onload = function() {
        if(${post_num eq '0'}){
            document.getElementById("pagetitle").innerHTML = '<h6 class="m-0 font-weight-bold text-primary text-center">글 등록</h6>';
            document.getElementById("writebutton").innerHTML = '등록';
        }
        else {
            document.getElementById("pagetitle").innerHTML = '<h6 class="m-0 font-weight-bold text-primary text-center">게시물 수정</h6>';
            document.getElementById("writebutton").innerHTML = '수정';
        }
    }
    //모달 실행 함수
    function chk_form() {
        if( document.getElementById("contents").value==''||document.getElementById("title").value==''){
            $('#exampleModal').modal('show')
        }
        else {
            if(${post_num eq '0'}){
                document.getElementById("fileuploadform").submit();
            }
            else {
                var theForm = document.fileuploadform;
                theForm.method = "post";
                theForm.action = "/datacenter_update.do?post_num=${PostList.post_num}";
                theForm.submit();
            }

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
    <jsp:include page="../../include/topbar.jsp" flush="true"/>
    <!-- Main Content -->
    <div class="card-body">
        <div id="content">
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Collapsable Card Example -->
                        <div class="card shadow mb-4" >
                            <!-- Card Header - Accordion -->
                            <a class="d-block card-header py-3" >
                                <div id="pagetitle"> </div>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="collapseCardExample">
                                <div class="card-body" id="postbody">
                                    <%--<form method="post" id="file-update-form" name="file-update-form" enctype="multipart/form-data" class="form-horizontal" action="/datacenter_update.do?post_num=${PostList.post_num}">
                                        <input type="hidden" name="post_num" value="${PostList.post_num}" readonly class="form-control"/>
                                    </form>--%>
                                    <form method="post" id="fileuploadform" action="datacenter_insert.do" name="fileuploadform" enctype="multipart/form-data" class="form-horizontal" >
                                        <input type="hidden" name="post_num" value="${PostList.post_num}" readonly class="form-control"/>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>제목</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="title" name="title" maxlength="40" placeholder="제목을 입력해주세요" class="form-control" value="${PostList.nor_tit}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label class=" form-control-label fa-solid text-gray-800 mt-2">작성자</label></div>
                                            <div class="col-12 col-md-7"><input type="email" id="writer" name="writer" placeholder="${login.cus_name}" readonly class="form-control"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>내용 작성</label></div>
                                            <div class="col-12 col-md-7"><textarea name="contents" id="contents" rows="9" maxlength="1000" placeholder="내용을 입력해주세요" class="form-control">${PostList.nor_cnt}</textarea></div>
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
                                                <span class="text" id="writebutton">글쓰기</span>
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



<!-- End of Page Wrapper -->

<jsp:include page="../../include/logoutModal.jsp" flush="true" />
<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>

