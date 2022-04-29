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
                            <h6 class="m-0 font-weight-bold text-primary text-center">위험등록</h6>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <form method="post" action="update.do" id="updateform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="title-input" class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>제목</label></div>
                                        <div class="col-12 col-md-7"><input type="text" id="title-input" name="text-input" placeholder="제목을 입력해주세요." class="form-control" value="${title}"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="purpose-input" class=" form-control-label fa-solid text-gray-800 mt-2">담당자</label></div>
                                        <div class="col-12 col-md-7"><input type="email" id="purpose-input" name="purpose-input" placeholder="담당자를 지정해주세요." class="form-control" value="${writer}"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="host-input" class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>중요도</label></div>
                                        <div class="dropdown mb-4 col-md-2">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                중요도선택
                                            </button>
                                            <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="#">A</a>
                                                <a class="dropdown-item" href="#">B</a>
                                                <a class="dropdown-item" href="#">C</a>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-5"><input type="text" id="host-input" name="host-input" placeholder="중요도를 선택해주세요." class="form-control" value="${writer}"></div>
                                    </div>

                                    <%--수정시에만 나오도록--%>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="supervise-input" class=" form-control-label fa-solid text-gray-800 mt-2">진행상태</label></div>
                                        <div class="dropdown mb-4 col-md-2">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="progressbtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                진행상태
                                            </button>
                                            <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="#">대기</a>
                                                <a class="dropdown-item" href="#">진행 중</a>
                                                <a class="dropdown-item" href="#">종료</a>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-5"><input type="text" id="supervise-input" name="supervise-input" placeholder="진행상태 입력해주세요." class="form-control" value="${writer}"></div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="contents" class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>위험내용</label></div>
                                        <div class="col-12 col-md-7"><textarea name="contents" id="contents" rows="8" placeholder="위험 내용 및 재현경로를 입력해주세요." class="form-control"></textarea></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="accceptdate-input" class=" form-control-label fa-solid text-gray-800 mt-2">발생일자/해결일자</label></div>
                                        <div class="col-12 col-md-3"><input type="date" name="accceptdate-input" id="accceptdate-input" class="form-control"></div>
                                        <div class="col-12 col-md-1 text-center fa-solid text-gray-800 mt-2">~</div>
                                        <div class="col-12 col-md-3"><input type="date" name="accceptdate-input2" id="accceptdate-input2" class="form-control"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="contents" class=" form-control-label fa-solid text-gray-800 mt-2">첨부파일</label></div>
                                        <div class="col-12 col-md-9"><input type="file" name="uploadFile" multiple></div>
                                    </div>

<%--                                    <div class="filebox">--%>
<%--                                        <label for="file" onclick="file_name()">파일선택</label>--%>
<%--                                        <input type="file" id="file" multiple>--%>
<%--                                        <input class="upload-name" value="선택된 파일 없음" disabled>--%>
<%--                                        <script>--%>
<%--                                            function file_name() {--%>
<%--                                                $("#file").on('change', function () {--%>
<%--                                                    var fileName = $("#file").val();--%>
<%--                                                    $(".upload-name").val(fileName);--%>
<%--                                                });--%>
<%--                                            }--%>
<%--                                        </script>--%>
<%--                                    </div>--%>


                                </form>
                            </div>
                            <div class="text-center d-block card-header py-3">
                                <%--<button type="submit" style="border:none;">--%>
                                <a <%--href="javascript:goSubmit();"--%>  onclick="return chk_form()" class="btn btn-info">
                                                <span class="icon text-white-50">
                                                       <i class="fas fa-pen"></i>
                                                </span>
                                    <span class="text" style="color:white">등록</span>
                                    <script>
                                        function chk_form() {
                                            if( document.getElementById("contents").value==''||document.getElementById("title").value==''){
                                                $('#exampleModal').modal('show')
                                            }
                                            else {
                                                document.getElementById('dangerwriteform').submit();
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
                                                    필수값이 입력되지 않았습니다.
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </a>
                                <%--</button>--%>
                                <a href="danger.do" class="btn btn-secondary">
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
