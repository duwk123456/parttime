package com.portalmgr.job.controller;

import com.portalmgr.common.BaseController;
import com.portalmgr.common.ResultEntity;
import com.portalmgr.common.SysProUtil;
import com.portalmgr.job.entity.Job;
import com.portalmgr.job.entity.UserJob;
import com.portalmgr.job.entity.UserJobDTO;
import com.portalmgr.job.service.JobService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;


/**
 * 
 * @author duwk
 * @date： 日期：2016-11-17 时间：下午4:35:39
 */

@Controller
@RequestMapping("jobController")
public class JobController extends BaseController {
	private static Logger log = Logger.getLogger(JobController.class);
	
	@Autowired
	private JobService jobService;




	@RequestMapping(value="/getJobList")
	@ResponseBody
	public ResultEntity  getJobList(HttpServletRequest request,HttpServletResponse response,Job job){
		ResultEntity resultEntity = new ResultEntity();
		try{
			job.setStartRow();
			int total =jobService.getJobCnt(job);
			List<Job> userList=jobService.getJobList(job);
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




	@RequestMapping(value="/updateJobStatus")
	@ResponseBody
	public ResultEntity  updateJobStatus(HttpServletRequest request,HttpServletResponse response){
		ResultEntity resultEntity = new ResultEntity();
		try{
			String total_job_id = request.getParameter("total_job_id");
			jobService.updateJobStatus(total_job_id);
			resultEntity.setMsg("成功");
			resultEntity.setSuccess(true);
		}catch(Exception e){
			e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
		return resultEntity;
	}





	@RequestMapping(value="/save")
	@ResponseBody
	public ResultEntity  save(HttpServletRequest request,HttpServletResponse response,Job job){
		ResultEntity resultEntity = new ResultEntity();
		try{

			jobService.addJob(job);
			resultEntity.setMsg("成功");
			resultEntity.setSuccess(true);
		}catch(Exception e){
			e.printStackTrace();
			resultEntity.setSuccess(false);
			resultEntity.setMsg("服务异常");
		}
		return resultEntity;
	}



	/**
	 * 图片上传
	 * @param request
	 * @param response
	 */

	@RequestMapping(value="/uploadPic")
	@ResponseBody
	public ResultEntity uploadPic(HttpServletRequest request, HttpServletResponse response) throws IOException {

		ResultEntity resultEntity = new ResultEntity();
		try {
			MultipartHttpServletRequest mtpRequest = (MultipartHttpServletRequest) request;
			MultipartFile file = mtpRequest.getFile("pic");
			String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			String newName = UUID.randomUUID().toString().replace("-", "") + ext;

			String path = SysProUtil.getProperty("attach.path") + File.separator;
			File targetFolder = new File(path);
			if (!targetFolder.exists()) {
				targetFolder.mkdirs();
			}
			File targetFile = new File(path + File.separator + newName);
			InputStream inputStream = file.getInputStream();
			FileOutputStream fileOutputStream = new FileOutputStream(targetFile);
			int i = 0;
			byte[] b = new byte[1024];
			while ((i = inputStream.read(b)) != -1) {
				fileOutputStream.write(b, 0, i);
			}
			inputStream.close();
			fileOutputStream.close();
			request.setAttribute("picName", newName);
			resultEntity.setMsg("成功");
			resultEntity.setSuccess(true);
			resultEntity.setData(newName);
		} catch (Exception e) {
			resultEntity.setSuccess(false);
			e.printStackTrace();
		}
		return resultEntity;

	}

	@RequestMapping(value="/addUserJob")
	@ResponseBody
	public ResultEntity addUserJob(HttpServletRequest request, HttpServletResponse response, UserJob userJob) throws IOException {

		ResultEntity resultEntity = new ResultEntity();
		try {

			jobService.addUserJob(userJob);
			resultEntity.setSuccess(true);
		} catch (Exception e) {
			resultEntity.setSuccess(false);
			e.printStackTrace();
		}
		return resultEntity;
	}


	/**
	 *
	 * @param request
	 * @param response
	 * @param userJob  flowId   status 1 同意 2拒绝
	 * @return
	 * @throws IOException
     */
	@RequestMapping(value="/modifyUserJobStatus")
	@ResponseBody
	public ResultEntity modifyUserJobStatus(HttpServletRequest request, HttpServletResponse response, UserJob userJob) throws IOException {

		ResultEntity resultEntity = new ResultEntity();
		try {
			jobService.modifyUserJobStatus(userJob);
			resultEntity.setSuccess(true);
		} catch (Exception e) {
			resultEntity.setSuccess(false);
			e.printStackTrace();
		}
		return resultEntity;
	}


	/**
	 *
	 * @param request
	 * @param response
	 * @param userJob  flowId
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/getUserJobList")
	@ResponseBody
	public ResultEntity getUserJobList(HttpServletRequest request, HttpServletResponse response, UserJob userJob) throws IOException {
		ResultEntity resultEntity = new ResultEntity();
		try {
			userJob.setStartRow();
			int total  =jobService.getUserJobCnt(userJob);
			resultEntity.setTotal(total);
			List<UserJobDTO> lists =jobService.getUserJobList(userJob);
			resultEntity.setData(lists);
			resultEntity.setSuccess(true);
		} catch (Exception e) {
			resultEntity.setSuccess(false);
			e.printStackTrace();
		}
		return resultEntity;
	}

}
