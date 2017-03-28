
package com.portalmgr.sys.service;


import com.portalmgr.sys.dao.UserDao;
import com.portalmgr.sys.entity.UserInfo;
import com.portalmgr.sys.vo.UserInfoVo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author duwk
 * @date： 日期：2016-11-18 时间：上午8:56:35
 */

@Service("userService")
public class UserService {
	private static Logger log = Logger.getLogger(UserService.class);
	@Resource
	private UserDao userDao;

	/**
	 * 返回用户数据集合
	 * @param userInfoVo
	 * @return
	 */
	public List<UserInfo> getUserList(UserInfoVo userInfoVo){
		return userDao.findAllUser(userInfoVo);
		
	}


	/**
	 * 查找单个用户
	 * @param user
	 * @return
	 */
	public UserInfo findUser(UserInfoVo user){
		
		return userDao.findUser(user);
		
	}


	public UserInfo loginSys(UserInfoVo userInfoVo) {
		return  userDao.findUser(userInfoVo);
	}

	/**
	 * 添加用户数据
	 * @param userInfo
	 */
	public void addUser(UserInfo userInfo) {
		userDao.addUser(userInfo);
	}

	/**
	 * 修改用户数据
	 * @param userInfo
	 */
	public void updateUser(UserInfo userInfo) {
		userDao.updateUser(userInfo);
	}

	public int getUserCnt(UserInfoVo userInfoVo) {
		return userDao.getUserCnt(userInfoVo);
	}

	public void approUser(String total_user_id, String type) {
		 userDao.approUser(total_user_id,type);
	}

	public void modifyUserScore(String total_user_id) {
		userDao.modifyUserScore(total_user_id);
	}

	public void updateWorkTime(UserInfo userInfo) {
		userDao.updateWorkTime(userInfo);
	}
}
