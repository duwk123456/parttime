package com.portalmgr.sys.controller;

import com.portalmgr.sys.entity.UserInfo;
import com.portalmgr.sys.service.UserService;
import com.portalmgr.sys.vo.UserInfoVo;
import com.portalmgr.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;




public class UserListener implements ServletContextListener {
	Timer timer = null;

	@Autowired
	UserService userService;

	
	public void contextDestroyed(ServletContextEvent sce) {
	
		if (timer != null) {
		
			timer.cancel();
		}
	}

	
	public void contextInitialized(ServletContextEvent sce) {


		timer = new Timer();
		final List<Integer> idList= new ArrayList<Integer>();
		timer.schedule(new TimerTask() {

			@Override
			public void run() {
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
		}, 5000, 1000 * 20);

	}

}
