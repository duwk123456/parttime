package com.portalmgr.job.entity;

import com.portalmgr.common.CommBean;

/**
 * Created by Administrator on 2017/3/24.
 */
public class Job extends CommBean{

    private String jobId;
    private String createUserId;//创建人
    private String userName;
    private String salary;//工资
    private String addr;//兼职地点
    private String desc;//描述
    private String beginTime;//兼职开始时间 2017-03-25
    private String contactName;//兼职联系人
    private String pic;//图片上传 必填
    private String tel;// 联系电话
    private String endTime;//结束时间
    private String salaryUnit;//单位  月  时  这两个值
    private String status;//状态为1
    private String statusStr;
    private String salaryAndUnit;
    private String isEnd;
    private String inc;
    private String employeeId;


    public String getInc() {
        return inc;
    }

    public void setInc(String inc) {
        this.inc = inc;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getIsEnd() {
        return isEnd;
    }

    public void setIsEnd(String isEnd) {
        this.isEnd = isEnd;
    }

    public String getStatusStr() {
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }

    public String getSalaryAndUnit() {
        return salaryAndUnit;
    }

    public void setSalaryAndUnit(String salaryAndUnit) {
        this.salaryAndUnit = salaryAndUnit;
    }

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getSalaryUnit() {
        return salaryUnit;
    }

    public void setSalaryUnit(String salaryUnit) {
        this.salaryUnit = salaryUnit;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
