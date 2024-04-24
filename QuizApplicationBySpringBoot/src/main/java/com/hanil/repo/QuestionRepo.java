package com.hanil.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hanil.entity.Quiz;

public interface QuestionRepo extends JpaRepository<Quiz, Integer> {

}
