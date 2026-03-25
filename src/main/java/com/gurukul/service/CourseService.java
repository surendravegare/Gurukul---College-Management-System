package com.gurukul.service;

import com.gurukul.model.Course;
import java.util.List;

public interface CourseService {
    List<Course> getAllCourses();
    void saveCourse(Course course);
    Course getCourseById(Long id);
    void deleteCourse(Long id);
}