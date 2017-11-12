<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE4 {
	font-size: 12px;
	color: #1F4A65;
	font-weight: bold;
}

a:link {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;

}
a:visited {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;
}
a:hover {
	font-size: 12px;
	color: #FF0000;
	text-decoration: underline;
}
a:active {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}

-->
</style>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
    	  <tr>
	        <td width="15" height="30"><img src="images/tab_03.gif" width="15" height="30" /></td>
	        <td background="images/tab_05.gif">
	        	<img src="images/311.gif" width="16" height="16" /> 
	        	<span class="STYLE4">密码重置</span>
        	</td>
        	<td width="14"><img src="images/tab_07.gif" width="14" height="30" /></td>
     	 </tr>
    	</table>
    </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="images/tab_12.gif">&nbsp;</td>
        <td bgcolor="e5f1d6">
        	<form action="../userServlet?mark=updatePwd" method="post" onsubmit="return valiPwd()">
        		<input type="hidden" name="id" value="${param.userId }"/>
	        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CECECE">
	        	
	       		<tr><td>用户名：</td><td>${param.userName}</td></tr>
	       		<tr><td>重置密码</td><td><input type="password" name="pwd"/></td></tr>
	       		<tr><td>再次输入</td><td><input type="password" onlur="valiPwd(this.value)"/></td><span id="pwdSpan"></span></tr>
	       		<tr><td colspan=2><input type="submit" value="确认"></input></td></tr>
	       </table></form>
	     </td>
        <td width="9" background="images/tab_16.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="29"><img src="images/tab_20.gif" width="15" height="29" /></td>
        <td background="images/tab_21.gif">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	         
	        </table>
        </td>
        <td width="14"><img src="images/tab_22.gif" width="14" height="29" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
<script type="text/javascript">
	var pwd=$("uname").value;
	var _sapn=$("#pwdSpan");
	function valiPwd(value){
		if(pwd==value){
			_span.innerHTML="ok";
			return true;
		}else{
			_span.innerHTML="两次输入不一致";
			return false;
		}
	}
</script>
