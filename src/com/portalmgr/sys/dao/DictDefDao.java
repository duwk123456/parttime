package com.portalmgr.sys.dao;


import com.portalmgr.sys.entity.DictDef;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author duwk
 * @date： 日期：2016-11-18 时间：上午8:57:05
 */
@Repository("dictDefDao")
public interface DictDefDao {
	
	
	public List<DictDef> dictList(DictDef dict);
			
	
}
