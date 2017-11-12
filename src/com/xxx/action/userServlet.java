package com.xxx.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xxx.dao.UserDao;
import com.xxx.util.PageUtil;
import com.xxx.util.dataDao;
import com.xxx.vo.User;

/**
 * Servlet implementation class userServletm
 */
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao=new UserDao();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public userServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String mark=request.getParameter("mark");
		if("login".equals(mark)){
			userLogin(request,response);
		}else if("queryUser".equals(mark)){
			queryUser(request,response);
		}else if("updatePwd".equals(mark)){
			updatePwd(request,response);
		}else if("valiUname".equals(mark)){
			valiUname(request,response);
		}else if("addUser".equals(mark)){
			addUser(request,response);
		}else if("delUser".equals(mark)){
			delUser(request,response);
		}else if("updateUser".equals(mark)){
			updateUser(request,response);
		}else if("exit".equals(mark)){
			exit(request,response);
		}else if("queryTname".equals(mark)){
			queryTname(request,response);
		}
	}
	
	public void userLogin(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//获取表单参数
		String uname=request.getParameter("uname");
		String pwd =request.getParameter("pwd");
		
		if(uname.isEmpty()||pwd.isEmpty()){
			request.setAttribute("msg", "用户名和密码不能为空");
			request.getRequestDispatcher("login.jsp").forward(request,response);
		}else{
			
			boolean result=userDao.queryPwd(uname,pwd);
			if(!result){
				request.setAttribute("msg", "用户名密码错误");
				request.getRequestDispatcher("login.jsp").forward(request,response);
			}else{
				ServletContext context=this.getServletContext();
				context.setAttribute("userName", uname);
				request.getRequestDispatcher("main.jsp").forward(request, response);
			}
		}
	}
	public void queryUser(HttpServletRequest request,HttpServletResponse response){
		//获取当前页数
		int curPage=request.getParameter("curPage")==null?1:Integer.parseInt(request.getParameter("curPage"));
		//获取用户数量
		int count=userDao.queryCount();
		//获取PageUtil工具对象
		PageUtil page=new PageUtil(curPage, count);
		List<User> userList=userDao.queryUser(page.getStartRow(),page.getPageRow());
		request.setAttribute("userList", userList);
		request.setAttribute("page", page);
		try {
			request.getRequestDispatcher("tab/userTab.jsp").forward(request, response);
			return;
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void updatePwd(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//获取表单参数
		int id=Integer.parseInt(request.getParameter("id"));
		String pwd=request.getParameter("pwd");
		userDao.updatePwd(id,pwd);
		request.setAttribute("update", "修改成功");
		queryUser(request,response);
	}
	public void valiUname(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//获取表单参数
		String uname=request.getParameter("uname");
		boolean result=userDao.valiUname(uname);
		PrintWriter pw=response.getWriter();
		if(uname.isEmpty()){
			pw.write("账号不能为空");
		}else{
			if(!result){
				pw.write("恭喜，该账号可以注册");
			}else{
				pw.write("此账号已被注册");
			}
		}
		pw.close();
	}
	public void addUser(HttpServletRequest request,HttpServletResponse response){
		//获取表单参数
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		String phone=request.getParameter("phone");
		String mail=request.getParameter("mail");
		userDao.addUser(uname,pwd,phone,mail);
	}
	public void delUser(HttpServletRequest request,HttpServletResponse response){
		int id=Integer.parseInt(request.getParameter("userId"));
		userDao.delUser(id);
		queryUser(request,response);
	}
	public void updateUser(HttpServletRequest request,HttpServletResponse response){
		int id=Integer.parseInt(request.getParameter("id"));
		String uname=request.getParameter("uname");
		String phone=request.getParameter("phone");
		String mail=request.getParameter("mail");
		userDao.updateUser(id,uname,phone,mail);
		queryUser(request,response);
	}
	public void exit(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.getSession().invalidate();
        String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() + request.getContextPath() + "/login.jsp";
		System.out.println(url);
		response.getWriter().write("<script>window.open('login.jsp','');</script>");
		return;
	}
	public void queryTname(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		List<String> tnameList=dataDao.getAllTable();
		request.setAttribute("tnameList", tnameList);
		request.getRequestDispatcher("tab/backup.jsp").forward(request, response);
	}
}
