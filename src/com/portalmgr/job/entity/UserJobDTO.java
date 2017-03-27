package com.portalmgr.job.entity;

/**
 * Created by Administrator on 2017/3/26.
 */
public class UserJobDTO {

    private String flowId;//编号


    private String stuName;//学生名称
    private String stuSex;
    private String stuAge;
    private String stuTel;
    private String stuBeginTime;
    private String stuEndTime;

    //商家兼职信息
    private String storeName;//商家名称
    private String jobBeginTime;//
    private String jobEndTime;//
    private String jobDesc;//
    private String jobTel;//
    private String salaryAndUnit;//


    public String getFlowId() {
        return flowId;
    }

    public void setFlowId(String flowId) {
        this.flowId = flowId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuSex() {
        return stuSex;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex;
    }

    public String getStuAge() {
        return stuAge;
    }

    public void setStuAge(String stuAge) {
        this.stuAge = stuAge;
    }

    public String getStuTel() {
        return stuTel;
    }

    public void setStuTel(String stuTel) {
        this.stuTel = stuTel;
    }

    public String getStuBeginTime() {
        return stuBeginTime;
    }

    public void setStuBeginTime(String stuBeginTime) {
        this.stuBeginTime = stuBeginTime;
    }

    public String getStuEndTime() {
        return stuEndTime;
    }

    public void setStuEndTime(String stuEndTime) {
        this.stuEndTime = stuEndTime;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getJobBeginTime() {
        return jobBeginTime;
    }

    public void setJobBeginTime(String jobBeginTime) {
        this.jobBeginTime = jobBeginTime;
    }

    public String getJobEndTime() {
        return jobEndTime;
    }

    public void setJobEndTime(String jobEndTime) {
        this.jobEndTime = jobEndTime;
    }

    public String getJobDesc() {
        return jobDesc;
    }

    public void setJobDesc(String jobDesc) {
        this.jobDesc = jobDesc;
    }

    public String getJobTel() {
        return jobTel;
    }

    public void setJobTel(String jobTel) {
        this.jobTel = jobTel;
    }

    public String getSalaryAndUnit() {
        return salaryAndUnit;
    }

    public void setSalaryAndUnit(String salaryAndUnit) {
        this.salaryAndUnit = salaryAndUnit;
    }
}
