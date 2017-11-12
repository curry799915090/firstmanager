package com.xxx.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

public class BaseDao {

	public static <T> List<T> queryAll(String sql,Class<T> clazz){
		List<T> list =new ArrayList<T>();
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			conn=DBUtil.getConn();
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ResultSetMetaData rsmd=rs.getMetaData();
			int count = rsmd.getColumnCount();
			while(rs.next()){
				T t=clazz.newInstance();
				for(int i=1;i<count;i++){
					//获取属性名
					String fieldName=rsmd.getColumnTypeName(i);
					//获取属性
					Field field=clazz.getDeclaredField(fieldName);
					Method setter=clazz.getMethod(getSetter(fieldName),field.getType());
					Object value=rs.getObject(fieldName);
					setter.invoke(t, value);
				}
				list.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(rs,ps,conn);
		}
		
		return list;
	}
	private static String getSetter(String fieldName){
		return "set"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
	}
	//支持查询部分字段或全部字段，同时支持带参数查询
	public static <T> List<T> queryPos(String sql,Class<T> clazz,Object...params){
		List<T> list=new ArrayList<T>();
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			conn=DBUtil.getConn();
			ps=conn.prepareStatement(sql);
			if(params!=null&&params.length>0){
				for(int i=0;i<params.length;i++){
					
					ps.setObject(i+1, params[i]);
				}
			}
			rs=ps.executeQuery();
			ResultSetMetaData rsmd=rs.getMetaData();
			int count=rsmd.getColumnCount();
			while(rs.next()){
				T t=clazz.newInstance();
				for(int i=1;i<=count;i++){
					//获取属性名
					String fieldName=rsmd.getColumnName(i);
					//获取属性
					Field field=clazz.getDeclaredField(fieldName);
					//获取设定器
					Method setter=clazz.getMethod(getSetter(fieldName), field.getType());
					//获取该字段的值
					Object value=rs.getObject(fieldName);
					//调用设定器给对象设置值
					setter.invoke(t, value);
				}
			list.add(t);
		
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			DBUtil.close(rs,ps,conn);
		}
		
		return list;
		
	}
	public static void changePos(String sql,Object...params){
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			conn=DBUtil.getConn();
			ps=conn.prepareStatement(sql);
			if(params!=null&&params.length>0){
				for(int i=0;i<params.length;i++){
					
					ps.setObject(i+1, params[i]);
				}
			}
			ps.execute();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			DBUtil.close(ps,conn);
		}
	}

}
