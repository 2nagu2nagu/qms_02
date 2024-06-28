<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>기안서 조회</title>
<meta content="" name="description">
<meta content="" name="keywords">
<!-- Favicons -->
<link href="/assets/img/favicon.png" rel="icon">
<link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">
<!-- Template Main CSS File -->
<link href="/assets/css/style.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../layout/menu.jsp"%>
	<main id="main" class="main">
		<!-- End Page Title -->
		<!-- Table with hoverable rows -->
		<form id="searchform">
			<input type='hidden' id="currentPage" name="currentPage">
			<input type='hidden' id="docStatus" name="docStatus">
			<div class="card">
				<!-- Bordered Tabs -->
				<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="true" onclick='searchAprv(1,"02");'>결재진행중</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="false" onclick='searchAprv(1,"03");'>결재완료</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#bordered-contact" type="button" role="tab" aria-controls="contact" aria-selected="false" onclick='searchAprv(1,"00");'>나의 기안서</button>
                </li>
              </ul>
				<div class="tab-content pt-2" id="borderedTabContent">
					<div class="tab-pane fade show active" id="bordered-home" aria-labelledby="home-tab">
						<table class="table table-hover" id="homeTable">
						</table>
					</div>
					<div class="tab-pane fade" id="bordered-profile" aria-labelledby="profile-tab">
						<table class="table table-hover" id="profileTable">
						</table>
					</div>
					<div class="tab-pane fade" id="bordered-contact" aria-labelledby="contact-tab">
						<table class="table table-hover" id="contactTable">
						</table>
					</div>
				</div>
				<!-- End Bordered Tabs -->
			</div>
		</form>
		<section class="section"></section>
		<nav aria-label="Page navigation example">
			<ul class="pagination" id="aprvPaging">
			</ul>
		</nav>
	</main>
	<!-- End #main -->
	<!-- ======= Footer ======= -->
	<%@ include file="../layout/footer.jsp"%>
	<script src="/assets/js/common.js"></script>
	<script src="/assets/js/jquery-3.7.1.js"></script>
	<script src="/assets/js/paging.js"></script>
</body>
<script>
	$(document).ready(function() {
		searchAprv(1, "02");
	});

	function searchAprv(pno, sta) { // sta / 02 = 결재진행중 / 03 = 결재완료 / 00 = 나의 기안서
		
		$('#currentPage').val(pno);
		if(sta != null && sta != ''){
			$("#docStatus").val(sta);
		}
		
		call_server(searchform, '/approve/getDocList', getDocList);
	}

	function getDocList(vo) {
		var selecter;
		if( $("#docStatus").val() == "02" ){
			selecter = "#homeTable";
		}else if( $("#docStatus").val() == "03" ){
			selecter = "#profileTable";
		}else{
			selecter = "#contactTable";
		}
		$(selecter).empty();
		list = vo.aprvList;
		

		var strHeader = '<thead>' + '<tr>' + '<th scope="col">No</th>'
				+ '<th scope="col">문서유형</th>' + '<th scope="col">제목</th>'
				+ '<th scope="col">부서</th>' + '<th scope="col">작성자</th>'
				+ '<th scope="col">등록일</th>' + '</tr>' + '</thead>' + '<tbody>'
				+ '</tbody>';
		$(selecter).append(strHeader);

		for (var i = 0; i < list.length; i++) {
			str = "<tr onclick=\"displayModal('" + list[i].itemCd
					+ "');\" style=\"cursor:pointer;\">";
			str += "<th scope=\"row\">"
					+ ((Number(vo.currentPage) - 1) * vo.countPerPage + (i + 1))
					+ "</th>";
			str += "<td>" + list[i].docTypeName + "</td>";
			str += "<td>" + list[i].title + "</td>";
			str += "<td>" + list[i].deptName + "</td>";
			str += "<td>" + list[i].userName + "</td>";
			str += "<td>" + list[i].regDt + "</td>";
			str += "</tr>";
			$(selecter).append(str);
		}
		setPaging(aprvPaging, vo.startPage, vo.endPage, 'searchAprv');
	}
</script>