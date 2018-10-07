package utils;

import java.util.UUID;

public class UploadUtils {
	
	/**
	 * 传入文件的名称，返回唯一的名称
	 * @param filename
	 * @return
	 */
	public static String getUUIDName(String filename){
		//先查找
		int index = filename.lastIndexOf(".");
		//截取
		String lastname = filename.substring(index,filename.length());
		//唯一字符串，
		String uuid = UUID.randomUUID().toString().replace("-", "");
		
		return uuid+lastname;
	}
	public static void main(String[] args) {
		String filename="girl.jpg";
		String uuidName = getUUIDName(filename);
		System.out.println(uuidName);
	}
}
