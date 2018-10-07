package utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

public class DateUtil {
	/**
	 * 获取日期时间
	 * 
	 * @return
	 */
	public static String getDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}

	@Test
	public void test() {
		System.out.println(new Date());
	}

	/**
	 * 获取日期
	 * 
	 * @return
	 */
	public static String getDateStr() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return sdf.format(date);
	}

	public static String getMonthStr() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		return sdf.format(date);
	}

	/**
	 * 获取时间
	 * 
	 * @return
	 */
	public static String getTimeStr() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HHmmss");
		return sdf.format(date);
	}

	public static String getTimeName(String filename) {
		int index = filename.lastIndexOf(".");
		String lastname = filename.substring(index, filename.length());

		return getDateStr() + getTimeStr() + lastname;
	}
}
