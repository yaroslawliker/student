package org.yarek.fasttestapp.model;

import org.yarek.fasttestapp.model.entities.User;
import org.yarek.fasttestapp.model.entities.quiz.Quiz;
import org.yarek.fasttestapp.model.entities.quiz.QuizPreview;
import org.yarek.fasttestapp.model.exceptions.UsernameAlreadyExistsException;

import java.util.List;

public interface Model {
    void registerUser(User user) throws UsernameAlreadyExistsException;

    /**
     * Checks if the given password matches given username
     * @return user id if authentication is correct, null otherwise
     */
    String authenticate(String username, String password);
    User getUser(String userId);

    List<QuizPreview> getTestPreviews();
    List<QuizPreview> getTestPreviews(int amount);

    Quiz getTestById(String testId);
    void saveNewTest(Quiz quiz);

    void registerQuizPassed(String username, String quizId, float score);
}
