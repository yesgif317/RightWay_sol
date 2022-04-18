<%--
  Created by IntelliJ IDEA.
  User: hate5
  Date: 2020-09-06
  Time: 오후 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="DataTable Example">
    <meta name="author" content="JeongU">

    <title>산출물 작성</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <jsp:include page="include/sidebar.jsp" flush="true" />
    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <jsp:include page="include/topbar.jsp" flush="true" />

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">산출물</h1>
                <p class="mb-4"> 산출물이란 프로젝트나 프로그램의 가시적이고 측정 가능한 결과물을 말합니다.
                    <br>
                    산출물에는 설계 모델, 사양 문서, 원형 등이 있습니다.
                    <br>
                    이 페이지에서 산출물에 가입하고 산출물을 참조할 수 있습니다.
                    <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

                <div class="row">
                    <div class="col-lg-12">

                        <!-- Collapsable Card Example -->
                        <div class="card shadow mb-4">
                            <!-- Card Header - Accordion -->
                            <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                <h6 class="m-0 font-weight-bold text-primary">산출물 게시물 조회</h6>

                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="collapseCardExample">
                                <div class="card-body">
                                    <form method="post"  id="tableswriteform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                        <div class="row form-group">
                                            <div class="col col-md-2"><label class=" form-control-label">제목</label></div>
                                            <div class="col-12 col-md-7">평가인증 보고서<small class="form-text text-muted">This is a help text</small></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-2"><label class=" form-control-label">작성자</label></div>
                                            <div class="col-12 col-md-7">작성자 및 직책 자동으로 입력(db연동)<small class="help-block form-text">name from your login information</small></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-2"><label  class=" form-control-label">이메일</label></div>
                                            <div class="col-11 col-md-7">이메일 자동으로 입력(db연동)<small class="help-block form-text">email from your login information</small></div>
                                        </div>


                                        <div class="row form-group">
                                            <div class="col col-md-2"><label class=" form-control-label">참고사항</label></div>
                                            <div class="col-12 col-md-7">고객사와 회의한 내용을 반영하여 수행함<small class="help-block form-text">산출물에 대해 작성해주세요.</small></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-2"><label class=" form-control-label">산출물 구분</label></div>
                                            <div class="col-12 col-md-7">설계모델<small class="help-block form-text">choose outputs category</small></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-2"><label class=" form-control-label">프로젝트 선택</label></div>
                                            <div class="col-12 col-md-7">솔리데오
                                                <small class="help-block form-text">choose project</small></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-2"><label class=" form-control-label">첨부파일</label></div>
                                            <div class="col-12 col-md-7">평가보고서.pdf<small class="help-block form-text">다운로드하세요.</small></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-2"><label class=" form-control-label">내용 작성</label></div>
                                            <div class="col-12 col-md-7">객체지향 분석과 설계 과정은 순차적이 아니다. 객체지향 방법으로 개발하는 대부분의 기관에서는 반복 및 점증적 개발 프로세스를 사용하고 있다. 그 이유는 객체지향 패러다임은 설계와 구현 작업 사이에 공통의 개념들을 사용하고 있기 때문에 전환에 전환이 쉽다는 것이다. 즉 분석과 설계 단계에서 이해했던 시스템의 작은 부분도 바로 프로그래밍할 수 있고 분석이 다시 필요하면 언제든지 나머지 부분을 추가하여 분석할 수 있다. 시스템이 한 번의 사이클에 완성되는 것이 아니라 반복적인 사이클을 거치면서 점차적으로 확장되고 완성되어 가는 것이다.</div>
                                        </div>
                                        <br>
                                        <br>
                                        <br>
                                        <div style="text-align: center">
                                            <a href="javascript:goSubmit();" class="btn btn-primary btn-icon-split">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                                <span class="text">  삭제</span>
                                            </a>
                                            <a href="javascript:goSubmit();" class="btn btn-primary btn-icon-split">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                                <span class="text">  수정</span>

                                            </a>
                                            <a href="http://localhost:8088/outputs.do" class="btn btn-primary btn-icon-split">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                                <span class="text"

                                                      >  목차보기</span>

                                            </a>
                                            <a href="javascript:goSubmit();" class="btn btn-primary btn-icon-split">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                                <span class="text">  이전글</span>

                                            </a>
                                            <a href="javascript:goSubmit();" class="btn btn-primary btn-icon-split">
                          <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                          </span>
                                                <span class="text">  다음글</span>

                                            </a>
                                        </div>
                                        <br>
                                        <br>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>

<script src="<c:url value="/resources/vendor/datatables/dataTable.js"/>"></script>
<!-- Page level plugins -->
<script src="<c:url value="/resources/vendor/chart.js/Chart.min.js"/>"></script>

<!-- Page level custom scripts -->
<script src="<c:url value="/resources/js/demo/chart-bar-demo.js"/>"></script>
<script src="<c:url value="/resources/js/demo/chart-pie-demo.js"/>"></script>
<script type="text/javascript">
    function goSubmit() {
        var form = document.getElementById('tableswriteform').submit();
    }
</script>

</body>

</html>
