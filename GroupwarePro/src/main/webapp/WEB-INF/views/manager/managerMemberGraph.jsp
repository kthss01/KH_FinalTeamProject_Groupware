<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
<title>WeCanvas</title>
<!-- Custom CSS -->
<link
	href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.css"
	rel="stylesheet">
<link
	href="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.css"
	rel="stylesheet">
<link
	href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css"
	rel="stylesheet" />
<link
	href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css"
	rel="stylesheet">

<style>
#boardList li:hover {
	cursor: pointer;
	color: #212529;
}
</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['국내영업부', 1],
          ['마케팅부', 1],
          ['인사관리부', 1],
          ['해외영업1부', 1],
          ['해외영업2부', 1],
          ['회계관리부', 1]
        ]);

        // 차트 옵션 ( 타이틀 , 높이 , 너비 )
        var options = {'title':'부서별 이용자 통계',
        			   'width':600,
                       'height':500};

        // 인스턴스 생성 및 view에 차트 그리기, 옵션 값과 차트에 담을 데이터 값 넘기기 passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
        <%--  liner --%>
        
        function drawDualX() {
            var data = google.visualization.arrayToDataTable([
              ['City', '2010 Population', '2000 Population'],
              ['New York City, NY', 8175000, 8008000],
              ['Los Angeles, CA', 3792000, 3694000],
              ['Chicago, IL', 2695000, 2896000],
              ['Houston, TX', 2099000, 1953000],
              ['Philadelphia, PA', 1526000, 1517000]
            ]);

            var materialOptions = {
              chart: {
                title: 'Population of Largest U.S. Cities',
                subtitle: 'Based on most recent and previous census data'
              },
              hAxis: {
                title: 'Total Population'
              },
              vAxis: {
                title: 'City'
              },
              bars: 'horizontal',
              series: {
                0: {axis: '2010'},
                1: {axis: '2000'}
              },
              axes: {
                x: {
                  2010: {label: '2010 Population (in millions)', side: 'top'},
                  2000: {label: '2000 Population'}
                }
              }
            };
            var materialChart = new google.charts.Bar(document.getElementById('chart_div2'));
            materialChart.draw(data, materialOptions);
          }
        
</script>

</head>
<body>

	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6"
		data-sidebartype="full" data-sidebar-position="fixed"
		data-header-position="fixed" data-boxed-layout="full">
		<jsp:include
			page="${pageCOntext.servletContext.contextPath}/WEB-INF/views/common/m_header.jsp" />
		<jsp:include
			page="${pageCOntext.servletContext.contextPath}/WEB-INF/views/common/m_sidebar.jsp" />



		<div class="container-fuild" style="padding: 81px 0px 0px 265px;">
			<div class="row">
				<div class="col-12">
					<div class="card">

						<div class="card-body">
							<h3
								class="card-title text-truncate text-dark font-weight-bold mb-1">
								시각 정보 </h3>


							<div class="row" style="padding:50px;">
								<div class="col-sm-12">
								
								<ul class="list-style-none">
									
									<li>
										<div class="card chart_div graph" id="chart_div">
								
										</div>
									</li>		
									<li>
										<div class="card chart_div2 graph" id="chart_div2">
											
										</div>
									
									</li>	
											
								
								</ul>

								</div>

							</div>



						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	




	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- apps -->
	<!-- apps -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/app-style-switcher.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/feather.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/custom.min.js"></script>
	<!--This page JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/d3.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/pages/dashboards/dashboard1.min.js"></script>

	<script>
	
	function openCategory(cno){
		console.log(cno);
	}
	
	</script>
</body>
</html>