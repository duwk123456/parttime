package com.portalmgr.sys.dao;


import com.portalmgr.sys.entity.UserInfo;
import com.portalmgr.sys.vo.UserInfoVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author duwk
 * @date： 日期：2016-11-18 时间：上午8:57:05
 */
@Repository("userDao")
public interface UserDao {
	
	List<UserInfo> findAllUser(UserInfoVo userInfoVo);

	UserInfo findUser(UserInfoVo userInfoVo);

	void addUser(UserInfo userInfo);

	void updateUser(UserInfo userInfo);

	int getUserCnt(UserInfoVo userInfoVo);

	void approUser(@Param("total_user_id") String total_user_id,@Param("type") String type);

	void modifyUserScore(@Param("total_user_id") String total_user_id);

	void updateWorkTime(UserInfo userInfo);

	List<UserInfo> getEmployeeList(UserInfoVo userInfoVo);

	int getEmployeeCnt(UserInfoVo userInfoVo);
}
