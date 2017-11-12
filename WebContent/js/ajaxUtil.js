/**
 * 
 * @param method    填get或post
 * @param url       填地址   并且不能加参数    
 * @param params    参数    键=值&键=值
 * @param handle200  数据接收成功之后执行的函数   形参会接收到返回回来的数据
 * @param asyn      false同步  true异步   不写或写错都是默认异步
 */
function ajax(method,url,params,handle200,asyn){
	//处理url缓存问题
	url=url+"?"+new Date().getTime();   
	//如果是get方式的请求，则将参数拼接在地址的后面
	if("get"===method){
		url=url+"&"+params;
	}
	//创建ajax的请求对象
	var request;
	if(window.XMLHttpRequest){
		request=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		//Msxml2.XMLHTTP  IE的ajax引擎的版本编号
		request=new ActiveXObject("Msxml2.XMLHTTP");
	}
	//访问服务器
	if(typeof asyn=="boolean"){
		request.open(method,url,asyn);
	}else{
		request.open(method,url);
	}
	//监听响应状态(只要改变一次状态就会调用重写的函数)
	request.onreadystatechange=function(){
		//获取当前响应状态
		var state=request.readyState;
		//数据接受完成状态 4
		if(state==4){
			//获取服务器的状态码
			var status=request.status;
			if(status==200){
				//获取服务器所响应的数据
				var result=request.responseText;
				if(typeof handle200=="function"){
					handle200(result);
				}
			}
		}
	};
	//给请求绑定参数
	if("get"===method){
		request.send(null);
	}else if("post"===method){
		request.setRequestHeader("content-type","application/x-www-form-urlencoded");
		request.send(params);
	}
}