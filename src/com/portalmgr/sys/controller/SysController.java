package com.portalmgr.sys.controller;

import com.portalmgr.common.*;
import com.portalmgr.sys.entity.UserInfo;
import com.portalmgr.sys.service.UserService;
import com.portalmgr.sys.vo.UserInfoVo;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

;


/**
 * 
 * @author duwk
 * @date： 日期：2016-11-17 时间：下午4:35:39
 */

@Controller
@RequestMapping("/SysController")
public class SysController extends BaseController {
	private static Logger log = Logger.getLogger(SysController.class);
	
	@Autowired
	private UserService userService;


	@RequestMapping(value="/login")
	@ResponseBody
	public ResultEntity login(HttpServletRequest request, HttpServletResponse response, UserInfoVo userInfoVo) throws IOException {
		ResultEntity resultEntity= new ResultEntity();

		try {

			if(StringUtils.isNotEmpty(userInfoVo.getLoginName())&&StringUtils.isNotEmpty(userInfoVo.getPassword())) {

				UserInfo userInfo = userService.loginSys(userInfoVo);
				if (userInfo == null) {
					resultEntity.setSuccess(false);
					resultEntity.setMsg("用户号或密码不正确，请重新输入");
				}else if (!userInfo.getPassword().equals(userInfoVo.getPassword())) {
					resultEntity.setSuccess(false);
					resultEntity.setMsg("用户号或密码不正确，请重新输入");
				}else {

					UserSessionInfo userSessionInfo = new UserSessionInfo();
					userSessionInfo.setUserId(userInfo.getUserId());
					userSessionInfo.setUserName(userInfo.getUserName());
					userSessionInfo.setUserType(userInfo.getUserType());
					resultEntity.setSuccess(true);
					resultEntity.setMsg("登陆成功");
					resultEntity.setData(userSessionInfo);
					request.getSession().setAttribute("userInfo", userSessionInfo);
					request.setAttribute(ClientConstantPool.SESSION_KEY, userSessionInfo);
				}
			}else{
				log.info("参数异常");
				resultEntity.setSuccess(false);
				resultEntity.setMsg("服务异常");
			}
		}catch (Exception e){
		    e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
		return resultEntity;
	}


	@RequestMapping(value="/logOut")
	@ResponseBody
	public ResultEntity  logOut(HttpServletRequest request,HttpServletResponse response,UserInfoVo userInfoVo){

		ResultEntity resultEntity= new ResultEntity();
		request.getSession().removeAttribute("userInfo");
		resultEntity.setSuccess(true);
		return resultEntity;


	}


	@RequestMapping(value="/leftTree")
	@ResponseBody
	public List<Map<String, Object>> leftTree(HttpServletRequest request, HttpServletResponse response){

		List<Map<String,Object>>  treeList = new ArrayList<Map<String,Object>>();

		Map<String,Object> map1 = new HashMap<String, Object>();
		map1.put("id", 1);
		map1.put("text", "用户管理");
		map1.put("isLeaf","0");
		List<Map<String,Object>> userChildList = new ArrayList<Map<String, Object>>();
		Map<String,Object> userMap = new HashMap<String, Object>();
		userMap.put("id","11");
		userMap.put("text","用户审批");
		userMap.put("isLeaf","1");

		userMap.put("url", request.getContextPath()+"/admin/user/list.jsp");
		userChildList.add(userMap);
		map1.put("children", userChildList);
		treeList.add(map1);

		Map<String,Object> map2 = new HashMap<String, Object>();
		map2.put("id", 2);
		map2.put("text", "违规商家管理");
		map2.put("isLeaf","0");
		List<Map<String,Object>> childList2 = new ArrayList<Map<String, Object>>();
		Map<String,Object> childMap2 = new HashMap<String, Object>();
		childMap2.put("id","22");
		childMap2.put("text","商家列表");
		childMap2.put("url", request.getContextPath()+"/admin/user/storeList.jsp");
		childMap2.put("isLeaf","1");
		childList2.add(childMap2);
		map2.put("children", childList2);
		treeList.add(map2);

		Map<String,Object> map3 = new HashMap<String, Object>();
		map3.put("id", 3);
		map3.put("text", "兼职消息管理");
		map3.put("isLeaf","0");
		List<Map<String,Object>> childList3= new ArrayList<Map<String, Object>>();
		Map<String,Object> childMap3 = new HashMap<String, Object>();
		childMap3.put("id","33");
		childMap3.put("text","兼职消息列表");
		childMap3.put("url", request.getContextPath()+"/admin/job/jobList.jsp");
		childMap3.put("isLeaf","1");
		childList3.add(childMap3);
		map3.put("children", childList3);
		treeList.add(map3);


		Map<String,Object> map4 = new HashMap<String, Object>();
		map4.put("id", 4);
		map4.put("text", "消息发布");
		map4.put("isLeaf","0");
		List<Map<String,Object>> childList4= new ArrayList<Map<String, Object>>();
		Map<String,Object> childMap4 = new HashMap<String, Object>();
		childMap4.put("id","44");
		childMap4.put("text", "系统消息发布");
		childMap4.put("url", request.getContextPath()+"/admin/notice/add.jsp");
		childMap4.put("isLeaf","1");
		childList4.add(childMap4);
		Map<String,Object> childMap41 = new HashMap<String, Object>();
		childMap41.put("id", "45");
		childMap41.put("text", "兼职信息代发");
		childMap41.put("url", request.getContextPath()+"/admin/job/add.jsp");
		childMap41.put("isLeaf","1");
		childList4.add(childMap41);
		map4.put("children", childList4);

		treeList.add(map4);

/*		ResultEntity resultEntity= new ResultEntity();
		resultEntity.setSuccess(true);
		resultEntity.setData(treeList);
		GsonTools.writeJsonObj(response, resultEntity);*/

		return treeList;

	}

}
