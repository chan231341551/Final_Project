<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/charts-chartjs.html" />


<main class="content" style="padding-top:0px;">

	<div class="container-fluid p-0">

<!-- 	<link href="css/app.css" rel="stylesheet"> -->
		<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<div class="d-flex flex-row ">
							<h3 id="projectTitle" ></h3>
							
							
						</div>
						<hr>
						<div class="d-flex flex-column justify-content-between">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb" style="margin:0px;">
									<li class="breadcrumb-item"><a href="#">프로젝트 홈</a></li>
									<li class="breadcrumb-item active">대시보드</li>
								</ol>
							</nav>
							<div role="tablist" class="d-flex flex-row justify-content-end">
								<!-- <button class="btn btn-secondary" data-bs-toggle="tab" href="#tab-1" aria-selected="false" role="tab" tabindex="-1" style="margin-right:1rem;">작업 목록</button> -->
								<!-- <button class="btn btn-primary" data-bs-toggle="tab" href="#tab-2" aria-selected="false" role="tab" tabindex="-1">작업 추가</button> -->
								<button class="btn btn-primary projectWorkInsertBtn" data-bs-toggle="modal" data-bs-target="#projectWorkInsertModal" data-work-no="\${data.workNo}" style="margin-right:1rem;" hidden>작업 추가</button>
								<div class="btn btn-primary" style="margin-right:1rem;">프로젝트 기간</div>
								<div id="projectDate" class="btn btn-secondary"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">

			
			
				<div class="container-fluid p-0">

					<div class="row">
						<div class="col-12 col-lg-6">
							<div class="card flex-fill w-100">
								<div class="card-header">
									<h5 class="card-title">프로젝트 통계</h5>
									<h6 class="card-subtitle text-muted">프로젝트 모듈,게시판 데이터</h6>
								</div>
								<div class="card-body">
									<div class="chart">
										<canvas id="chartjs-line"></canvas>
									</div>
								</div>
							</div>
						</div>

						<div class="col-12 col-lg-6">
							<div class="card">
								<div class="card-header">
									<h5 class="card-title">프로젝트 이슈 발생도</h5>
									<h6 class="card-subtitle text-muted"></h6>
								</div>
								<div class="card-body">
									<div class="chart">
										<canvas id="chartjs-bar"></canvas>
									</div>
								</div>
							</div>
						</div>

						<div class="col-12 col-lg-6">
							<div class="card">
								<div class="card-header">
									<h5 class="card-title">프로젝트 비교</h5>
									<h6 class="card-subtitle text-muted"></h6>
								</div>
								<div class="card-body">
									<div class="chart chart-sm">
										<canvas id="chartjs-doughnut"></canvas>
									</div>
								</div>
							</div>
						</div>

						<div class="col-12 col-lg-6">
							<div class="card">
								<div class="card-header">
									<h5 class="card-title">프로젝트 접속 현황</h5>
									<h6 class="card-subtitle text-muted"></h6>
								</div>
								<div class="card-body">
									<div class="chart chart-sm">
										<canvas id="chartjs-pie"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				
				<div class="card">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>회원정보</th>
								<th>이메일</th>
								<th>역할</th>
								<th>이슈</th>
								<th>작업</th>
								<th>위키</th>
								<th>뉴스</th>
								<th>채팅방</th>
								<th>게시판</th>
							</tr>
						</thead>
						<tbody id="memDashList">
							
						</tbody>
					</table>
				</div>

				
			</div>
		</div>
	</div>
