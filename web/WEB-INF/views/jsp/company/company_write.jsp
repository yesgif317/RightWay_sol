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
                            <h6 class="m-0 font-weight-bold text-primary text-center">업체등록</h6>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <form method="post" action="update.do" id="updateform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="title-input" class=" form-control-label fa-solid text-gray-800 m-2"><sup class="text-danger small">*</sup>회사명</label></div>
                                        <div class="col-12 col-md-7"><input type="text" id="title-input" name="text-input" placeholder="회사명을 입력해주세요." class="form-control" value="${title}"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="reader-input" class=" form-control-label fa-solid text-gray-800 m-2"><sup class="text-danger small">*</sup>전화번호</label></div>
                                        <div class="col-12 col-md-7 col-sm-4"><input type="text" id="reader-input" name="number-input" placeholder="회사 대표번호를 입력해주세요." class="form-control" value="${writer}"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="com_addr" class=" form-control-label fa-solid text-gray-800 m-2">회사주소</label></div>
                                        <div class="col-12 col-md-7 col-sm-4"><input type="text" id="com_addr" name="com_addr" placeholder="주소를 입력해주세요." class="form-control" value="${writer}"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="detail" class=" form-control-label fa-solid text-gray-800 m-2">주요업무</label></div>
                                        <div class="col-12 col-md-7 col-sm-4"><input type="text" id="detail" name="detail" placeholder="주요업무 입력해주세요." class="form-control" value="${writer}"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label class=" form-control-label fa-solid text-gray-800 mt-2">회사규모</label></div>
                                        <div class="dropdown col-md-5">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="progressbtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                회사규모
                                            </button>
                                            <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="#">대기업</a>
                                                <a class="dropdown-item" href="#">중견기업</a>
                                                <a class="dropdown-item" href="#">중소기업</a>
                                                <a class="dropdown-item" href="#">공기업</a>
                                            </div>
                                            <label class="ml-2" for="progressbtn" id="progresslabel">회사규모를 선택해주세요.</label>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="size" class=" form-control-label fa-solid text-gray-800 m-2">계약일</label></div>
                                        <div class="col-12 col-md-2 col-sm-2"><input type="date" id="size" name="detail" class="form-control" value="${writer}"></div>
                                    </div>

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
                                            if( document.getElementById("title-input").value==''||document.getElementById("reader-input").value==''){
                                                $('#exampleModal').modal('show')
                                            }
                                            else {
                                                document.getElementById('outputswriteform').submit();
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
























    <jsp:include page="../../include/footer.jsp" flush="true" />

    <jsp:include page="../../include/logoutModal.jsp" flush="true" />

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>
