package com.gurukul.service;

import java.util.List;


import com.gurukul.model.Notice;


public interface NoticeService {
    List<Notice> getAllNotices();
    void saveNotice(Notice notice);
    void deleteNotice(Long id);
}