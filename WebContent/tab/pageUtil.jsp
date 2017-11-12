<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String url=request.getParameter("url");
	if(url.indexOf("?")!=-1){
		url+="&";
	}else{
		url+="?";
	}
	pageContext.setAttribute("url", url);
%>
<c:if test="${page.curPage!=page.firstPage }">
	<a href="${url }curPage=${page.firstPage }">首页</a>
	<a href="${url }curPage=${page.prePage }">上一页</a>
</c:if>
<c:forEach begin="${page.startNav}" end="${page.endNav }" var="i">
	<c:choose>
		<c:when test="${i==page.curPage}">
			<font color="red">${i }</font>
		</c:when>
		<c:otherwise>
			<a href="${url }curPage=${i }">${i }</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${page.curPage!=page.lastPage }">
	<a href="${url }curPage=${page.nextPage }">下一页</a>
	<a href="${url }curPage=${page.lastPage }">尾页</a>
</c:if>	