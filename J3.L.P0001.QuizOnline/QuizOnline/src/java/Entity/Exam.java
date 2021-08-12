/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.List;

/**
 *
 * @author khanh
 */
public class Exam {
    private int numOfQues;
    private List<Question> listQues;

    public Exam() {
    }

    public Exam(int numOfQues, List<Question> listQues) {
        this.numOfQues = numOfQues;
        this.listQues = listQues;
    }

    public int getNumOfQues() {
        return numOfQues;
    }

    public void setNumOfQues(int numOfQues) {
        this.numOfQues = numOfQues;
    }

    public List<Question> getListQues() {
        return listQues;
    }

    public void setListQues(List<Question> listQues) {
        this.listQues = listQues;
    }
    
    
}
