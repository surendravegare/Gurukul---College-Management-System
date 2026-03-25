package com.gurukul.service;

import com.gurukul.model.Teacher;
import com.gurukul.model.User;

import java.util.List;

public interface TeacherService {
    List<Teacher> getAllTeachers();
    void saveTeacher(Teacher teacher);
    Teacher getTeacherById(Long id);
    void deleteTeacher(Long id);
	Teacher getTeacherByUserId(Long id);
	
	Teacher getTeacherByUser(User user);
}