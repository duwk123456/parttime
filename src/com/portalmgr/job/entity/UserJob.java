package com.portalmgr.job.entity;

import com.portalmgr.common.CommBean;

/**
 * Created by Administrator on 2017/3/26.
 */
public class UserJob extends CommBean{

    private String flowId;
    private String jobId;
    private String employeeId;
    private String status;
    private String userId;
    private String beginTime;
    private String endTime;

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFlowId() {
        return flowId;
    }

    public void setFlowId(String flowId) {
        this.flowId = flowId;
    }

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employId) {
        this.employeeId = employId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
