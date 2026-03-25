package com.gurukul.service;

import com.gurukul.model.Student;
import com.gurukul.model.Course;
import java.util.List;

public interface StudentService {
    List<Student> getAllStudents();
    
    List<Student> getStudentsByCourse(Course course);
    
    void saveStudent(Student student);
    
    Student getStudentById(Long id);
    
    void deleteStudent(Long id);
}