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

            <div class="row">
                <div class="col-lg-12">

                    <!-- Collapsable Card Example -->
                    <div class="card shadow mb-4">
                        <!-- Card Header - Accordion -->
                        <a class="d-block card-header py-3">
                            <%
                                int test = Integer.parseInt(request.getParameter("update"));
                                pageContext.setAttribute("test", test);
                            %>
                            <c:choose>
                                <c:when test="${test eq '1'}">
                                    <h6 class="m-0 font-weight-bold text-primary text-center">이슈수정</h6>
                                </c:when>
                                <c:otherwise>
                                    <h6 class="m-0 font-weight-bold text-primary text-center">이슈등록</h6>
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <c:choose>
                                <c:when test="${test eq '1'}">
                                <form method="post" action="issue_update.do?post_num=${RiskList.post_num}"
                                      id="issueupdateform" enctype="application/x-www-form-urlencoded"
                                      class="form-horizontal">
                                    </c:when>
                                    <c:otherwise>
                                    <form method="post" action="issue_insert.do" id="issuewriteform"
                                          enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                        </c:otherwise>
                                        </c:choose>
                                            <input type="hidden" name="cus_num" value="${login.cus_num}">
                                            <input type="hidden" name="cate" value="10">
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="risk_tit"
                                                                                        class=" form-control-label fa-solid text-gray-800 mt-2"><sup
                                                    class="text-danger small">*</sup>제목</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="risk_tit"
                                                                                name="risk_tit"
                                                                                placeholder="제목을 입력해주세요."
                                                                                class="form-control"
                                                                                value="${RiskList.risk_tit}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label
                                                    class=" form-control-label fa-solid text-gray-800 mt-2"><sup
                                                    class="text-danger small">*</sup>담당자</label>
                                            </div>
                                            <div id="result" class="dropdown col-md-5">
                                                <a  class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal1">
                                                    <span class="text" style="color:white">담당자선택</span>
                                                </a>
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true" >
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel1">담당자선택</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">×</span>
                                                                    </button>
                                                                </div>

                                                                <div class="modal-body">
                                                                    <div class="card-body">
                                                                    <div class="table-responsive">
                                                                    <table class="table table-sm table-bordered table-hover" id="dataTable">
                                                                        <thead>
                                                                        <tr>
                                                                            <th width="30%">이름</th>
                                                                            <th width="20%">직책</th>
                                                                            <th>이메일</th>
                                                                            <th></th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        <c:forEach items="${CustomerList}" var="customer"  >
                                                                            <tr >
                                                                                <td>${customer.cus_name}</td>
                                                                                <td>${customer.cus_position}</td>
                                                                                <td>${customer.cus_email}</td>
                                                                                <td onclick="return memberselect('${customer.cus_num}','${customer.cus_name}','${customer.cus_position}')">
                                                                                    <a class="btn btn-secondary text-gray-100" data-dismiss="modal">선택</a>
                                                                                </td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                        </tbody>
                                                                    </table>
                                                                    </div>
                                                                    </div>
                                                                </div>

                                                                <div class="modal-footer">
                                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                <input id="mng_name" class="ml-2"
                                                       style="border:0 solid whitesmoke;" value="${RiskList.mng_name}/${RiskList.mng_position}" placeholder="담당자를 선택해주세요."
                                                       readonly>
                                                <input type="hidden" name="risk_mng" id="risk_mng" value="${RiskList.risk_mng}">
                                            </div>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="impMenuButton"
                                                                                        class=" form-control-label fa-solid text-gray-800 mt-2"><sup
                                                    class="text-danger small">*</sup>중요도</label></div>
                                            <div class="dropdown col-md-7">
                                                <button class="btn btn-secondary dropdown-toggle" type="button"
                                                        id="impMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                                        aria-expanded="false">
                                                    중요도선택
                                                </button>
                                                <div class="dropdown-menu animated--fade-in"
                                                     aria-labelledby="impMenuButton">
                                                    <a class="dropdown-item text-danger"
                                                       onclick="return select_important(1)"><h6>Emergency</h6></a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item text-warning"
                                                       onclick="return select_important(2)"><h6>High</h6></a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item text-success"
                                                       onclick="return select_important(3)"><h6>Medium</h6></a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item text-info"
                                                       onclick="return select_important(4)"><h6>Low</h6></a>
                                                </div>
                                                <input name="risk_imp" id="risk_imp" class="ml-2"
                                                       style="border:0 solid whitesmoke;" placeholder="중요도를 선택해주세요."
                                                       value="${RiskList.risk_imp}" readonly>
                                            </div>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"></div>
                                            <div class="dropdown col-md-7">
                                                <div class="card mb-4">
                                                    <!-- Card Header - Accordion -->
                                                    <a href="#impguide" class="d-block card-header py-2 collapsed"
                                                       data-toggle="collapse" aria-expanded="true"
                                                       aria-controls="impguide">
                                                        <small class="font-weight-bold text-primary">중요도 가이드</small>
                                                    </a>
                                                    <div class="collapse" id="impguide">
                                                        <div class="card-body">
                                                            <div><strong class="text-danger">Emergency </strong> - 최우선으로
                                                                해결해야 하는 이슈 <small class="text-gray-400">(ex.접속불가,서비스
                                                                    강제종료 등)</small></div>
                                                            <div><strong class="text-warning">High </strong> - 기능상 문제가
                                                                되고 다른기능이나 환경에 영향을 미치는 이슈
                                                            </div>
                                                            <div><strong class="text-success">Medium </strong> - 기능상 문제가
                                                                있으나 타기능에 영향이 없는 이슈
                                                            </div>
                                                            <div><strong class="text-info">Low </strong> - 기능상 문제가 없는 이슈
                                                                <small class="text-gray-400">(ex.오탈자,UI 등)</small></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label
                                                    class=" form-control-label fa-solid text-gray-800 mt-2">진행상태</label>
                                            </div>
                                            <div class="dropdown col-md-5">
                                                <button class="btn btn-secondary dropdown-toggle" type="button"
                                                        id="progressbtn" data-toggle="dropdown" aria-haspopup="true"
                                                        aria-expanded="false">
                                                    진행상태
                                                </button>
                                                <div class="dropdown-menu animated--fade-in"
                                                     aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" onclick="return select_progress(1)"><h6>대기</h6></a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" onclick="return select_progress(2)"><h6>진행
                                                        중</h6></a>
                                                    <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" onclick="return select_progress(3)"><h6>종료</h6></a>
                                                </div>
                                                <input name="risk_pgs" id="risk_pgs" class="ml-2"
                                                       style="border:0 solid whitesmoke;" placeholder="진행상태를 선택해주세요."
                                                       value="${RiskList.risk_pgs}" readonly>
                                            </div>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="risk_con"
                                                                                        class=" form-control-label fa-solid text-gray-800 mt-2"><sup
                                                    class="text-danger small">*</sup>이슈내용</label></div>
                                            <div class="col-12 col-md-7"><textarea name="risk_con" id="risk_con"
                                                                                   rows="8"
                                                                                   placeholder="이슈 내용 및 재현경로를 입력해주세요."
                                                                                   class="form-control">${RiskList.risk_con}</textarea>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="risk_start"
                                                                                        class=" form-control-label fa-solid text-gray-800 mt-2">발생일자/해결일자</label>
                                            </div>
                                            <div class="col-12 col-md-2"><input type="date" name="risk_start"
                                                                                id="risk_start" class="form-control"
                                                                                value="${RiskList.risk_start}"></div>
                                            <div class="text-center fa-solid text-gray-800 mt-2">~</div>
                                            <div class="col-12 col-md-2"><input type="date" name="risk_end"
                                                                                id="risk_end" class="form-control"
                                                                                value="${RiskList.risk_end}"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label
                                                    class=" form-control-label fa-solid text-gray-800 mt-2">첨부파일</label>
                                            </div>
                                            <div class="col-12 col-md-9"><input type="file" name="uploadFile" multiple>
                                            </div>
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
                            <script>
                                function select_important(no) {
                                    const risk = $('#risk_imp');
                                    switch (no) {
                                        case 1 :
                                            risk.val('Emergency');
                                            document.getElementById("risk_imp").style.color = "#e74a3b";
                                            break;
                                        case 2 :
                                            risk.val('High');document.getElementById("risk_imp").style.color = "#f6c23e";
                                            break;
                                        case 3 :
                                            risk.val('Medium');document.getElementById("risk_imp").style.color = "#1cc88a";
                                            break;
                                        case 4 :
                                            risk.val('Low');document.getElementById("risk_imp").style.color = "#36b9cc";
                                            break;
                                        default :
                                    }
                                }

                                function select_progress(no) {
                                    const risk_pgs = $('#risk_pgs');
                                    switch (no) {
                                        case 1 :
                                            risk_pgs.val('대기');
                                            break;
                                        case 2 :
                                            risk_pgs.val('진행 중');
                                            break;
                                        case 3 :
                                            risk_pgs.val('종료');
                                            break;
                                        default :
                                    }
                                }

                                function memberselect(num,name,position) {
                                    document.getElementById('mng_name').setAttribute("value", name + "/" + position);
                                    document.getElementById('risk_mng').setAttribute("value", num);
                                }

                                    function chk_form() {
                                    if (document.getElementById("risk_tit").value == ''||document.getElementById("risk_imp").value == ''||document.getElementById("risk_con").value == ''||document.getElementById("risk_mng").value == '') {
                                    $('#exampleModal').modal('show')
                                } else {
                                    <c:choose>
                                    <c:when test="${test eq '1'}">
                                    document.getElementById('issueupdateform').submit();
                                    </c:when>
                                    <c:otherwise>
                                    document.getElementById('issuewriteform').submit();
                                    </c:otherwise>
                                    </c:choose>
                                }
                                }
                            </script>
                            <div class="text-center d-block card-header py-3">
                                <a onclick="return chk_form()" class="btn btn-info">
                                                <span class="icon text-white-50">
                                                       <i class="fas fa-pen"></i>
                                                </span>
                                    <c:choose>
                                        <c:when test="${test eq '1'}">
                                            <span OnClick="location.href='javascript:goSubmit();'" class="text"
                                                  style="color:white">수정</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span OnClick="location.href='javascript:goSubmit();'" class="text"
                                                  style="color:white">등록</span>
                                        </c:otherwise>
                                    </c:choose>
                                </a>
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
                                                    필수값이 입력되지 않았습니다.
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button"
                                                            data-dismiss="modal">확인
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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