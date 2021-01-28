package spring.mvc.aop;

import org.aspectj.lang.ProceedingJoinPoint;

// 횡단관심 클래스(공통클래스)
public class LogAop {

	public void loggerAop(ProceedingJoinPoint joinpoint) {
		
		// 핵심관심클래스.메서드 정보 가져오기
		String signatureStr = joinpoint.getSignature().toShortString();	// Member.getMemberInfo() 가져오기
		
		System.out.println(signatureStr + " is start");
		long st = System.currentTimeMillis();	// 비즈니스 메서드 시작시간
		
		try {
			// 핵심관심 호출
			joinpoint.proceed(); // Member.getMemberInfo() 호출
			
		} catch (Throwable e) {
			e.printStackTrace();
		} finally {
			// 공통기능(횡단관심) 실행 종료
			long et = System.currentTimeMillis();	// 비즈니스 메서드 종료시간
			System.out.println(signatureStr + " is end!!");
			System.out.println(signatureStr + " 경과시간 : " + (et - st));
		}
		
	}
	
}
