package com.gurukul.repository;

import com.gurukul.model.Marks;
import com.gurukul.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface MarksRepository extends JpaRepository<Marks, Long> {

   
    List<Marks> findByStudent(Student student);
}