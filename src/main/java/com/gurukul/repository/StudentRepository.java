package com.gurukul.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gurukul.model.Course;
import com.gurukul.model.Student;
import com.gurukul.model.User;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {

    List<Student> findByCourse(Course course);
    
    Student findByUser(User user);
}