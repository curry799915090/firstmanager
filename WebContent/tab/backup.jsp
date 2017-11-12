<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
    <table border="1" width="100%">

       <tr>
				<th width=34px><input type="checkbox" onclick="choose(this.checked)" id="ch" /></th>
				<th width="32%">物业管理相关 数据表</th>
				<td width="20%">&nbsp;</td>
				<th style="width:30px" width=34px><input type="checkbox" onclick="chooseR(this.checked)"/></th>
				<th width="39%">预备份数报表</th>
			</tr>
        <tr>
            <td valign="top" colspan="2">
                <table border="1" width="100%" id="leftTab">
                <c:forEach items="${tnameList }" var="tname">
                     <tr  align="center">
                     	<td style="text-align:center " width=30px></td>
                        <td style="text-align:center " width=30px><input type="checkbox"  name="leftTabCb"/></td>
                        <td style="text-align:left">${tname }</td>
                    </tr> 
                </c:forEach>
                </table>
            </td>
            <td >
                <table width="100%">
                    <tr>
                    	<td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center"><input type="button" value="加入>>" onclick="moveToRight()" /></td> 
                    </tr>
                    <tr>
                        <td align="center"><input type="button" value="<<移除" onclick="moveToLeft()"/></td>
                    </tr>
                    <tr>
                        <td >&nbsp;</td>
                    </tr>
                </table>
            </td>
            <td valign="top" colspan="2">
                <table border="1" width="100%" id="rightTab">
                    <tr>备份数据名：
                    	<input type="text"/><input type="button" value="备份" onclick="location='DBRServlet?mark=backup'"/>
                    </tr>
                    <!-- <tr id="tr2" align="center">
                        <td><input type="checkbox" id="c2"  name="rightCb" /></td>
                        <td  align="center" > </td>
                        <td align="center" > </td>
                    </tr> -->
                </table>

            </td>
        </tr>
    </table>

</body>
</html>
<script src="tab/util.js"></script>
<script>
   	// var leftTab1=getFirstChild(getFirstChild($("#leftTab")));
    var leftTab=$("#leftTab");
  
	//var leftTab1=$("#leftTab");
    var rightTab=$("#rightTab");
    function choose(result){
        var leftCbs=$("leftTabCb");
        //alert(leftCbs);
        for(var i=0;i<leftCbs.length;i++){
            leftCbs[i].checked=result;
        }
    }
    function chooseR(result){
        var rightCbs=$("rightTabCb");
        for(var i=0;i<rightCbs.length;i++){
            rightCbs[i].checked=result;
        }
    }
    function moveToLeft(){
        var rightCbs=$("rightTabCb");
        for(var i=0;i<rightCbs.length;i++){
            var val=getNextSibling(rightCbs[i].parentNode).innerHTML;
           
           //var code=getNextSibling(getNextSibling(rightCbs[i].parentNode)).innerHTML;
            //alert(code);
            var delTr=rightCbs[i].parentNode.parentNode;
            rightTab.removeChild(delTr);
            i--;
            var newTr=document.createElement("tr");
            newTr.align="center";
            var chTd=document.createElement("td");
            chTd.width="30px";
            chTd.innerHTML="<input type='checkbox' name='leftTabCb' >";
            var valTd=document.createElement("td");
            valTd.style="text-align:left";
            valTd.innerHTML=val;
            var valTd1=document.createElement("td");
            valTd1.innerHTML=" ";

            newTr.appendChild(valTd1);
            newTr.appendChild(chTd);
            newTr.appendChild(valTd);
            
            getFirstChild(leftTab).appendChild(newTr);
        }
    }
    function moveToRight(){
        var leftCbs=$("leftTabCb"); 
        for(var i=0;i<leftCbs.length;i++){
            if(leftCbs[i].checked){
                //var code=leftCbs[i].value;
                var val=getNextSibling(leftCbs[i].parentNode).innerHTML;
                var delTr=leftCbs[i].parentNode.parentNode;
                //leftTab.parentNode.removeChild(delTr);
                getFirstChild(leftTab).removeChild(delTr);
                i--;
                var newTr=document.createElement("tr");
                newTr.align="center";
                var chTd=document.createElement("td");
                chTd.width="30px";
                chTd.innerHTML="<input type='checkbox' name='rightTabCb'>";
                var codeTd=document.createElement("td");
                codeTd.width="30px";
                codeTd.innerHTML=" ";
                var valTd=document.createElement("td");
               	valTd.style="text-align:left";
                valTd.innerHTML=val;
                newTr.appendChild(codeTd);
                newTr.appendChild(chTd);

                newTr.appendChild(valTd);
                
                rightTab.appendChild(newTr);
            }
        }
    }
    /**
    dom表操作删除的移入的位置应一样  
    	获取值
    	删除行
    	创建行添加到表格
    */
</script>