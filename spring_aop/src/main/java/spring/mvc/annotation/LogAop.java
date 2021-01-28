package spring.mvc.annotation;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

// 횡단관심 클래스(공통클래스)
@Aspect
public class LogAop {
	
	// 참조메서드이며, 단순히 포인트컷을 식별하는 이름으로만 사용
	// 참조메서드는 메서드 몸체가 비어있는 즉  구현로직이 없는 메서드
	@Pointcut("execution(* spring.mvc.annotation.*.*(..))")
	private void allPointCut() {};
	
	@Around("allPointCut()")
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
