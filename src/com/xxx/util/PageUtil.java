package com.xxx.util;

public class PageUtil {
	//当前页
	private int curPage;
	//总条数
	private int count;
	//每页显示条数
	private int pageRow=10;
	//总导航数
	private int navCount;
	//起始行
	private int startRow;
	//首页
	private int firstPage=1;
	//尾页
	private int lastPage;
	//上一页
	private int prePage;
	//下一页
	private int nextPage;
	//起始导航
	private int startNav;
	//结束导航
	private int endNav;
	
	/**
	 * 
	 * @param curPage  当前页   页面传入
	 * @param count    总条数  从数据库去拿
	 */
	public PageUtil(int curPage,int count){
		this.curPage=curPage;
		this.count=count;
		this.navCount=count%this.pageRow>0?count/this.pageRow+1:count/this.pageRow;				
		this.startRow=(curPage-1)*10;
		this.lastPage=this.navCount;
		this.prePage=curPage>1?curPage-1:this.firstPage;
		this.nextPage=curPage<this.lastPage?curPage+1:this.lastPage;

		if(this.navCount<10){
			this.startNav=this.firstPage;
			this.endNav=this.navCount;
		}else{
			if(curPage<=6){
				this.startNav=this.firstPage;
				this.endNav=10;
			}else if(curPage>=this.lastPage-4){
				this.startNav=this.navCount-9;
				this.endNav=this.navCount;
			}else{
				this.startNav=curPage-5;
				this.endNav=curPage+4;
			}
		}
	}
	
	public int getNavCount() {
		return navCount;
	}
	public void setNavCount(int navCount) {
		this.navCount = navCount;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageRow() {
		return pageRow;
	}
	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getPrePage() {
		return prePage;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getStartNav() {
		return startNav;
	}
	public void setStartNav(int startNav) {
		this.startNav = startNav;
	}
	public int getEndNav() {
		return endNav;
	}
	public void setEndNav(int endNav) {
		this.endNav = endNav;
	}
	
	
}