</main>

	<script src="js/app.js"></script>
	
	<script>
		function memListTrTag(data){
			console.log("data : ",data);
			if(data.PRO_ROLE_CD != null){
				if(data.PRO_ROLE_CD == 'PR001'){
					data.PRO_ROLE_CD = '관리자';
				}
				if(data.PRO_ROLE_CD == 'PR002'){
					data.PRO_ROLE_CD = '팀장';
				}
				if(data.PRO_ROLE_CD == 'PR003'){
					data.PRO_ROLE_CD = '팀원';
				}
			}
			
			
			
			let imgTag = `
				<td>
					<img src=\${data.ATT_SAVENAME} 
						width="48" 
						height="48" 
						class="rounded-circle me-2"
					>
					<span>\${data.MEM_NAME}</span>
				</td>
			
			`
			return $("<tr>").append(
				$("<td>").append(imgTag),
				$("<td>").html(data.MEM_EMAIL),
				$("<td>").html(data.PRO_ROLE_CD),
				$("<td>").html(data.ISSCOUNT),
				$("<td>").html(data.WORKCOUNT),
				$("<td>").html(data.WIKICOUNT),
				$("<td>").html(data.NEWSCOUNT),
				$("<td>").html(data.CHATROOMCOUNT),
				$("<td>").html(data.BOARDCOUNT)
			)
		}
		
		$(document).ready(function(){
			getGraphLine();
		})
		
		function getGraphLine(){
			let projDataList = [];
			let proCode = "${project.proCode}";
			console.log("proCode : ",proCode);
			$.ajax({
				url : "${pageContext.request.contextPath }/pms/dashBoard/"+proCode,
				method : "get",
				dataType : "json",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				success : function(resp) {
					console.log("resp : ",resp);
					let data = resp.project;
					$("#projectTitle").html(data.PRO_TITLE);
					$("#projectDate").html(data.PRO_SDATE+"~"+data.PRO_EDATE);
					new Chart(document.getElementById("chartjs-line"), {
						type: "line"	,
						data: {
							labels: ["게시판", "채팅방", "작업담당자", "칸반", "멤버", "뉴스", "위키", "작업"],
							datasets: [{
								label: "Sales ($)",
								fill: true,
								backgroundColor: "transparent",
								borderColor: window.theme.primary,
								data: [
									data.BOARDCOUNT, 
									data.CHATROOMCOUNT, 
									data.WORKCOUNT, 
									data.WORKCOUNT, 
									data.MEMCOUNT, 
									data.NEWSCOUNT, 
									data.WIKICOUNT, 
									data.WORKCOUNT
									]
							}, ]
						},
						options: {
							maintainAspectRatio: false,
							legend: {
								display: false
							},
							tooltips: {
								intersect: false
							},
							hover: {
								intersect: true
							},
							plugins: {
								filler: {
									propagate: false
								}
							},
							scales: {
								xAxes: [{
									reverse: true,
									gridLines: {
										color: "rgba(0,0,0,0.05)"
									}
								}],
								yAxes: [{
									ticks: {
										stepSize: 50
									},
									display: true,
									borderDash: [5, 5],
									gridLines: {
										color: "rgba(0,0,0,0)",
										fontColor: "#fff"
									}
								}]
							}
						}
					});
					
					new Chart(document.getElementById("chartjs-bar"), {
						type: "bar",
						data: {
							labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
							datasets: [{
								label: "Last year",
								backgroundColor: window.theme.primary,
								borderColor: window.theme.primary,
								hoverBackgroundColor: window.theme.primary,
								hoverBorderColor: window.theme.primary,
								data: [16, 4, 12, 4, 35, 21, 14, 21, 5, 2, 4, 6],
								barPercentage: .75,
								categoryPercentage: .5
							} ]
						},
						options: {
							maintainAspectRatio: false,
							legend: {
								display: false
							},
							scales: {
								yAxes: [{
									gridLines: {
										display: false
									},
									stacked: false,
									ticks: {
										stepSize: 20
									}
								}],
								xAxes: [{
									stacked: false,
									gridLines: {
										color: "transparent"
									}
								}]
							}
						}
					});
					
					let memList = [];
					$.each(resp.members,function(i,v){
						memList.push(memListTrTag(v));
					})
					$("#memDashList").html(memList);
					
					
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
		}
		
		
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Radar chart
			new Chart(document.getElementById("chartjs-doughnut"), {
				type: "radar",
				data: {
					labels: ["작업속도", "진행률", "이슈", "접속수", "채팅"],
					datasets: [{
						label: "어제",
						backgroundColor: "rgba(0, 123, 255, 0.2)",
						borderColor: window.theme.primary,
						pointBackgroundColor: window.theme.primary,
						pointBorderColor: "#fff",
						pointHoverBackgroundColor: "#fff",
						pointHoverBorderColor: window.theme.primary,
						data: [45, 12, 12, 1, 33]
					}, {
						label: "오늘",
						backgroundColor: "rgba(220, 53, 69, 0.2)",
						borderColor: window.theme.danger,
						pointBackgroundColor: window.theme.danger,
						pointBorderColor: "#fff",
						pointHoverBackgroundColor: "#fff",
						pointHoverBorderColor: window.theme.danger,
						data: [35, 38, 24, 3, 84]
					}]
				},
				options: {
					maintainAspectRatio: false
				}
			});
			
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Doughnut chart
			
			
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Pie chart
			new Chart(document.getElementById("chartjs-pie"), {
				type: "pie",
				data: {
					labels: ["Social", "Search Engines", "Direct", "Other"],
					datasets: [{
						data: [, 125, 54, 146],
						backgroundColor: [
							window.theme.primary,
							window.theme.warning,
							window.theme.danger,
							"#dee2e6"
						],
						borderColor: "transparent"
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					}
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Polar Area chart
			new Chart(document.getElementById("chartjs-polar-area"), {
				type: "polarArea",
				data: {
					labels: ["Speed", "Reliability", "Comfort", "Safety", "Efficiency"],
					datasets: [{
						label: "Model S",
						data: [35, 38, 65, 70, 24],
						backgroundColor: [
							window.theme.primary,
							window.theme.success,
							window.theme.danger,
							window.theme.warning,
							window.theme.info
						]
					}]
				},
				options: {
					maintainAspectRatio: false
				}
			});
		});
	</script>

