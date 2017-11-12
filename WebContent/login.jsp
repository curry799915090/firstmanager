<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>物业管理系统_用户登录</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
.STYLE1 {font-size: 12px}
-->
</style></head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="9fc967">&nbsp;</td>
  </tr>
  <tr>
    <td height="604">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="604" background="images/login_02.gif">&nbsp;</td>
        <td width="989">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="345"   >
            	<div style="position:relative; height:345px;">
	                <div style="position:absolute;left:0px;top:0px"><img src="images/login_1.jpg" /></div>
                    <div style="position:absolute;left:480px;top:300px">
                    <form action="userServlet?mark=login" method="post" name="loginInfo">
                       <table width="380" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="25%" height="22"><div align="right"><span class="STYLE1">用户:</span></div></td>
                            <td width="35%" height="22"><div align="left">
                                <input name="uname" type="text" value="" size="15" style="height:20px;border:solid 1px #bbbbbb">
                            </div></td>
                            <td width="40%" height="22">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="22"><div align="right"><span class="STYLE1">密码:</span></div></td>
                            <td height="22"><div align="left">
                                <input name="pwd" type="password"  size="15" style="height:20px; border:solid 1px #bbbbbb">
                            </div></td>
                            <td height="22">
                            	<span class="STYLE1" style="color: red">
                            	 <%=request.getAttribute("msg")==null?"": request.getAttribute("msg")%>
                            	</span> 
                            </td>
                          </tr>
                          <tr>
                            <td height="22"><div align="right"><span class="STYLE1">验证码:</span></div></td>
                            <td height="22">
                            <div align="left">
	                            <div style="float: left">
	                                <input name="textfield2" type="text" size="4" maxlength="4" style="height:20px; border:solid 1px #bbbbbb">&nbsp;
	                            </div>
	                            <div style="float: left;margin-top:3px">
	                                <!-- <img alt="" src="image.jsp" width="43" height="19"> -->
	                                <img id="imgObj" alt="验证码" src="/article/validateCode" onclick="changeImg()"/>  
        							<a href="#" onclick="changeImg()">换一张</a>  
	                            </div>
                            </div></td>
                            <td height="22"><div align="left"  class="STYLE1"> <span class="STYLE1" style="color: red">验证码输入有误！</span></div></td>
                          </tr>
                            <tr>
                            <td height="22">  </td>
                            <td height="22"> <div align="left"><img src="images/dl.gif" width="39" height="18" onclick="formSubmit()" ></div></td>
                            <td height="22"></td>
                          </tr>
                        </table>
                      </form>
                    </div>
                </div>
            	
            </td>
          </tr>
          <tr>
            <td height="47"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="539" height="47" background="images/login_05.gif" nowrap="nowrap">&nbsp;</td>
                <td width="206" background="images/login_06.gif" nowrap="nowrap"></td>
                <td width="244" background="images/login_07.gif" nowrap="nowrap">&nbsp;</td>
              </tr>
            </table>
            
            </td>
          </tr>
          <tr>
            <td height="212" background="images/login_08.gif">&nbsp;</td>
          </tr>
        </table>

        </td>
        <td background="images/login_04.gif">&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td bgcolor="70ad21">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<script>
	/* var uname=$("textfield").value;
	var pwd=$("textfield2").value;
	alert(uname);
	function goMain(){
		alert(uname);
		window.location="userServlet?mark=login&uname="+uname+"&pwd="+pwd;
	} */
	function formSubmit(){
		document.loginInfo.submit();
	}
	// 刷新图片  
    function changeImg() {  
        var imgSrc = $("#imgObj");  
        var src = imgSrc.attr("src");  
        imgSrc.attr("src", changeUrl(src));  
    }  
    //为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳  
    function changeUrl(url) {  
        var timestamp = (new Date()).valueOf();  
        var index = url.indexOf("?",url);  
        if (index > 0) {  
            url = url.substring(0, url.indexOf(url, "?"));  
        }  
        if ((url.indexOf("&") >= 0)) {  
            url = url + "×tamp=" + timestamp;  
        } else {  
            url = url + "?timestamp=" + timestamp;  
        }  
        return url;  
    }  
</script>

