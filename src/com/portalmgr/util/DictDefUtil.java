package com.portalmgr.util;


import com.portalmgr.sys.entity.DictDef;
import com.portalmgr.sys.service.DictDefService;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class DictDefUtil {
	@Resource
	private DictDefService dictDefService;
	private static DictDefUtil instance;
	
	private Log logger = LogFactory.getLog(getClass());

	private static boolean init = false;// 是否已经被spring初始化，默认为false
	

	private static Map<String, List<DictDef>> dictDefMap_cache = new HashMap<String, List<DictDef>>();
	private static Map<String, List<DictDef>> dictDefMap = new HashMap<String, List<DictDef>>();
	public static DictDefUtil getInstance() {
		return instance;
	}


	/**
	 * 初始化配置文件
	 */
	public void initialize() {
		if (init) {
			// 如果已经被初始化了则直接返回
			return;
		}// if
		logger.debug("初始化下拉框工具类");
		init = true;// 标记已经被spring初始化
		instance = this;
	}
	
	
	
	/**
	 * 简单的下拉框处于数据字典中可以从Map中获取
	 * @param dict_class
	 * @param dict_type
	 * @return
	 */
	public static List<DictDef> getDictDefByDictTypeDictClassFromMap(String dictType,String dictClass, String parentEntryId) {
		List<DictDef> resultList=null;
		if(StringUtils.isNotEmpty(dictClass) && StringUtils.isNotEmpty(dictType)) {
		String key = dictType+dictClass+parentEntryId;
			if(dictDefMap_cache.containsKey(key)){
			   resultList= dictDefMap_cache.get(key); 
			 }else{
				DictDef dict = new DictDef();
				dict.setDictClass(dictClass);
				dict.setDictType(dictType);
			    resultList = instance.dictDefService.dictList(dict);  
			    if(!resultList.isEmpty())dictDefMap_cache.put(key, resultList);
			}
			return resultList;
		} else {
			return null;
		}
	}

	

	
	/**
	 * getDictDefEntity:根据字典类别 和字典值获取字典实体
	 * @param dictType 对应dict_def的dict_type 非空
	 * @param dictClass 对应dict_def的dict_class 非空
	 * @param entryId 对应dict_def的entry_id 非空
	 * @return 
	 */
	public static DictDef getDictDefEntity(String dictType, String dictClass, String entryId) {
		DictDef bean = null;
		if(StringUtils.isNotEmpty(dictType) &&StringUtils.isNotEmpty(dictClass)&&StringUtils.isNotEmpty(entryId)) {
			String key = dictType + dictClass;
			if(!dictDefMap.containsKey(key)) {
				DictDef dict = new DictDef();
				dict.setDictClass(dictClass);
				dict.setDictType(dictType);
				List<DictDef> dictList = instance.dictDefService.dictList(dict);
				dictDefMap.put(key, dictList);
			}
			
			if(dictDefMap.containsKey(key)) {
				List<DictDef> dictList = dictDefMap.get(key);
				if( null != dictList) {
					for (DictDef dictDef : dictList) {
						if(entryId.equals(dictDef.getEntryId())) {
							bean = dictDef;
							break;
						}
					}
				}
			}
			return bean;
		}else{
			
			return null;
		}
	
	}
	

	
	
}
