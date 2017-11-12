
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
.STYLE7 {font-size: 12}

-->
</style>

<script>
var  highlightcolor='#d5f4fe';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}


</script>
</head>

<body >
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30">
        	<img src="images/tab_03.gif" width="15" height="30" />
        </td>
        <td background="images/tab_05.gif">
        	<img src="images/311.gif" width="16" height="16" /> 
        	<span class="STYLE4">添加账号</span>
        </td>
        <td width="14"><img src="images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="images/tab_12.gif">&nbsp;</td>
        <td bgcolor="e5f1d6">
        <form action="../userServlet?mark=addUser" method="post" onsubmit="return valiAll(this)">
        	<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CECECE">
	         	 <tr>
	         	 	<td width="6%" height="26" background="images/tab_14.gif" class="STYLE1">
	         	 		<div align="center" class="STYLE2 STYLE1">账号</div>
	         	 	</td>
	         	 	<td><input type="text" name="uname" onblur="valiUname(this.value)" valiType="1" errorMsg="用户名格式错误" reg="/^\w{6,16}$/" nullMsg="用户名不能为空"/><span id="unameSpan"></span></td>
	         	 </tr>
	         	  <tr>
	         	 	<td width="6%" height="26" background="images/tab_14.gif" class="STYLE1">
	         	 		<div align="center" class="STYLE2 STYLE1">密码</div>
	         	 	</td>
	         	 	<td><input type="password" name="pwd" valiType="1" errorMsg="密码格式错误" reg="/^[a-zA-Z0-9]{6,16}$/" nullMsg="密码不能为空"  /><span style="color:red"></span></td>
	         	 </tr>
	         	 <tr>
	         	 	<td width="6%" height="26" background="images/tab_14.gif" class="STYLE1">
	         	 		<div align="center" class="STYLE2 STYLE1">重复密码</div>
	         	 	</td>
	         	 	<td><input type="password" name="repwd" valiType="2" sameName="pwd" errorMsg="两次密码输入不一致" /><span style="color:red"></span>
	         	 </tr>
		      	<tr>
	         	 	<td width="6%" height="26" background="images/tab_14.gif" class="STYLE1">
	         	 		<div align="center" class="STYLE2 STYLE1">电话</div>
	         	 	</td>
	         	 	<td><input type="text" name="phone" onblur="valiPhone(this.value)"/></td>
	         	 </tr>
		     	<tr>
	         	 	<td width="6%" height="26" background="images/tab_14.gif" class="STYLE1">
	         	 		<div align="center" class="STYLE2 STYLE1">邮箱</div>
	         	 	</td>
	         	 	<td><input type="text" name="mail" onblur="valiMail(this.value)"/></td>
	         	 </tr>
		     	<tr>
		     		<td><input type="submit" value="保存"/></td>
		     		<td><input type="reset" value="重置"/></td>
		     	</tr>
		     </table>
		     </form>
        	</td>
        <td width="9" background="images/tab_16.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  
</table>
</body>
</html>
<script src="ajaxUtil.js"></script>
<script src="util.js"></script>
<script type="text/javascript">
var _span=$("#unameSpan");

function valiValue(){
	return valiUname(uname)
}
function valiUname(uname){
	if(uname!=null){
		ajax("get","../userServlet","mark=valiUname&uname="+uname,function(result){
			_span.innerHTML=result;
			if("恭喜，该账号可以注册"===result){
				return true;
			}
		});
		return false;
	}else{
		return false;
	}
}
function valiAll(formObj){
    var eles=formObj.elements;
    for(var i=0;i<eles.length;i++){
    	alert(eles[i]);
        var valiType=eles[i].getAttribute("valiType");
        if(valiType){
            //获取span
            var msgSpan=getNextSibling(eles[i]);
            //获取值
            var val=eles[i].value;
            //获取错误信息
            var errorMsg=eles[i].getAttribute("errorMsg");
            if(valiType==1){
                //获取空的提示信息
                var nullMsg=eles[i].getAttribute("nullMsg");
                //获取正则表达式
                eval("var reg="+eles[i].getAttribute("reg"));
                if(!val){
                    msgSpan.innerHTML=nullMsg;
                    return false;
                }else if(!reg.test(val)){
                    msgSpan.innerHTML=errorMsg;
                    return false;
                }else{
                    msgSpan.innerHTML="";
                }
            }else if(valiType==2){
               //获取比较的值
               var sameName=eles[i].getAttribute("sameName");
               var sameVal=eles[sameName].value;
               if(sameVal!=val){
                   msgSpan.innerHTML=errorMsg;
                   return false;
               }else{
                   msgSpan.innerHTML="";
               }
            }
        }

    }
    return true;
}
</script>
