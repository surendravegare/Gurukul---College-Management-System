package com.gurukul.service;

import com.gurukul.model.Marks;
import com.gurukul.model.Student;
import java.util.List;

public interface MarksService {
    List<Marks> getAllMarks();
    List<Marks> getMarksByStudent(Student student);
    void saveMarks(Marks marks);
    Marks getMarksById(Long id);
    void deleteMarks(Long id);
	static void deleteMarksByStudent(Student student) {
		// TODO Auto-generated method stub
		
	}
}