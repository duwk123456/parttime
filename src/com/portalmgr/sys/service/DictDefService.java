
package com.portalmgr.sys.service;


import com.portalmgr.sys.dao.DictDefDao;
import com.portalmgr.sys.entity.DictDef;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author duwk
 * @date： 日期：2016-11-18 时间：上午8:56:35
 */

@Service("dictDefService")
public class DictDefService {

	@Resource
	private DictDefDao dictDefDao;

	public List<DictDef> dictList(DictDef dict) {
	
		return dictDefDao.dictList(dict);
	}
	

	
	

	
}
