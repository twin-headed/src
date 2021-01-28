package spring.mvc.annotation;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {
	public static void main(String[] args) {
		AbstractApplicationContext factory = new GenericXmlApplicationContext("aopContext_02.xml");
		
		Member member = (Member) factory.getBean("member");
		System.out.println("=== Annotation Aop를 이용한 <Member 정보> ===");
		member.getMemberInfo();
		
		Worker worker = (Worker) factory.getBean("worker");
		System.out.println();
		System.out.println("=== Annotation Aop를 이용한 <Worker 정보> ===");
		worker.showInfo();
	}
}
