<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../../include/header.jsp" flush="true"/>
<jsp:include page="../../include/sidebar.jsp" flush="true"/>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
    <script>
        // 파일 선택(업로드) 이벤트
        $("#btnUploadExcel").on("change", function () {
            fnUploadExcelRegChk();
        });

        //엑셀업로드 체크
        function fnUploadExcelRegChk() {
            let msg = "";
            let input = event.target;
            let reader = new FileReader();
            reader.onload = function () {
                let fdata = reader.result;
                let read_buffer = XLSX.read(fdata, {type: 'binary'});
                read_buffer.SheetNames.forEach(function (sheetName) {
                    let rowdata = XLSX.utils.sheet_to_json(read_buffer.Sheets[sheetName]); // Excel 입력 데이터
                    // 행 수 만큼 반복
                    for (let i = 0; i < rowdata.length; i++) {
                        // 필수값 체크
                        if (rowdata[i].id == null)
                            msg += 'id 값이 존재하지 않습니다.';
                        console.log(msg);
                        return false;
                    }

                    // 정규식 체크
                    let keys = Object.keys(rowdata[i]);
                    let re = /[^ㄱ-ㅎ가-힣a-zA-Z0-9\-\_\.\@]/gi;
                    let reNum = /[^0-9]/gi;
                    for (let j = 0; j < keys.length; j++) {
                        let data = rowdata[i][keys[j]];
                        if (keys[j] == 'id') {
                            if (reNum.test(data)) {
                                msg = keys[j] + '은 숫자만 입력 가능합니다.';
                                console.log(msg);
                                return false;
                            }
                        } else {
                            if (re.test(data)) {
                                msg = keys[j] + '에 허용되지않는 문자가 포함되어있습니다.';
                                gfnFailAlert("", msg, gDelay2);
                                return false;
                            }
                        }
                    }
                }
                //console.log(JSON.stringify(rowdata));
                fnUploadExcel();
            }
        )
        };
        reader.readAsBinaryString(input.files[0]);
        }

        // 엑셀업로드
        function fnUploadExcel() {
            let apiUrl = "/rest/admin/memberExcelUp.do";
            $.ajax({
                url: apiUrl,
                type: "POST",
                data: new FormData($("#frmAttachedFiles")[0]),
                dataType: "json",
                processData: false,
                contentType: false,
                success: function (result) {
                    if (result.resultCode == "SUCCESS") {
                        console.log('업로드 성공');
                    } else {
                        console.log('업로드 실패');
                    }
                }
            });
        }


    </script>
    <!-- Main Content -->
    <div id="content">
        <jsp:include page="../../include/topbar.jsp" flush="true"/>
        <!-- Begin Page Content -->
        <div class="container-fluid">
            <div id="contAreaBox">
                <div class="panel">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <p> TEST 페이지</p>

                            <div>
                                <form action="/excelform_download.do" method="get">
                                    <button type="submit">인원관리 양식 다운로드</button>
                                </form>
                            </div>

                            <div>
                                <form name="inputForm" method="post" onsubmit="return _onSubmit();"
                                      action="/usermanagement/usermanagement.do" enctype="multipart/form-data"
                                      class="form-horizontal">
                                    <form id="frmAttachedFiles" class="form-horizontal" enctype="multipart/form-data">
                                        <div class="btn btn-primary btn-file">
                                            엑셀업로드
                                            <input type="file" id="btnUploadExcel" name="btnUploadExcel">
                                        </div>
                                    </form>
                                </form>
                            </div>

                            <div>
                                <form action="/ExcelDownload.do" id="frmExcelDown" method="GET">
                                    <button type=submit">엑셀다운로드
                                    </button>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <jsp:include page="../../include/footer.jsp" flush="true"/>
    <!-- End of Main Content -->

    <jsp:include page="../../include/logoutModal.jsp" flush="true"/>

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>

    <!-- Page level plugins -->
    <script src="<c:url value="/resources/vendor/datatables/jquery.dataTables.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.min.js"/>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value="/resources/js/demo/datatables-demo.js"/>"></script>

    <!-- Page level plugins -->
    <script src="<c:url value="/resources/vendor/chart.js/Chart.min.js"/>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value="/resources/js/demo/chart-bar-demo.js"/>"></script>
    <script src="<c:url value="/resources/js/demo/chart-pie-demo.js"/>"></script>