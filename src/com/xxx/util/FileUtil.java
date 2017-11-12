package com.xxx.util;

import java.io.File;

public class FileUtil {

	public static void main(String[] args) {
		deleteDirectory("E:/learn/新建文件夹");
	}
	public static boolean deleteFile(String filePath){
		boolean flag=false;
		File file=new File(filePath);
		if(file.exists()&&file.isFile()){
			flag = file.delete();
			
		}
		return flag;
	}
	public static boolean deleteDirectory(String dirPath){
		boolean flag=false;
//		if(!dirPath.endsWith(File.separator)){
//			dirPath = dirPath+File.separator;
//		}
		File dirFile = new File(dirPath);
		if(dirFile.exists()&&dirFile.isDirectory()){
			File[] fileArr = dirFile.listFiles();
			for(int i=0;i<fileArr.length;i++){
				if(fileArr[i].isFile()){
					flag=deleteFile(fileArr[i].getAbsolutePath());
					System.out.println(fileArr[i].getAbsolutePath());
					if(!flag){
						return false;
					}
					//System.out.println(fileArr[i].getAbsolutePath());
				}else{
					flag = deleteDirectory(fileArr[i].getAbsolutePath());
					if(!flag){
						return false;
					}
					System.out.println("删除目录中。。。");
				}
			}
		}
		if(dirFile.delete()){
			flag=true;
			System.out.println(dirPath+"删除成功");
		}
		return flag;
	}
}
