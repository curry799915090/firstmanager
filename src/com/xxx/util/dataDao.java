package com.xxx.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class dataDao {
	
	public static List<String> getAllTable(){
		List<String> tableList=new ArrayList<String>();
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			conn=DBUtil.getConn();
			String sql="SELECT table_name, table_type, engine FROM information_schema.tables "+
			  "WHERE table_schema = 'management' "+
			  "ORDER BY table_name DESC;";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				String tableName=rs.getString(1);
				tableList.add(tableName);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBUtil.close(rs,ps,conn);
		}
		return tableList;
	}
}
