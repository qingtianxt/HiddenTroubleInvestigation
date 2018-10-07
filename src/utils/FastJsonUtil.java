package utils;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

public class FastJsonUtil {
	
	/**
	 * ������ת��json��
	 * @param object
	 * @return
	 */
	public static String toJSONString(Object object){
		//DisableCircularReferenceDetect����ֹѭ�����ü��
		return JSON.toJSONString(object,SerializerFeature.DisableCircularReferenceDetect);
	}
	//���json
	public static void write_json(HttpServletResponse response,String jsonString)
	{
		response.setContentType("text/json;utf-8");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(jsonString);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	/**
	 * ajax�ύ��ص���json�ַ���
	 * @return
	 */
	public static String ajaxResult(boolean success,String message)
	{
		Map map=new HashMap();
		map.put("success", success);//�Ƿ�ɹ�
		map.put("message", message);//�ı���Ϣ
		String json= JSON.toJSONString(map);		
		return json;
	}
	

	/**
	 * JSON���Զ���ǰ׺
	 * @param json ԭjson�ַ���
	 * @param prefix ǰ׺
	 * @return ��ǰ׺����ַ���
	 */

	public static String JsonFormatterAddPrefix(String json,String prefix,Map<String,Object> newmap)
	{
		if(newmap == null){
			newmap = new HashMap();
		}
		Map<String,Object> map = (Map) JSON.parse(json);

		for(String key:map.keySet())
		{
			Object object=map.get(key);
			if(isEntity(object)){
				String jsonString = JSON.toJSONString(object);
				JsonFormatterAddPrefix(jsonString,prefix+key+".",newmap);
				
			}else{
				newmap.put(prefix+key, object);
			}
			
		}
		return JSON.toJSONString(newmap);		
	}
	/**
	 * �ж�ĳ�����ǲ���ʵ��
	 * @param object
	 * @return
	 */
	private static boolean isEntity(Object object)
	{
		if(object instanceof String  )
		{
			return false;
		}
		if(object instanceof Integer  )
		{
			return false;
		}
		if(object instanceof Long  )
		{
			return false;
		}
		if(object instanceof java.math.BigDecimal  )
		{
			return false;
		}
		if(object instanceof Date  )
		{
			return false;
		}
		if(object instanceof java.util.Collection )
		{
			return false;
		}
		return true;
		
	}
}
