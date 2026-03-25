package com.gurukul.service;

import com.gurukul.model.Marks;
import com.gurukul.model.Student;
import com.gurukul.repository.MarksRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MarksServiceImpl implements MarksService {

    @Autowired
    private MarksRepository marksRepository;

    @Override
    public List<Marks> getAllMarks() {
        return marksRepository.findAll();
    }

    @Override
    public List<Marks> getMarksByStudent(Student student) {
        return marksRepository.findByStudent(student);
    }

    @Override
    public void saveMarks(Marks marks) {
        marksRepository.save(marks);
    }

    @Override
    public Marks getMarksById(Long id) {
        return marksRepository.findById(id).orElse(null);
    }

    @Override
    public void deleteMarks(Long id) {
        marksRepository.deleteById(id);
    }
}