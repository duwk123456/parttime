package com.portalmgr.job.dao;


import com.portalmgr.job.entity.Job;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author duwk
 * @date： 日期：2016-11-18 时间：上午8:57:05
 */
@Repository("JobDao")
public interface JobDao {
	


	void approUser(@Param("total_user_id") String total_user_id, @Param("type") String type);

	void modifyUserScore(@Param("total_user_id") String total_user_id);

	int getJobCnt(Job job);

	List<Job> getJobList(Job job);

	void updateJobStatus(@Param("total_job_id")  String total_job_id);

	void addJob(Job job);
}
