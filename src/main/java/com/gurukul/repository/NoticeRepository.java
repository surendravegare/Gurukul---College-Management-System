package com.gurukul.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gurukul.model.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long> {
    List<Notice> findAllByOrderByCreatedAtDesc();
}