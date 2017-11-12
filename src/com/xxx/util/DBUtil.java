package com.xxx.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtil {

	private static String driver;
	private static String url;
	private static String username;
	private static String password;
	static {
		try {
			Properties properties=new Properties();
			properties.load(DBUtil.class.getResourceAsStream("/db.properties"));
			driver=properties.getProperty("driver");
			url=properties.getProperty("url");
			username=properties.getProperty("uname");
			password=properties.getProperty("pwd");
			Class.forName(driver);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public static void close(Object...params){
		if(params!=null&&params.length>0){
			for(Object param:params){
				try {
					if(param instanceof Connection){
						((Connection)param).close();
					}else if(param instanceof PreparedStatement){
						((PreparedStatement)param).close();
					}else if(param instanceof ResultSet){
						((ResultSet)param).close();
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
	}
	public static Connection getConn(){
		try {
			return DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
