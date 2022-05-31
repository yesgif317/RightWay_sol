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
                                    <h6 class="m-0 font-weight-bold text-primary text-center">업체 수정</h6>
                                </c:when>
                                <c:otherwise>
                                    <h6 class="m-0 font-weight-bold text-primary text-center">업체 등록</h6>
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">

                                <c:choose>
                                <c:when test="${test eq '1'}">
                                <form method="post" action="company_update.do?com_num=${CompanyList.com_num}"
                                      id="companyupdateform" enctype="application/x-www-form-urlencoded"
                                      class="form-horizontal">
                                    </c:when>
                                    <c:otherwise>
                                    <form method="post" action="company_insert.do" id="companywriteform"
                                          enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                        </c:otherwise>
                                        </c:choose>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="com_name"
                                                                                        class=" form-control-label fa-solid text-gray-800 m-2"><sup
                                                    class="text-danger small">*</sup>회사명</label></div>
                                            <div class="col-12 col-md-7"><input type="text" id="com_name"
                                                                                name="com_name"
                                                                                placeholder="회사명을 입력해주세요."
                                                                                class="form-control"
                                                                                value="${CompanyList.com_name}" maxlength="65"></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="com_tel"
                                                                                        class=" form-control-label fa-solid text-gray-800 m-2">전화번호</label>
                                            </div>
                                            <div class="col-12 col-md-7 col-sm-4"><input type="tel" id="com_tel"
                                                                                         name="com_tel"
                                                                                         placeholder="회사 대표번호를 입력해주세요."
                                                                                         class="form-control"
                                                                                         value="${CompanyList.com_tel}" maxlength="20">
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="com_addr"
                                                                                        class=" form-control-label fa-solid text-gray-800 m-2">회사주소</label>
                                            </div>

                                            <div class="col-12 col-md-1 col-sm-4">
                                                <a class="btn btn-secondary text-gray-100" onclick="findAddr()">주소찾기</a>
                                            </div>
                                            <div class="col-12 col-md-6 col-sm-4">

                                                <input type="text" id="com_addr"
                                                                                         name="com_addr"
                                                                                         placeholder="주소를 입력해주세요."
                                                                                         class="form-control"
                                                                                         value="${CompanyList.com_addr}" maxlength="50">
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="com_business"
                                                                                        class=" form-control-label fa-solid text-gray-800 m-2">주요업무</label>
                                            </div>
                                            <div class="col-12 col-md-7 col-sm-4"><input type="text" id="com_business"
                                                                                         name="com_business"
                                                                                         placeholder="주요업무 입력해주세요."
                                                                                         class="form-control"
                                                                                         value="${CompanyList.com_business}" maxlength="60">
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label
                                                    class="form-control-label fa-solid text-gray-800 mt-2">회사규모</label>
                                            </div>
                                            <div class="dropdown col-md-5">
                                                <button class="btn btn-secondary dropdown-toggle" type="button"
                                                        id="progressbtn" data-toggle="dropdown" aria-haspopup="true"
                                                        aria-expanded="false">
                                                    <c:choose>
                                                        <c:when test="${test eq '1'}">
                                                            ${CompanyList.com_scale}
                                                        </c:when>
                                                        <c:otherwise>
                                                            회사규모
                                                        </c:otherwise>
                                                    </c:choose>
                                                </button>
                                                <div class="dropdown-menu animated--fade-in"
                                                     aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" onclick="return select_comsize(1)">대기업</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" onclick="return select_comsize(2)">중견기업</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" onclick="return select_comsize(3)">중소기업</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" onclick="return select_comsize(4)">공기업</a>
                                                </div>
                                                <label class="ml-2" for="progressbtn" id="progresslabel">회사규모를
                                                    선택해주세요.</label>
                                            </div>
                                            <input type="hidden" id="com_scale" name="com_scale"
                                                   value="${CompanyList.com_scale}"/>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right"><label for="com_contract"
                                                                                        class=" form-control-label fa-solid text-gray-800 m-2">계약일</label>
                                            </div>
                                            <div class="col-12 col-md-2 col-sm-2"><input type="date" id="com_contract"
                                                                                         name="com_contract"
                                                                                         class="form-control"
                                                                                         value="${CompanyList.com_contract}">
                                            </div>
                                        </div>
                                    </form>

                            </div>

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

                                    <%--modal--%>
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

                                </a>
                                <%--</button>--%>
                                <a href="company.do" class="btn btn-secondary">
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


    <script>
        function select_comsize(no) {
            const labelid = $("label[for='progressbtn']");
            const btnid = $('#progressbtn');
            const inputid = $('#com_scale');
            switch (no) {
                case 1 :
                    btnid.html('대기업');
                    labelid.text('');
                    inputid.val('대기업');
                    break;
                case 2 :
                    btnid.html('중견기업');
                    labelid.text('');
                    inputid.val('중견기업');
                    break;
                case 3 :
                    btnid.html('중소기업');
                    labelid.text('');
                    inputid.val('중소기업');
                    break;
                case 4 :
                    btnid.html('공기업');
                    labelid.text('');
                    inputid.val('공기업');
                    break;
                default :
            }
        }

        function findAddr() {
            new daum.Postcode({
                oncomplete: function (data) {

                    console.log(data);

                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var jibunAddr = data.jibunAddress; // 지번 주소 변수
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    if (roadAddr !== '') {
                        document.getElementById("com_addr").value = roadAddr;
                    } else if (jibunAddr !== '') {
                        document.getElementById("com_addr").value = jibunAddr;
                    }
                }
            }).open();
        }

        function chk_form() {
            if (document.getElementById("com_name").value === '') {
                $('#exampleModal').modal('show')
            } else {
                <c:choose>
                <c:when test="${test eq '1'}">
                document.getElementById('companyupdateform').submit();
                </c:when>
                <c:otherwise>
                document.getElementById('companywriteform').submit();
                </c:otherwise>
                </c:choose>
            }
        }
    </script>


    <jsp:include page="../../include/footer.jsp" flush="true"/>

    <jsp:include page="../../include/logoutModal.jsp" flush="true"/>

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>