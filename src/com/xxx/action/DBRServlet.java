package com.xxx.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;

import com.xxx.sevice.DataBackupAndRestore;

public class DBRServlet extends HttpServlet{
	DataBackupAndRestore dbrs=new DataBackupAndRestore();
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mark=req.getParameter("mark");
		if("backup".equals(mark)){
			dbrs.backup();
			req.getRequestDispatcher("tab/restore.jsp").forward(req, resp);
		}
	}

	

}
