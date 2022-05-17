<%--
  Created by IntelliJ IDEA.
  User: hate5
  Date: 2020-09-06
  Time: 오후 4:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../include/header.jsp" flush="true"/>
<jsp:include page="../include/sidebar.jsp" flush="true"/>

<script >
    //일주일 전 날짜 구하는 함수
    function lastWeek() {
        var d = new Date();
        var dayOfMonth = d.getDate();
        d.setDate(dayOfMonth - 7);
        return d;
    }
    //한달 전 날짜 구하는 함수
    function lastMonth() {
        var d = new Date();
        var monthOfYear = d.getMonth();
        d.setMonth(monthOfYear - 1);
        return d;
    }
    //일년 전 날짜 구하는 함수
    function lastyear() {
        var d = new Date();
        var yearOfYear = d.getFullYear();
        d.setFullYear(yearOfYear - 1);
        return d;
    }

    //두 날짜 사이의 모든 날짜 배열 만들기 함수.param1은 시작일, param2는 종료일.
    function getDateRangeData(param1, param2){
        var res_day = [];
        var ss_day = new Date(param1);
        var ee_day = new Date(param2);
        while(ss_day.getTime() <= ee_day.getTime()){
            var _mon_ = (ss_day.getMonth()+1);
            _mon_ = _mon_ < 10 ? '0'+_mon_ : _mon_;
            var _day_ = ss_day.getDate();
            _day_ = _day_ < 10 ? '0'+_day_ : _day_;
            res_day.push(ss_day.getFullYear() + '-' + _mon_ + '-' +  _day_);
            ss_day.setDate(ss_day.getDate() + 1);
        }
        return res_day;
    }
    //일주일간의 날짜 배열, 한달간의 날짜 배열 구하기
    let today = new Date();
    week_days=getDateRangeData(lastWeek(), today)
    month_days=getDateRangeData(lastMonth(), today)
    year_days=getDateRangeData(lastyear(), today)
    //위험,이슈 값 배열로 가져오기
    var bardata_risk = [];
    var piedata_risk = [];
    var bardata_issue = [];
    var piedata_issue = [];
    <c:forEach items="${RiskList}" var="risk">
    bardata_risk.push('${risk.risk_reg}');
    piedata_risk.push('${risk.risk_pgs}');
    </c:forEach>
    <c:forEach items="${IssueList}" var="issue">
    bardata_issue.push('${issue.risk_reg}');
    piedata_issue.push('${issue.risk_pgs}');
    </c:forEach>
    // 바차트에 쓸 결과값 만들어주는 함수
    function get_barresult(term,data){
        const count = [];
        for(let i=0; i < term.length; i++) {
            count[i] = 0;
            for(let j=0; j < data.length; j++) {
                if(term[i] == data[j])  {
                    count[i]+=1;
                }
            }
        }
        return count
    }
    // 파이차트에 쓸 결과값 만들어주는 함수
    function get_pieresult(data){
        const count = [];
        label=['대기','진행 중','종료']
        for(let i=0; i < label.length; i++) {
            count[i] = 0;
            for(let j=0; j < data.length; j++) {
                if(label[i] == data[j])  {
                    count[i]+=1;
                }
            }
        }
        return count
    }
    //초기값 저장
    data=bardata_issue
    button1=week_days
    button2=get_barresult(week_days,data);

    // 드롭다운 버튼에 따라 차트 출력해주는 함수
    function get_barchart(barterm,barcount){
        config.data.labels=barterm
        config.data.datasets[0].data=barcount
        return
        }

    //바차트 위험 조회
    function bar_risk(){
        data=bardata_risk
        button2=get_barresult(button1,data);
        get_barchart(button1,button2)
        myBarChart.update()
        const subs = document.getElementById('bar_dropdown');
        subs.innerText = '위험'
    }
    //바차트 이슈 조회
    function bar_issue(){
        data=bardata_issue
        button2=get_barresult(button1,data);
        get_barchart(button1,button2)
        myBarChart.update()
        const subs = document.getElementById('bar_dropdown');
        subs.innerText = '이슈'
    }
    //파이차트 위험 조회
    function pie_risk(){
        config2.data.datasets[0].data=get_pieresult(piedata_risk)
        myPieChart.update()
        const subs = document.getElementById('pie_dropdown');
        subs.innerText = '위험'
    }
    //파이차트 이슈 조회
    function pie_issue(){
        config2.data.datasets[0].data=get_pieresult(piedata_issue)
        myPieChart.update()
        const subs = document.getElementById('pie_dropdown');
        subs.innerText = '이슈'
    }
    //바차트 주간 조회
    function bar_week(){
        button1=week_days
        button2=get_barresult(button1,data);
        get_barchart(button1,button2)
        myBarChart.update()
        const subs = document.getElementById('bar_dropdown1');
        subs.innerText = '주간'
    }
    //바차트 월간 조회
    function bar_month(){
        button1=month_days
        button2=get_barresult(month_days,data)
        get_barchart(button1,button2)
        myBarChart.update()
        const subs = document.getElementById('bar_dropdown1');
        subs.innerText = '월간'
    }
    //바차트 연간 조회
    function bar_year(){
        button1=year_days
        button2=get_barresult(year_days,data)
        get_barchart(button1,button2)
        myBarChart.update()
        const subs = document.getElementById('bar_dropdown1');
        subs.innerText = '연간'
    }


