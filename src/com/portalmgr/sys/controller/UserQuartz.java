package com.portalmgr.sys.controller;


import com.portalmgr.sys.entity.UserInfo;
import com.portalmgr.sys.service.UserService;
import com.portalmgr.sys.vo.UserInfoVo;
import com.portalmgr.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 定时器
 * 
 * @author duwk
 * @date： 日期：2016-8-2 时间：上午10:55:19
 */
public class UserQuartz {




	@Autowired
	UserService userService;


	public void updateUser(){


		UserInfoVo userInfoVo = new UserInfoVo();
		userInfoVo.setStatus("0");
		userInfoVo.setPage(1);
		userInfoVo.setRows(2000);
		userInfoVo.setStartRow();
		String sysTime = DateUtil.getSysDateTime();
		try {
			List<UserInfo> userList=userService.getUserList(userInfoVo);
			for (UserInfo u:userList){

				long diffdays = DateUtil.diffTimeForDay(sysTime,
						u.getCreateTime());
				if(diffdays>=1.5){
					userService.approUser(u.getUserId()+"","1");
				}

			}
		}catch (Exception e){
			e.printStackTrace();
		}


	}
	
	

}
