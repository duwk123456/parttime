package com.portalmgr.notice.controller;

import com.portalmgr.common.BaseController;
import com.portalmgr.common.ResultEntity;
import com.portalmgr.notice.entity.Notice;
import com.portalmgr.notice.service.NoticeService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 通知栏控制层
 * @author duwk
 * @date： 日期：2016-11-17 时间：下午4:35:39
 */

@Controller
@RequestMapping("noticeController")
public class NoticeController extends BaseController {
	private static Logger log = Logger.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;


	/**
	 *  查询得到通知数据 传回页面
	 * @param request
	 * @param response
	 * @param noticeVo   noticeId
	 */
/*
	@RequestMapping(value="/editNotice")
	public void  editNotice(HttpServletRequest request,HttpServletResponse response,NoticeVo noticeVo){
	    ResultEntity resultEntity = new ResultEntity();
	    try{
	    	Notice notice=noticeService.findNotice(noticeVo);
			resultEntity.setMsg("查询成功");
			resultEntity.setSuccess(true);
			resultEntity.setData(notice);
	    }catch(Exception e){
	    	e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
	    }
		GsonTools.writeJsonObj(response, resultEntity);
	}
*/




	/**
	 *更新通知栏信息
	 * @param request
	 * @param response
	 * @param notice  noticeTitle noticeContent noticeId,status(删除的时候)
	 */
/*	@RequestMapping(value="/updateNotice")
	public void  updateNotice(HttpServletRequest request,HttpServletResponse response,Notice notice){
		ResultEntity resultEntity = new ResultEntity();
		try{
			noticeService.updateNotice(notice);
			resultEntity.setMsg("修改成功");
			resultEntity.setSuccess(true);
		}catch(Exception e){
			e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
		GsonTools.writeJsonObj(response, resultEntity);
	}*/


	/**
	 *获取通知栏数据集合
	 * @param request
	 * @param response
	 * @param notice  noticeTitle noticeContent noticeId,status(删除的时候)
	 */
/*	@RequestMapping(value="/getNoticeList")
	public void  getNoticeList(HttpServletRequest request,HttpServletResponse response,NoticeVo notice){
		ResultEntity resultEntity = new ResultEntity();
		try{
			notice.setStartRow();
			int total = noticeService.getNoticeCnt(notice);
			List<Notice> noticeList =  noticeService.getNoticeList(notice);
			resultEntity.setMsg("查询成功");
			resultEntity.setData(noticeList);
			resultEntity.setSuccess(true);
		}catch(Exception e){
			e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
		GsonTools.writeJsonObj(response, resultEntity);
	}*/


	/**
	 *获取通知栏数据集合
	 * @param request
	 * @param response
	 * @param notice  noticeTitle noticeContent noticeId,status(删除的时候)
	 */
	@RequestMapping(value="/addNotice")
	@ResponseBody
	public ResultEntity  addNotice(HttpServletRequest request,HttpServletResponse response,Notice notice){
		ResultEntity resultEntity = new ResultEntity();
		try{
			noticeService.addNotice(notice);
			resultEntity.setMsg("添加成功");
			resultEntity.setSuccess(true);
		}catch(Exception e){
			e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
		return resultEntity;
	}







}
