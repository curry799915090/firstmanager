package com.xxx.dao;

import java.util.List;

import com.xxx.util.BaseDao;
import com.xxx.vo.User;

public class UserDao {

	//验证用户名是否存在
	public boolean valiUname(String uname){

		String sql="select * from user where uname=?";
		return BaseDao.queryPos(sql, User.class, uname).size()>0?true:false;
	}
	//通过用户名获取正确的密码
	public boolean queryPwd(String uname,String pwd){
		String sql="select uname,pwd from user where uname=? and pwd=?";
		return BaseDao.queryPos(sql, User.class, uname,pwd).size()>0?true:false;
	}
	//查询所有用户
	public List<User> queryUser(int startRow,int pageRow){
		
		String sql="select id,uname,phone,mail from user limit ?,?";
		
		return BaseDao.queryPos(sql, User.class,startRow,pageRow);
	}
	public void updatePwd(int id,String pwd){
		String sql="update user set pwd=? where id=?";
		BaseDao.changePos(sql, pwd,id);
	}
	public void addUser(String uname,String pwd,String phone,String mail){
		String sql="insert into user(uname,pwd,phone,mail) values(?,?,?,?)";
		BaseDao.changePos(sql,uname,pwd,phone,mail);
	}
	public void delUser(int id){
		String sql="delete from user where id=?";
		BaseDao.changePos(sql, id);
	}
	public void updateUser(int id,String uname,String phone,String mail){
		String sql="update user set uname=?,phone=?,mail=? where id=?";
		BaseDao.changePos(sql, uname,phone,mail,id);
	}
	public int  queryCount(){
		String sql="select * from user ";
		return BaseDao.queryPos(sql,User.class).size();
	}
}
