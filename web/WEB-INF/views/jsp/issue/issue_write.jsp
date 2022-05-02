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
                            <h6 class="m-0 font-weight-bold text-primary text-center">이슈등록</h6>
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
                                        <div class="col col-md-3 text-right"><label class=" form-control-label fa-solid text-gray-800 mt-2">담당자</label></div>
                                        <div class="dropdown col-md-5">
                                            <button class="btn btn-secondary" type="button" id="managerbtn">
                                                담당자선택
                                            </button>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="impMenuButton" class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>중요도</label></div>
                                        <div class="dropdown col-md-7">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="impMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                중요도선택
                                            </button>
                                            <div class="dropdown-menu animated--fade-in" aria-labelledby="impMenuButton">
                                                <a class="dropdown-item text-danger" href="#">Emergency</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item text-warning" href="#">High</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item text-success" href="#">Medium</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item text-info" href="#">Low</a>
                                            </div>
                                            <label class="ml-2" for="impMenuButton" id="implabel">중요도를 선택해주세요.</label>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"></div>
                                        <div class="dropdown col-md-7">
                                            <div class="card mb-4">
                                                <!-- Card Header - Accordion -->
                                                <a href="#impguide" class="d-block card-header py-2 collapsed" data-toggle="collapse" aria-expanded="true" aria-controls="impguide">
                                                    <small class="font-weight-bold text-primary">중요도 가이드</small>
                                                </a>
                                                <div class="collapse" id="impguide">
                                                    <div class="card-body">
                                                        <div><strong class="text-danger">Emergency  </strong> - 최우선으로 해결해야 하는 이슈 <small class="text-gray-400">(ex.접속불가,서비스 강제종료 등)</small></div>
                                                        <div><strong class="text-warning">High  </strong> - 기능상 문제가 되고 다른기능이나 환경에 영향을 미치는 이슈</div>
                                                        <div><strong class="text-success">Medium  </strong> - 기능상 문제가 있으나 타기능에 영향이 없는 이슈</div>
                                                        <div><strong class="text-info">Low  </strong> - 기능상 문제가 없는 이슈 <small class="text-gray-400">(ex.오탈자,UI 등)</small></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <%--수정시에만 나오도록--%>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class=" form-control-label fa-solid text-gray-800 mt-2">진행상태</label></div>
                                        <div class="dropdown col-md-5">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="progressbtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                진행상태
                                            </button>
                                            <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="#">대기</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">진행 중</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">종료</a>
                                            </div>
                                            <label class="ml-2" for="progressbtn" id="progresslabel">진행상태를 선택해주세요.</label>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="contents" class=" form-control-label fa-solid text-gray-800 mt-2"><sup class="text-danger small">*</sup>이슈내용</label></div>
                                        <div class="col-12 col-md-7"><textarea name="contents" id="contents" rows="8" placeholder="이슈 내용 및 재현경로를 입력해주세요." class="form-control"></textarea></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="accceptdate-input" class=" form-control-label fa-solid text-gray-800 mt-2">발생일자/해결일자</label></div>
                                        <div class="col-12 col-md-2"><input type="date" name="accceptdate-input" id="accceptdate-input" class="form-control"></div>
                                        <div class="text-center fa-solid text-gray-800 mt-2">~</div>
                                        <div class="col-12 col-md-2"><input type="date" name="accceptdate-input2" id="accceptdate-input2" class="form-control"></div>
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
                                                document.getElementById('issuewriteform').submit();
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
                                <a href="issue.do" class="btn btn-secondary">
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
