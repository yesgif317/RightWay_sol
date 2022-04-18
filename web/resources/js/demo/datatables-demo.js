// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable();
});


//체크박스 전체선택
function checkSelectAll()  {
  // 전체 체크박스
  const checkboxes
      = document.querySelectorAll('input[name="checkbox"]');
  // 선택된 체크박스
  const checked
      = document.querySelectorAll('input[name="checkbox"]:checked');
  // select all 체크박스
  const selectAll
      = document.querySelector('input[name="selectall"]');

  if(checkboxes.length === checked.length)  {
    selectAll.checked = true;
  }else {
    selectAll.checked = false;
  }

}

function selectAll(selectAll)  {
  const checkboxes
      = document.getElementsByName("checkbox");

  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}

var table = $('#dataTable').DataTable({
  "language": {
    "emptyTable": "데이터가 없어요.",
    "lengthMenu": "페이지당 _MENU_ 개씩 보기",
    "info": "현재 _START_ - _END_ / _TOTAL_건",
    "infoEmpty": "데이터 없음",
    "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
    "search": "검색: ",
    "zeroRecords": "일치하는 데이터가 없어요.",
    "loadingRecords": "로딩중.",
    "processing":     "잠시만 기다려 주세요.",
    "paginate": {
      "next": "다음",
      "previous": "이전"
    }
  },
});