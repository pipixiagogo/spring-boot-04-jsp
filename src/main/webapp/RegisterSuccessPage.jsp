<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script src="${pageContext.request.contextPath }/js/jquery-1.12.4.js" type="text/javascript"></script>
    <title>My JSP 'RegisterSuccessPage.jsp' starting page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	window.onload = function(){
		var time = 5;
		var secondEle = document.getElementById("second");
		var timer = setInterval(function(){
			secondEle.innerHTML = time;
			time--;
			if(time==0){
				clearInterval(timer);
				<%--location.href="${pageContext.request.contextPath }/login.jsp";--%>
                location.href="${pageContext.request.contextPath }/YIBAI";
			}
		},1000);
	};
</script>
	

  </head>
  
  <body>
  <jsp:include page="/header.jsp"></jsp:include>
  	<h3 style="text-align:center">恭喜您，注册成功，<span style="color:red" id="second">5</span>秒钟后跳转到登录页面，如不跳转点击<a href="${pageContext.request.contextPath }/YIBAI">这里</a>!</h3>
  	<%--<img src="${pageContext.request.contextPath }/img/1xx.jpg">--%>
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>
