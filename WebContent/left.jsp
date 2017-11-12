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
-->
</style>


	<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
	<script type="text/javascript" src="js/dtree.js"></script>
	<script type="text/javascript">

		d = new dTree('d');
		d.add(0,-1,'尚学堂物业系统');
		d.add(1,0,'住户管理');
			d.add(2,1,'住户添加','example01.html','住户添加','right');
			d.add(3,1,'住户列表','example01.html','','right');
			d.add(4,1,'学历分析','example01.html','住户添加','right');
			d.add(5,1,'年龄分析','example01.html','','right');
			d.add(6,1,'住户添加upload','example01.html','住户添加','right');
			d.add(7,1,'导出合同','example01.html','','right');
			d.add(8,1,'导出Excel','example01.html','住户添加','right');
			
			
		d.add(9,0,'设备管理');
			d.add(10,9,'设备添加','example01.html','','right');
			d.add(11,9,'设备查询','example01.html','','right');
		d.add(12,0,'房产管理');
			d.add(13,12,'设备添加','example01.html','','right');
			d.add(14,12,'设备添加','example01.html','','right');
		d.add(15,0,'人事管理');
			d.add(16,15,'员工信息','example01.html','','right');
			d.add(17,15,'工资管理','example01.html','','right');
			d.add(18,15,'考核记录','example01.html','','right');
			d.add(19,15,'部门表','example01.html','','right');
		d.add(20,0,'收费管理');
			d.add(21,20,'收费项目','example01.html','','right');
			d.add(22,20,'收费数据查询','example01.html','','right');
			d.add(23,20,'收费人数分析','example01.html','','right');
			d.add(24,20,'收费费用分析','example01.html','','right');
		d.add(25,0,'车辆管理');
			d.add(26,25,'设备添加','example01.html','','right');
			d.add(27,25,'设备添加','example01.html','','right');
		 d.add(28,0,'系统管理');
			 d.add(29,28,'账户添加','tab/addUser.jsp','','right');
			 d.add(30,28,'账号管理','userServlet?mark=queryUser','','right');
		 	 d.add(31,28,'修改密码','userServlet?mark=queryUser','','right');
			 d.add(32,28,'数据库备份','userServlet?mark=queryTname','','right');
			 d.add(33,28,'数据库还原','tab/restore.jsp','','right');
		 

		
		window.onload=function(){
			document.getElementById("menu").innerHTML=d;
		}
	
	</script>
</head>

<body>
<table width="173" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
  <tr>
    <td style="width:4px;" align="center" valign="top" background="images/main_20.gif"></td>
    <td width="169" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="20" background="images/main_11.gif">&nbsp;</td>
      </tr>
      <tr>
        <td> <div id="menu"></div> </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
