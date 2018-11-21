<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>亿佰商城购物车</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" type="text/css" />
		
		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
			}
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			}
			font {
				color: #3164af;
				font-size: 18px;
				font-weight: normal;
				padding: 0 10px;
			}
		</style>
		
	</head>

	<body>
		<!-- 引入header.jsp -->
		<jsp:include page="/header.jsp"></jsp:include>
		
		<div class="container">
			<div class="row">
				<div style="margin:0 auto; margin-top:10px;width:950px;">
					<strong style="font-size:16px;margin:5px 0;">购物车详情</strong>
					<table class="table table-bordered">
						<tbody>
						
							<tr class="warning">
								<th>图片</th>
								<th>商品</th>
								<th>价格</th>
								<th>数量</th>
								<th>小计</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${cartList }" var="cart">
							<script>
								function del(cart){
									var pid=cart;
									alert(pid);
									$.ajax({
										url:"${pageContext.request.contextPath }/servlet/DeleteCart_servlet",
										data:{"pid":pid},
										style:"post",
										dataType:"json",
										success:function(data){
												for(var i=0;i<data.length;i++){
													alert(data[i].pdesc);
													var str="<tr class='active'><td width='60' width='40%'><input type='hidden' name='id' value='22'>"+data[i].pid+"<img src='"+data[i].pimage+"' width='70' height='60'></td><td width='30%'><a target='_blank'>"+data[i].pname+"</a></td><td width='20%'>￥$"+data[i].shop_price+"元</td><td width='10%'>"+data[i].number+"</td><td width='15%'><span class='subtotal'>￥$"+(data[i].shop_price)*(data[i].number)+"元</span></td><td><a href='javascript:;' class='delete' onclick='del("+data[i].pid+")'>删除</a></td></tr>";
													//alert(str);
												}
												$("tbody tr:gt(0)").append(str); 
												//$("#count").html("￥"+data.sum+"元");
												alert("删除成功!");
											},
										error:function(){
											alert(321);
										}
								});
									}
								 function clean(){
									$.ajax({
										url:"${pageContext.request.contextPath }/servlet/DeleteCart_servlet",
										data:{"pid":"0"},
										style:"post",
										dataType:"json",
										success:function(data){
											if(data==""){
												//$("tbody tr").empty();
												//$("#count").html("￥"+data.sum+"元");
												alert("清空成功!");
											}else{
												alert("删除失败,请跟管理员联系!");
											}
										},
										error:function(){
											alert(321);
										}
								});
								} 
							</script>
							
							<tr class="active" >
								<td width="60" width="40%">
									<input type="hidden" name="id" value="22">
									${cart.pid}
									<img src="${cart.pimage }" width="70" height="60">
								</td>
								<td width="30%">
									<a target="_blank">${cart.pname }</a>
								</td>
								<td width="20%">
									￥${cart.shop_price }元
								</td>
								<td width="10%">
									${cart.number }
								</td>
								<td width="15%">
									<span class="subtotal">￥${cart.shop_price*cart.number }元</span>
								</td>
								<td>
									<a href="javascript:;" class="delete" onclick="del(${cart.pid})">删除</a>
								</td>
							</tr>
							
							
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div style="margin-right:130px;">
				<div style="text-align:right;">
			商品金额: <strong style="color:#ff6600;" id="count">￥${sum}元</strong>
				</div>
				<div style="text-align:right;margin-top:10px;margin-bottom:10px;">
					<a href="javascript:;" id="clear" class="clear" onclick="clean()">清空购物车</a>
					<a href="${pageContext.request.contextPath }/servlet/OrderInfo_Servlet">
						<input type="submit" width="100" value="提交订单" name="submit" border="0" style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
						height:35px;width:100px;color:white;">
					</a>
				</div>
			</div>
			
		</div>
		
		<!-- 引入footer.jsp -->
		<jsp:include page="/footer.jsp"></jsp:include>
	
	</body>

</html>