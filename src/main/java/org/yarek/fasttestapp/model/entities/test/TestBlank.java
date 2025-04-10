package org.yarek.fasttestapp.model.entities.test;

import java.util.ArrayList;
import java.util.List;

/**
 * Represents a filled up test, ready to be checked
 * Must be created from an existing test. Can be checked against it
 */
public class TestBlank {

    Test test;
    private List<AnsweredQuestion> answeredQuestionS;

    TestBlank(Test test) {

        this.test = test;

        answeredQuestionS = new ArrayList<AnsweredQuestion>();

        for (Question question : test.getQuestions()) {
            int answerAmount = question.getAnswers().size();
            AnsweredQuestion answeredQuestion = new AnsweredQuestion(answerAmount);
            answeredQuestionS.add(answeredQuestion);
        }
    }

    public void registerAnswer(int questionIndex, int answerIndex) {
        answeredQuestionS.get(questionIndex).chooseAnswer(answerIndex);
    }

    public boolean checkAnswer(int questionIndex, int answerIndex) {
        return answeredQuestionS.get(questionIndex).isChoice(answerIndex);
    }

    public float[] getScoredArray() {
        float[] scoredArray = new float[answeredQuestionS.size()];

        for (int i = 0; i < answeredQuestionS.size(); i++) {
            AnsweredQuestion answeredQuestion = answeredQuestionS.get(i);
            int answers = answeredQuestion.getAnswerCount();
            int correctAnswers = 0;
            for (int j = 0; j < answers; j++) {
                boolean isChecked  = answeredQuestion.isChoice(i);
                boolean isCorrect = test.getQuestions().get(i).getAnswers().get(j).isCorrect();
                if (isChecked && isCorrect || !isChecked && !isCorrect) {
                    correctAnswers++;
                }
            }
            scoredArray[i] = (float) correctAnswers / answers * test.getQuestions().get(i).getScore();
        }
        return scoredArray;
    }

    private static class AnsweredQuestion {
        boolean[] answered;
        AnsweredQuestion(int answerAmount) {
            answered = new boolean[answerAmount];
        }

        void chooseAnswer(int number) {
            answered[number] = true;
        }

        boolean isChoice(int number) {
            return answered[number];
        }

        int getAnswerCount() {
            return answered.length;
        }
    }
}
