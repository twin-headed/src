package javaPJ_choims_view;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Sfeawh {
public void start() {
        
        int number1 = 0;
        int number2 = 0;
        int number3 = 0;
        
        int currentStatus = 1;
        System.out.println("정수를 입력하세요!");
        Scanner input = new Scanner(System.in);
        int number=0;
        
        //사용자가 정수를 입력할 때 까지 반복한다.
        while (true){
            //예외가 발생할지 아닐지 모르지만, 우선 실행해본다.
            try { 
                //예외가 발생할 가능성이 있는 코드를 입력
                switch ( currentStatus ) {
                case 1 :
                    System.out.println("1번수");
                    number1 = input.nextInt();
                    currentStatus = 2;
                case 2 :
                    System.out.println("2번수");
                    number2 = input.nextInt();
                    currentStatus = 3;
                case 3 :
                    System.out.println("3번수");
                    number3 = input.nextInt();
                    currentStatus = 1;
                }
                number = input.nextInt();
                break;
            }
            
            //try 내부의 코드가 InputMismatchException 을 던진다면, 예외를 받아온다.
            //catch가 실행되는 동안은 Program 이 종료되지 않는다.
            catch ( InputMismatchException ime) {
                //스캐너의 버그를 해결하기 위한 코드
                input = new Scanner(System.in);
                System.out.println("잘못 입력했씁니다. 정수만 입력가능");
                
                /**
                 * 쓰면 안되는 코드
                 * 예외의 구체적인 정보를 알고싶을때 쓴다.
                 * 구체적인 정보를 알고 난뒤에는 반드시 지워야한다.
                 */
                ime.printStackTrace();
                
                // 애용해야하는 코드
                // 어떤 예외가 어떻게 발생했는지 간략히 알려준다
                System.out.println(ime.getClass().getName() + "예외가 " + ime.getMessage() + "때문에 발생했습니다.");
            }
        }    
            System.out.println("당신이 입력한 정수는 " + number + "입니다.");
    }
    
    public static void main(String[] args) {
        
    	Sfeawh test = new Sfeawh();
        test.start();
 
    }


}
