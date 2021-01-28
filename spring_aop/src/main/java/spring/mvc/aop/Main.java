package spring.mvc.aop;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {
	public static void main(String[] args) {
		AbstractApplicationContext factory = new GenericXmlApplicationContext("aopContext_01.xml");
		
		Member member = (Member) factory.getBean("member");
		System.out.println("=== 핵심관심 <Member 정보> ===");
		member.getMemberInfo();
		
		Worker worker = (Worker) factory.getBean("worker");
		System.out.println();
		System.out.println("=== 핵심관심 <Worker 정보> ===");
		worker.showInfo();
	}
}
