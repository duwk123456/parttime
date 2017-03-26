
package com.portalmgr.job.service;


import com.portalmgr.job.dao.JobDao;
import com.portalmgr.job.entity.Job;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author duwk
 * @date： 日期：2016-11-18 时间：上午8:56:35
 */

@Service("jobService")
public class JobService {
	private static Logger log = Logger.getLogger(JobService.class);
	@Resource
	private JobDao jobDao;


	public int getJobCnt(Job job) {
		return jobDao.getJobCnt(job);
	}

	public List<Job> getJobList(Job job) {
		return jobDao.getJobList(job);
	}

	public void updateJobStatus(String total_job_id) {
		jobDao.updateJobStatus(total_job_id);
	}

	public void addJob(Job job) {

		jobDao.addJob(job);
	}
}
