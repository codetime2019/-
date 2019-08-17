<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> <%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%> 
<html> 
<head>
	<base href="<%=basepath %>" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1" />
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>Bootstrap 101 Template</title>
		<!-- Bootstrap -->
		<link href="/plane/css/bootstrap.min.css" rel="stylesheet">
		<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
		<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
		<!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
		<script src="/plane/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="/plane/js/bootstrap.min.js" type="text/javascript" charset="UTF-8"></script>
	</head>
	<body>
		<div class="container">
			<!-- 搜索行 -->
			<div class="row" style="margin-top:50px">
				<div class="col-md-5">
					<div class="row">
						<div class="col-sm-4 text-left" style="line-height: 30px;">
							选择起始地：
						</div>
						<div class="col-sm-8">
							<select class="form-control selectD D1">
								<option value="0">请选择</option>
							</select>
						</div>
					</div>
				</div>

				<div class="col-md-5">
					<div class="row">
						<div class="col-sm-4 text-left" style="line-height: 30px;">
							选择到达地：
						</div>
						<div class="col-sm-8">
							<select class="form-control selectD D2">
								<option value="0">请选择</option>
							</select>
						</div>
					</div>
				</div>

				<div class="col-md-2">
					<button type="button" id="search" class="btn btn-default col-sm-12">搜索</button>
				</div>
			</div>
			<!-- 数据表格 -->
			<div class="row" style="margin-top:50px">
				<div class="col-md-12 tableCon">
					<table class="table table-bordered table-hover table01">
						<tr>
							<th>飞机编号</th>
							<th>起飞机场</th>
							<th>起飞城市</th>
							<th>降落机场</th>
							<th>降落城市</th>
							<th>航行时间</th>
							<th>票价（元）</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		$(function() {

			setOption();

			setTableData(0,0);
			
			$("#search").click(function() {

				var startValue = $('.D1 option:selected').val(); //选中的值

				var stopValue = $('.D2 option:selected').val(); //选中的值
				
				if(startValue==stopValue){
					alert("到达地与起始地不能相同，请重新选择");
					return;
				}
				
				setTableData(startValue,stopValue);
				
			});
		});

		// 设置下拉框
		function setOption() {

			var list = [10];

			$.ajax({
				'url': 'http://localhost:8080/plane/airport',
				'dataType': 'json',
				'type': 'get',
				'success': function(data) {

					var num = 0;

					for (var i = 0; i < data.length; i++) {

						var b1 = true;

						var address = data[i].address;

						for (j = 0; j < list.length; j++) {

							if (address == list[j]) {
								b1 = false;
								break;
							}

						}

						if (b1 == true) {

							list[num] = address;

							num++;
						}

						if (b1 == true) {

							$(".selectD").append("<option value='" + data[i].id + "' >" + data[i].address + "</option>");

						}



					}

				}
			});

		}

		// 初始化表格数据
		function setTableData(startValue,stopValue) {

			$.ajax({
				'url': 'http://localhost:8080/plane/shuttle?startValue='+startValue+'&stopValue='+stopValue,
				'dataType': 'json',
				'type': 'get',
				'success': function(data) {
					
					if($(".trs").html()!=undefined){
						removeThis($(".trs"));
					}
					
					var head =
						"<tr><th>飞机编号</th><th>起飞机场</th><th>起飞城市</th><th>降落机场</th><th>降落城市</th><th>航行时间</th><th>票价（元）</th></tr>";
						
					//$(".table01").append(head);
					
					
					for (i = 0; i < data.length; i++) {

						$(".table01").append("<tr class='trs' ><td>" + data[i].plane.name + "</td><td>" + data[i].startAir.name + "</td><td>" +
							data[i].startAir.address + "</td>" +
							"<td>" + data[i].stopAir.name + "</td><td>" + data[i].stopAir.address + "</td><td>" + data[i].time +
							"</td><td>" + data[i].price + "</td></tr>");
					}
				}
			});

		}
		
		function removeThis(obj){
			obj.remove();
		}
	</script>
</html>