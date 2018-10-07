package utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class StringUtil {

	/**
	 * StringתInt
	 * 
	 * @param str
	 * @return
	 */
	public static int StringToInt(String str) {
		int result = 0;
		try {
			result = Integer.parseInt(str);
		} catch (NumberFormatException e) {
			result = 0;
			// e.printStackTrace();
		}
		return result;
	}

	/**
	 * Stringתfloat
	 * 
	 * @param str
	 * @return
	 */
	public static float strToFlo(String str) {
		float i = 0;
		try {
			i = Float.parseFloat(str);
		} catch (Exception e) {
		}
		return i;
	}
	public static void main(String[] args) {
		String a= "100.0";
		System.out.println(strToFlo(a));
	}

	/**
	 * ��ȡ��ֵ������ַ�����
	 * 
	 * @param length
	 * @return
	 */
	public static String getRandomString(int length) {
		String base = "abcdefghijklmnopqrstuvwxyz0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		return sb.toString();
	}

	public static List<String> splitProperties(String properties) {
		List<String> options = new ArrayList<String>();
		String option = null;
		String[] strings = properties.split(",");
		for (String string : strings) {
			if (!"0".equals(string)) {
				option = string.charAt(3) + "";
				options.add(option);

			}
		}
		return options;

	}

	public static String randomStr(int n){
		char[] array = {
				'1','2','3','4','5','6','7','8','9','0',
				'a','s','d','f','g','h','j','k','l','z','x','c','v',
				'b','n','m','q','w','e','r','t','y','u','i','o','p'
				};
		int length = array.length;
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < n; i++){
			sb.append(array[((int)(Math.random()*1000))%length]);
		}
		return sb.toString();
	}
}
