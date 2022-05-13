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
                            <%
                                int test = Integer.parseInt(request.getParameter("update")) ;
                                pageContext.setAttribute("test", test) ;
                            %>
                            <c:choose>
                                <c:when test="${test eq '1'}">
                                    <h6 class="m-0 font-weight-bold text-primary text-center">프로젝트 수정</h6>
                                </c:when>
                                <c:otherwise>
                                    <h6 class="m-0 font-weight-bold text-primary text-center">프로젝트 등록</h6>
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <c:choose>
                                <c:when test="${test eq '1'}">
                                <form method="post" action="project_update.do?prj_num=${ProjectList1.prj_num}" id="projectupdateform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                    </c:when>
                                    <c:otherwise>
                                    <form method="post" action="project_insert.do" id="projectwriteform" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                        </c:otherwise>
                                        </c:choose>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="prj_name" class=" form-control-label fa-solid text-gray-800 m-2"><sup class="text-danger small">*</sup>프로젝트명</label></div>
                                        <div class="col-12 col-md-7"><input type="text" id="prj_name" name="prj_name" placeholder="프로젝트명을 입력해주세요." class="form-control" value="${ProjectList1.prj_name}"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-right"><label for="cus_num" class=" form-control-label fa-solid text-gray-800 m-2"><sup class="text-danger small">*</sup>PL</label></div>
                                        <div class="col-12 col-md-7 col-sm-4">
                                            <a  class="btn btn-secondary" data-toggle="modal" data-target="#PLModal">
                                                <span class="text" style="color:white">PL선택</span>
                                            </a>
                                            <!-- Modal -->
                                            <div class="modal fade" id="PLModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true" >
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel1">PL선택</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">×</span>
                                                            </button>
                                                        </div>

                                                        <div class="modal-body">
                                                            <div class="card-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-sm table-bordered table-hover" id="dataTable_pl">
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
                                                                                <td onclick="return plselect('${customer.cus_num}','${customer.cus_name}','${customer.cus_position}')">
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
                                            <input id="cus_name" class="ml-2"
                                                   style="border:0 solid whitesmoke;" value="${ProjectList1.cus_name}/${ProjectList1.cus_position}" placeholder="PL을 선택해주세요."
                                                   readonly>
                                            <input type="hidden" id="cus_num" name="cus_num" placeholder="PL을 선택해주세요." class="form-control" value="${ProjectList1.cus_num}">
                                        </div>
                                    </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3 text-right"><label for="prj_start" class=" form-control-label fa-solid text-gray-800 mt-2">프로젝트기간</label></div>
                                                <div class="col-12 col-md-2"><input type="date" name="prj_start" id="prj_start" class="form-control" value="${ProjectList1.prj_start}"></div>
                                                <div class="text-center fa-solid text-gray-800 mt-2">~</div>
                                                <div class="col-12 col-md-2"><input type="date" name="prj_end" id="prj_end" class="form-control" value="${ProjectList1.prj_end}"></div>
                                            </div>
                                </form>
                                        <c:if test="${test eq 1}">
                                        <div class="row form-group">
                                            <div class="col col-md-3 text-right">
                                                <a class="btn btn-sm ml-3 btn-info" data-toggle="modal"
                                                   data-target="#exampleModal1">
                                                    <span class="text " style="color:white">프로젝트원 추가</span>
                                                </a>
                                                <!-- Modal -->

                                                <div class="modal fade" id="exampleModal1"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                프로젝트원선택
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                        aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>

                                                            <div class="modal-body">
                                                                <div class="card-body">
                                                                    <div class="table-responsive">
                                                                        <table class="table table-sm table-bordered table-hover" id="dataTable">

                                                                    <thead>
                                                                    <tr>
                                                                        <th>이름</th>
                                                                        <th>직책</th>
                                                                        <th>연락처</th>
                                                                        <th>이메일</th>
                                                                    </tr>
                                                                    </thead>
                                                                            <tbody>
                                                                    <c:forEach items="${CusmodalList}" var="cusmodal">
                                                                        <c:set var="i" value="${i+1}"/>

                                                                        <tr>
                                                                            <td>${cusmodal.cus_name}</td>
                                                                            <td>${cusmodal.cus_position}</td>
                                                                            <td>${cusmodal.cus_email}</td>
                                                                            <td>
                                                                                <input type="hidden" id='${i}'
                                                                                       value='${cusmodal.cus_num}'>
                                                                                <a class="btn btn-secondary text-gray-100" data-dismiss="modal"
                                                                                   onclick="return memberselect('${i}')">선택</a>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                            </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                                                            </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <small class="mt-2">*프로젝트원 추가시 현재 입력값이 자동으로 저장됩니다.</small>
                                        </div>


                                        <div class="row form-group">
                                            <div class="col-2"></div>
                                        </div>
                                        <div class="row form-group">
                                            <input type="hidden" id="prj_num" name="prj_num"
                                                   value='${ProjectList1.prj_num}'/>
                                            <div class="col-2"></div>
                                            <div class="col-8"
                                                 style="border-top:  2px solid #2c9faf;border-bottom: 2px solid #2c9faf;">
                                                <div class="card mb-4">

                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table table-bordered" id="dataTable1">
                                                                <thead>
                                                                <tr>
                                                                    <th>이름</th>
                                                                    <th>직책</th>
                                                                    <th>연락처</th>
                                                                    <th>이메일</th>
                                                                    <th width="5%"></th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:forEach items="${Project_detailList}" var="project_detail">
                                                                            <tr>
                                                                                <td>${project_detail.cus_name}</td>
                                                                                <td>${project_detail.cus_position}</td>
                                                                                <td>${project_detail.cus_phone}</td>
                                                                                <td>${project_detail.cus_email}</td>
                                                                                <td onclick="return delete_form(${project_detail.cus_num})">
                                                                                    <a class="btn ml-2 btn-danger text-gray-100">
                                                                                        <i class="fa-regular fa-circle-xmark"></i>
                                                                                    </a>
                                                                                </td>
                                                                            </tr>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>

                                                <form method="post" action="project_detail_delete.do" id="project_detaildeleteform"
                                                      enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                                    <input type="hidden" name="_method" value="delete">
                                                    <input type="hidden"  name="prj_num"
                                                           value='${ProjectList1.prj_num}'/>
                                                    <input type="hidden" id="delete_cus_num" name="cus_num"/>
                                                </form>

                                                <form method="post"
                                                      action="project_detail_insert.do?prj_num=${ProjectList1.prj_num}&update=1"
                                                      id="project_detailwriteform" enctype="application/x-www-form-urlencoded"
                                                      class="form-horizontal">
                                                    <div class="col-12 col-md-7 text-gray-900 fa-solid m-2" id='result'>

                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        </c:if>
                            </div>

                            <div class="text-center d-block card-header py-3">
                                <a <%--href="javascript:goSubmit();"--%>  onclick="return chk_form()" class="btn btn-info">
                                                <span class="icon text-white-50">
                                                       <i class="fas fa-pen"></i>
                                                </span>
                                    <c:choose>
                                        <c:when test="${test eq '1'}">
                                            <span OnClick="location.href='javascript:goSubmit();'" class="text" style="color:white">수정</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span OnClick="location.href='javascript:goSubmit();'" class="text" style="color:white">등록</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <script>
                                        function chk_form() {
                                            if( document.getElementById("prj_name").value===''||document.getElementById("cus_num").value===''){
                                                $('#exampleModal').modal('show')
                                            }
                                            else {
                                                <c:choose>
                                                <c:when test="${test eq '1'}">
                                                document.getElementById('projectupdateform').submit();
                                                </c:when>
                                                <c:otherwise>
                                                document.getElementById('projectwriteform').submit();
                                                </c:otherwise>
                                                </c:choose>
                                            }
                                        }
                                        function plselect(num,name,position) {
                                            document.getElementById('cus_name').setAttribute("value", name +'/'+position);
                                            document.getElementById('cus_num').setAttribute("value", num);
                                        }
                                        function memberselect(cell) {
                                            var location = document.getElementById('result');
                                            var select_cus = document.getElementById(cell).value
                                            var input1 = document.createElement('input');
                                            input1.setAttribute("type", "hidden");
                                            input1.setAttribute("value", select_cus);
                                            input1.setAttribute("readonly", "readonly");
                                            input1.setAttribute("style", "border:none");
                                            input1.setAttribute("id", "cus_num");
                                            input1.setAttribute("name", "cus_num");
                                            var input2 = document.createElement('input');
                                            input2.setAttribute("type", "hidden");
                                            input2.setAttribute("value", 0);
                                            input2.setAttribute("id", "auth");
                                            input2.setAttribute("name", "auth");

                                            location.appendChild(document.createElement('br'));
                                            location.appendChild(input1);
                                            location.appendChild(input2);
                                            document.getElementById('project_detailwriteform').submit();
                                        }
                                        function delete_form(cus_num) {
                                            document.getElementById('delete_cus_num').setAttribute("value",cus_num);
                                            document.getElementById('project_detaildeleteform').submit();
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
                                                    필수값 데이터가 작성되지 않았습니다.
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </a>
                                <%--</button>--%>
                                <a href="project.do" class="btn btn-secondary">
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

    <!-- Page level plugins -->
    <script src="<c:url value="/resources/vendor/datatables/jquery.dataTables.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.min.js"/>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value="/resources/js/demo/datatables-demo.js"/>"></script>