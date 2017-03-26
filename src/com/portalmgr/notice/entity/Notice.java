package com.portalmgr.notice.entity;

import com.portalmgr.common.CommBean;

/**
 * @author duwk
 * @Description
 * @Date 2017-02-27 14:02
 **/
public class Notice extends CommBean{

   private String  noticeId;
   private String  noticeContent;
   private String  createTime;

   public String getNoticeId() {
      return noticeId;
   }

   public void setNoticeId(String noticeId) {
      this.noticeId = noticeId;
   }

   public String getNoticeContent() {
      return noticeContent;
   }

   public void setNoticeContent(String noticeContent) {
      this.noticeContent = noticeContent;
   }

   public String getCreateTime() {
      return createTime;
   }

   public void setCreateTime(String createTime) {
      this.createTime = createTime;
   }
}
