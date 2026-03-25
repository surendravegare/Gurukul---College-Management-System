package com.gurukul.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gurukul.model.Teacher;
import com.gurukul.model.User;
import com.gurukul.repository.TeacherRepository;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherRepository teacherRepository;

    @Override
    public List<Teacher> getAllTeachers() {
        return teacherRepository.findAll();
    }

    @Override
    public void saveTeacher(Teacher teacher) {
        teacherRepository.save(teacher);
    }

    @Override
    public Teacher getTeacherById(Long id) {
        return teacherRepository.findById(id).orElse(null);
    }

    @Override
    public void deleteTeacher(Long id) {
        teacherRepository.deleteById(id);
    }

	@Override
	public Teacher getTeacherByUserId(Long id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Teacher getTeacherByUser(User user) {
	    return teacherRepository.findByUser(user);
	}
}