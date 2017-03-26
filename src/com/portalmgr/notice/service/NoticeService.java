package com.portalmgr.notice.service;

import com.portalmgr.notice.dao.NoticeDao;
import com.portalmgr.notice.entity.Notice;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author duwk
 * @Description
 * @Date 2017-02-27 13:57
 **/
@Service("noticeService")
public class NoticeService {

    @Resource
    private NoticeDao noticeDao;

/*
    public Notice findNotice(NoticeVo noticeVo) {

        return noticeDao.findNotice(noticeVo);
    }

    public void updateNotice(Notice notice) {
         noticeDao.updateNotice(notice);
    }

    public List<Notice> getNoticeList(NoticeVo notice) {
        return noticeDao.findAllNotice(notice);
    }
*/

    public void addNotice(Notice notice) {
        noticeDao.addNotice(notice);

    }

/*    public int getNoticeCnt(NoticeVo notice) {
        return  noticeDao.getNoticeCnt(notice);
    }*/
}


