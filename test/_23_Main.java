package test;

import java.util.Scanner;

public class _23_Main {

	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {

		try{
			inputMethod();
		}catch(_23_InvalidHakbunException e){
			System.out.println(e.getMessage());
			e.showWrongHakbun();
		}catch(_23_InvalidScoreException e){
			System.out.println(e.getMessage());
			e.showWrongScore();
		}finally{
			System.out.println("종료");
			sc.close();
		}
	
	}

	static _23_StudentInfo inputMethod() throws _23_InvalidHakbunException, _23_InvalidScoreException{
		String hakbun = inputHakbun();
		int score = inputScore();
		_23_StudentInfo student = new _23_StudentInfo(hakbun, score);
		student.showStudentInfo();
		return student;
	}

	static String inputHakbun() throws _23_InvalidHakbunException{
		System.out.println("학번을 입력하세요");
		String hakbun = sc.next();
		if(hakbun.length() != 4) {
			_23_InvalidHakbunException ihe = new _23_InvalidHakbunException("학번은 4자리입니다.");
			ihe.setWrongHakbun(hakbun);
			throw ihe;
		}return hakbun;
	}

	static int inputScore() throws _23_InvalidScoreException {
		System.out.println("점수를 입력하세요");
		int score = sc.nextInt();
		if(score<0 || score>100) {
			_23_InvalidScoreException ise = new _23_InvalidScoreException("점수는 0~100점 사이입니다.");
			ise.setWrongScore(score);
			throw ise;
		}return score;
	}

}