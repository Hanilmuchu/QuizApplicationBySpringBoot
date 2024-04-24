package com.hanil.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanil.entity.Quiz;
import com.hanil.service.QuestionServiceImp;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionServiceImp service;
	@RequestMapping("/")
	public String homePage()
	{
		return "home";
	}
	
	@RequestMapping("/getQuiz")
	public String getQuizPage(ModelMap model)
	{
		model.put("quiz", service.getAllQuestions());
		return "quiz";
	}
	@ResponseBody
	@RequestMapping("/submit")
	public String submiQuiz(Quiz quiz)
	{
		return "Thanks for submitting...";
	}
	
	@RequestMapping("/result")
    public String submitQuiz(@RequestParam Map<String, String> answers, ModelMap model) 
	{
        // Calculate the score using the service method
        int score = service.calculateScore(answers);
        model.put("score",score);
        return "result";
    }
}
