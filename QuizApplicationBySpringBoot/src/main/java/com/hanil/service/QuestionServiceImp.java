package com.hanil.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanil.entity.Quiz;
import com.hanil.repo.QuestionRepo;
@Service
public class QuestionServiceImp implements QuestionService{

	@Autowired
	private QuestionRepo repo;

	public List<Quiz> getAllQuestions() {
		return repo.findAll();	
	}

	public Map<Integer, String> getCorrectAnswersFromDatabase() 
	{
        // Implement logic to retrieve correct answers from the database
        // Return a map where the key is the question ID and the value is the correct answer
		List<Quiz>quiz=repo.findAll();
		Map<Integer,String> map=new LinkedHashMap<Integer, String>();
		for(Quiz q:quiz)
		{
			map.put(q.getSno(),q.getCorrectanswer());
		}
		return map;

	}

    // This method calculates the score based on the selected answers and correct answers
    public int calculateScore(Map<String, String> selectedAnswers) {
        Map<Integer, String> map = getCorrectAnswersFromDatabase();
        int score = 0;
        for (Map.Entry<String, String> entry : selectedAnswers.entrySet()) {
            String questionId = entry.getKey();
            String selectedOption =entry.getValue();
            String correctOption = map.get(questionId);
            if (correctOption != null && correctOption.equals(selectedOption)) {
                score++;
            }
        }
        return score;
    }
}
