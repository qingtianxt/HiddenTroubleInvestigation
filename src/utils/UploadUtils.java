package utils;

import java.util.UUID;

public class UploadUtils {
	
	/**
	 * �����ļ������ƣ�����Ψһ������
	 * @param filename
	 * @return
	 */
	public static String getUUIDName(String filename){
		//�Ȳ���
		int index = filename.lastIndexOf(".");
		//��ȡ
		String lastname = filename.substring(index,filename.length());
		//Ψһ�ַ�����
		String uuid = UUID.randomUUID().toString().replace("-", "");
		
		return uuid+lastname;
	}
	public static void main(String[] args) {
		String filename="girl.jpg";
		String uuidName = getUUIDName(filename);
		System.out.println(uuidName);
	}
}