</script>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

        <jsp:include page="../include/topbar.jsp" flush="true"/>

        <!-- Begin Page Content -->
        <div class="container-fluid">
            <!-- Content Row -->

            <div class="row">
                <!-- Earnings (Monthly) Card Example 1-->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-bottom-info shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">프로젝트 인원 수</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">5명</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fa-solid fa-bell text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Pending Requests Card Example 2-->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-bottom-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">프로젝트 D-day
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">D-20</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fa-solid fa-calendar text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Earnings (Monthly) Card Example 3-->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-bottom-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div  class="text-xs font-weight-bold text-warning text-uppercase mb-1">내게 할당된 진행중
                                        이슈/위험
                                    </div>

                                    <div class="h5 mb-0 font-weight-bold text-gray-800">10건</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fa-solid fa-bug text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Earnings (Monthly) Card Example4 -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-bottom-danger shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">긴급 이슈/위험</div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">1건</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fa-solid fa-bolt-lightning text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div class="row">
                <!-- Bar Chart -->
                <div class="col-xl-8 col-lg-7">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-gray-700" <%--onclick="return calldata()"--%>> 이슈/위험 등록 현황

                            <%--<input id="result" value=<%System.out.println(labels[0]);%>/>--%>
                            </h6>
                            <div <%--style="float:left"--%>>
                            <div class="dropdown mb-1  no-arrow" style="float:left">

                                <a class="dropdown-toggle" href="#" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i id="bar_dropdown1" class="fa-solid fa-caret-down text-gray-600"> 주간</i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                     aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-header" id="bar_week" name="bar_issue" onclick="bar_week();">
                                        &nbsp주간</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-header" id="bar_month" name="bar_risk" onclick="bar_month();">
                                        &nbsp월간</a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
                                    </div>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-header" id="bar_year" name="bar_risk" onclick="bar_year();">
                                        &nbsp연간</a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
                                    </div>
                                </div>
                            </div>
                                <div style="float:left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
                            <div class="dropdown mb-1 no-arrow" style="float:left">

                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i id="bar_dropdown" class="fa-solid fa-caret-down text-gray-600"> 이슈</i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                     aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-header" id="bar_issue" name="bar_issue" onclick="bar_issue();"><i
                                        class="fa-solid fa-bug text-gray-600">&nbsp이슈</i> </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-header" id="bar_risk" name="bar_risk" onclick="bar_risk();">
                                    <i class="fa-solid fa-explosion text-gray-600">&nbsp위험</i></a>
                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                     aria-labelledby="dropdownMenuLink">
                                </div>
                                </div>
                            </div>
                            </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-bar">
                                <canvas id="myBarChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pie Chart -->
                <div class="col-xl-4 col-lg-5">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-gray-700">전체 이슈/위험</h6>
                            <div class="dropdown no-arrow" style="float:left">
                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink1"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i id="pie_dropdown" class="fa-solid fa-caret-down text-gray-600"> 이슈</i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                     aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-header" onclick="pie_issue();"><i
                                            class="fa-solid fa-bug text-gray-600">&nbsp이슈</i> </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-header" onclick="pie_risk();"><i class="fa-solid fa-explosion text-gray-600">&nbsp위험</i></a>
                                </div>
                            </div>


                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-pie pt-4 pb-2">
                                <canvas id="myPieChart"></canvas>
                            </div>
                            <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-secondary"> 대기</i>
                    </span>
                                <span class="mr-2">
                      <i class="fas fa-circle text-warning"> 처리 중</i>
                    </span>
                                <span class="mr-2">
                      <i class="fas fa-circle text-success"> 완료</i>
                    </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content Row -->
            <div class="row">

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-4 col-md-6 mb-4">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">최근 공지사항</div>
                    <div class="card border-left-primary">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <c:forEach items="${NormalList}" var="post" step="1" begin="0" end="4">
                                        <a class="dropdown-item-text h5 mb-0 font-weight-bold text-gray-800" href="#">- ${post.nor_tit}</a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-4 col-md-6 mb-4">
                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">내 게시물에 달린 댓글</div>
                    <div class="card border-left-success">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">-</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">-</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">-</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">-</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">-</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-4 col-md-6 mb-4">
                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">다가오는 일정</div>
                    <div class="card border-left-info">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">-</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">-</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">-</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">-</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">-</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- End of Main Content -->
    <jsp:include page="../include/footer.jsp" flush="true"/>
</div>
<!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->


<jsp:include page="../include/logoutModal.jsp" flush="true"/>

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
<script src="<c:url value="/resources/js/demo/chart-pie-demo.js"/>"></script>
<script src="<c:url value="/resources/js/demo/chart-bar-demo.js"/>"></script>