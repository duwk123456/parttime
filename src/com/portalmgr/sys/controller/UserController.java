package com.portalmgr.sys.controller;

import com.portalmgr.common.BaseController;
import com.portalmgr.common.ResultEntity;
import com.portalmgr.sys.entity.UserInfo;
import com.portalmgr.sys.service.UserService;
import com.portalmgr.sys.vo.UserInfoVo;
import com.portalmgr.util.GsonTools;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


/**
 * 
 * @author duwk
 * @date： 日期：2016-11-17 时间：下午4:35:39
 */

@Controller
@RequestMapping("userController")
public class UserController extends BaseController {
	private static Logger log = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;


	/**
	 *  查询得到用户数据 传回页面
	 * @param request
	 * @param response
	 * @param userInfoVo   userId
	 */
	@RequestMapping(value="/editUser")
	public void  editUser(HttpServletRequest request,HttpServletResponse response,UserInfoVo userInfoVo){
	    ResultEntity resultEntity = new ResultEntity();
	    try{
	    	UserInfo user=userService.findUser(userInfoVo);
			resultEntity.setMsg("查询成功");
			resultEntity.setSuccess(true);
			resultEntity.setData(user);

	    }catch(Exception e){
	    	e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
	    }
		GsonTools.writeJsonObj(response, resultEntity);
	}

	/**
	 *
	 * @param request
	 * @param response
	 * @param userInfoVo   userId
	 */
	@RequestMapping(value="/getUserList")
	@ResponseBody
	public ResultEntity  getUserList(HttpServletRequest request,HttpServletResponse response,UserInfoVo userInfoVo){
		ResultEntity resultEntity = new ResultEntity();
		try{
			userInfoVo.setStartRow();
			int total =userService.getUserCnt(userInfoVo);
			List<UserInfo> userList=userService.getUserList(userInfoVo);
			resultEntity.setTotal(total);
			resultEntity.setMsg("查询成功");
			resultEntity.setSuccess(true);
			resultEntity.setRows(userList);

		}catch(Exception e){
			e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
		return resultEntity;
	}


	@RequestMapping(value="/approUser")
	@ResponseBody
	public ResultEntity  approUser(HttpServletRequest request,HttpServletResponse response){
		ResultEntity resultEntity = new ResultEntity();
		try{
			String total_user_id = request.getParameter("total_userid");
			String type=request.getParameter("type");

			userService.approUser(total_user_id,type);
			resultEntity.setMsg("成功");
			resultEntity.setSuccess(true);
		}catch(Exception e){
			e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
		return resultEntity;
	}

	@RequestMapping(value="/modifyUserScore")
	@ResponseBody
	public ResultEntity  modifyUserScore(HttpServletRequest request,HttpServletResponse response){
		ResultEntity resultEntity = new ResultEntity();
		try{
			String total_user_id = request.getParameter("total_userid");
			userService.modifyUserScore(total_user_id);
			resultEntity.setMsg("成功");
			resultEntity.setSuccess(true);
		}catch(Exception e){
			e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
		return resultEntity;
	}




	@RequestMapping(value="/addUser")
	public void  addUser(HttpServletRequest request,HttpServletResponse response,UserInfo userInfo){
		ResultEntity resultEntity = new ResultEntity();
		try{
			userService.addUser(userInfo);
			resultEntity.setMsg("添加成功");
			resultEntity.setSuccess(true);
			GsonTools.writeJsonObj(response, resultEntity);
		}catch(Exception e){
			e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
	}


	/**
	 *
	 * @param request
	 * @param response
	 * @param userInfo userName password userId job salary addr（客户才有的属性）
	 */
	@RequestMapping(value="/updateUser")
	public void  updateUser(HttpServletRequest request,HttpServletResponse response,UserInfo userInfo){
		ResultEntity resultEntity = new ResultEntity();
		try{
			userService.updateUser(userInfo);
			resultEntity.setMsg("修改成功");
			resultEntity.setSuccess(true);
		}catch(Exception e){
			e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
		GsonTools.writeJsonObj(response, resultEntity);
	}

	@RequestMapping(value="/updatePwd")
	@ResponseBody
	public ResultEntity  updatePwd(HttpServletRequest request,HttpServletResponse response,UserInfoVo userInfoVo){
		ResultEntity resultEntity = new ResultEntity();
		try{
			UserInfo user=userService.findUser(userInfoVo);
			if(user.getPassword().equals(userInfoVo.getPassword())){
				UserInfo param = new UserInfo();
				param.setUserId(user.getUserId());
				param.setPassword(userInfoVo.getNewPwd());
				userService.updateUser(param);
				resultEntity.setMsg("密码更新成功");
				resultEntity.setSuccess(true);
			}else{
				resultEntity.setMsg("旧密码错误，请重新输入");
				resultEntity.setSuccess(false);
			}

		}catch(Exception e){
			e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
		return resultEntity;

	}

	@RequestMapping(value="/updateWorkTime")
	@ResponseBody
	public ResultEntity  updateWorkTime(HttpServletRequest request,HttpServletResponse response,UserInfo userInfo){
		ResultEntity resultEntity = new ResultEntity();
		try{
			userService.updateWorkTime(userInfo);
			resultEntity.setMsg("修改成功");
			resultEntity.setSuccess(true);

		}catch(Exception e){
			e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
		return resultEntity;

	}



	@RequestMapping(value="/checkUser")
	@ResponseBody
	public ResultEntity  checkUser(HttpServletRequest request,HttpServletResponse response,UserInfoVo userInfoVo){
		ResultEntity resultEntity = new ResultEntity();
		try{
			UserInfo user=userService.findUser(userInfoVo);
			if(user==null){
				resultEntity.setSuccess(true);
			}else{
				resultEntity.setSuccess(false);
			}
		}catch(Exception e){
			e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
		return resultEntity;

	}



}
