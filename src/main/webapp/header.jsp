<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.js" type="text/javascript"></script>
<script>
	function overFn(obj){
			$(obj).css("background","#DBEAF9");
						}
	function outFn(obj){
			$(obj).css("background","#fff");
						}
	function clickFn(obj){
			$("#search").val($(obj).html());
			$("#showDiv").css("display","none");
						}
	function searchWord(obj){
		var word = $(obj).val();
		var content="";
			$.ajax({
				url:"${pageContext.request.contextPath }/servlet/Product_nameServlet",
				type:"post",
				data:{"word":word},
				dataType:"json",
				success:function(data){
					if(data.length>0){
						for(var i=0;i<data.length;i++){
							content+="<div style='padding:5px;cursor:pointer' onclick='clickFn(this)' onmouseover='overFn(this)' onmouseout='outFn(this)'>"+data[i]+"</div>";
						}
					$("#showDiv").html(content);
					$("#showDiv").css("display","block");
					};
			},
			error:function(){},
		});
	}
</script>
<!-- 登录 注册 购物车... -->
<div class="container-fluid">
	<div class="col-md-4">
		<img src="${pageContext.request.contextPath }/img/11.jpg" />
	</div>
	<div class="col-md-5">
		<img src="${pageContext.request.contextPath }/img/header.png" />
	</div>
	<div class="col-md-3" style="padding-top:20px">
		<ol class="list-inline">
			<!-- 用户没有登录 -->
			<%--<c:if test="${empty user}">--%>
				<%--<li><a href="${pageContext.request.contextPath }/login.jsp">登录</a></li>--%>
				<%--<li><a href="${pageContext.request.contextPath }/register.jsp">注册</a></li>--%>
			<%--</c:if>--%>
			<%--<!-- 用户已经登录 -->--%>
			<%--<c:if test="${!empty user}">--%>
				<%--<li>欢迎您登录,${user.loginName}</li>--%>
				<%--<li><a href="${pageContext.request.contextPath }/servlet/UserLoginname_servlet?doWhat=loginOut">注销</a></li>--%>
			<%--<li ><a href="${pageContext.request.contextPath }/servlet/ShowCart_servlet">购物车</a></li>--%>
			<%--<li><a href="${pageContext.request.contextPath }/servlet/OrderSave_servlet">我的订单</a></li>--%>
			<%--</c:if>--%>
		</ol>
	</div>
</div>

<!-- 导航条 -->
<div class="container-fluid">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath }/YIBAI">首页</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">  <%-- ${pageContext.request.contextPath }/servlet/Product_listServlet?cid=1 --%>
					<li class="active"><a href="${pageContext.request.contextPath }/servlet/Product_listServlet?cid=1">手机数码<span class="sr-only">(current)</span></a></li>
					<li class="active"><a href="${pageContext.request.contextPath }/servlet/Product_listServlet?cid=2">电脑办公<span class="sr-only">(current)</span></a></li>
					<li class="active"><a href="${pageContext.request.contextPath }/servlet/Product_listServlet?cid=3">家具家居<span class="sr-only">(current)</span></a></li>
					<li class="active"><a href="${pageContext.request.contextPath }/servlet/Product_listServlet?cid=4">鞋靴箱包<span class="sr-only">(current)</span></a></li>
				</ul>
				<form  action="${pageContext.request.contextPath }/servlet/Product_listServlet?cid=5" method="post" class="navbar-form navbar-right" onsubmit="search()" role="search">
					<div class="form-group">
						<input  name="search"id="search" type="text" class="form-control" placeholder="请输入想要搜索的商品" onkeyup="searchWord(this)">
						
						<div id="showDiv" style="display:none; position:absolute;z-index:1000;background:#fff; width:199px;border:1px solid #ccc;">
							
						</div>
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
			</div>
		</div>
	</nav>
</div>