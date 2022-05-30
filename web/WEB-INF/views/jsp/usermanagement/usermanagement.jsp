<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../../include/header.jsp" flush="true"/>
<jsp:include page="../../include/sidebar.jsp" flush="true"/>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">
        <jsp:include page="../../include/topbar.jsp" flush="true"/>
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">투입인력관리</h1>
            <p class="mb-4">프로젝트에 참여하는 인력정보를 관리하는 페이지입니다.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <form action="/excelform_download.do" method="get" style="width: auto; height: auto;margin: 0">
                        <button type="submit" class="btn btn-secondary mt-1">인원관리 양식 다운로드</button>
                    </form>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="dataTable">
                            <thead>
                            <tr>
                                <th>NO</th>
                                <th>이름</th>
                                <th>ID</th>
                                <th>직급</th>
                                <th>회사</th>
                                <th>이메일</th>
                                <th>연락처</th>
                                <th>승인여부</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${CustomerList}" var="cust" varStatus="status">
                                <tr onClick="location.href='usermanagement_content.do?cus_num=${cust.cus_num}'"
                                    onmouseover="this.style.fontWeight='bold';this.style.color='black'"  onmouseout=" this.style.fontWeight='';this.style.color='#858796'">
                                    <td>${status.count}</td>
                                    <td>${cust.cus_name}</td>
                                    <td>${cust.cus_id}</td>
                                    <td>${cust.cus_position}</td>
                                    <td>${cust.com_name}</td>
                                    <td>${cust.cus_email}</td>
                                    <td>${cust.cus_phone}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${cust.cus_state eq '0'}">
                                                미승인
                                            </c:when>
                                            <c:otherwise>
                                                승인
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="table-responsive">
                    <div>
                        <form id="frmAttachedFiles" class="form-horizontal" enctype="multipart/form-data">
                            <label class="btn btn-info btn-file ml-3" for="btnUploadExcel">
                                엑셀업로드
                                <input type="file" id="btnUploadExcel" name="btnUploadExcel" style="display: none">
                            </label>
                        </form>
                        <form action="/ExcelDownload.do" id="frmExcelDown" method="GET">
                            <button type=submit" class="btn btn-secondary ml-3">프로젝트 투입 인원 목록 다운로드
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Main Content -->


    <jsp:include page="../../include/footer.jsp" flush="true"/>

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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>

    <script>
        // 파일 선택(업로드) 이벤트
        $("#btnUploadExcel").on("change", function (e) {
            console.log("버튼입력 화긴");
            fnUploadExcelRegChk();
        });

        var count = null;

        // 엑셀업로드 체크
        function fnUploadExcelRegChk() {
            console.log("엑셀 업로드 화긴");
            let msg = "";
            let input = event.target;
            let reader = new FileReader();
            reader.onload = function () {
                let fdata = reader.result;
                let read_buffer = XLSX.read(fdata, {type: 'binary'});
                read_buffer.SheetNames.forEach(function (sheetName) {
                    let rowdata = XLSX.utils.sheet_to_json(read_buffer.Sheets[sheetName]); // Excel 입력 데이터

                    console.log('SheetName: ' + sheetName);
                    console.log(JSON.stringify(rowdata));
                    // 행 수 만큼 반복
                    for (let i = 0; i < rowdata.length; i++) {
                        // 필수값 체크
                        if (rowdata[i].id == null)
                            msg += 'id 값이 존재하지 않습니다.';
                        console.log(msg);
                        count = rowdata.length;
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
                })
                // console.log(JSON.stringify(rowdata));
                console.log("함수 실행전")
                fnUploadExcel();
            }
            reader.readAsBinaryString(input.files[0]);
        }


        // 엑셀업로드
        function fnUploadExcel() {
            var formData = new FormData($("#frmAttachedFiles")[0])
            console.log(formData)
            console.log("함수 실행후")
            $.ajax({
                url: "ExcelUpload.do",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                async: false,
                success: function (result) {

                    var split_res = result.split(',');
                    var add = count-(split_res.length-1);
                    var allmem = count-1;

                    if (split_res[0] == "OK") {
                        alert('업로드 성공\n추가된 인원:'+count-1+'명');
                        window.location.reload();
                    } else if(split_res[0] == "BAD_REQUEST") {
                        alert('인원 추가가 실패되었습니다. 사유 : 아이디 중복');
                        alert('전체 인원:'+allmem+'명, 추가된 인원:'+add+'명\n중복되는 아이디 :' + split_res.slice(1,split_res.maxLength))
                        alert('해당 아이디만 다시 수정하여 추가해주세요.\n중복되는 아이디 :' +split_res.slice(1,split_res.maxLength))
                        window.location.reload();
                    }
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    window.location.reload();
                }

            })
        }

    </script>