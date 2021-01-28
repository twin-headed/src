package com.spring.mvcbasic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/*
 * p332 그림 6-2 면접문제 : 맨앞 : DispatcherServlet
 * 
 * 1. 컨트롤러 클래스 제작
 * 
 * (1) 프로세스
 * 최초 클라이언트로부터 요청이 들어왔을 때 DispatcherServlet(web.xml)을 통해 컨트롤러로 진입하게 된다.
 * 그리고 컨트롤러는 요청에 대한 작업을 처리한 후, 뷰쪽으로 데이터를 전달한다.
 * 
 * 1) web.xml -> 2) DispatcherServlet -> 3) servlet-context.xml(component-scan) : 3-1) @Controller -> 2) @Service -> 3) @Repository
 * 									: 컨테이너가 base-package에 있는 클래스들을 자동으로 객체생성(단 클래스들은 @Component 지정)
 * 								-> 4) servlet-context.xml(ViewResolver) -> view(jsp)
 * 
 * - DispatcherServlet : 유일한 서블릿 클래스로서 모든 클라이언트의 요청을 가장 먼저 처리하는 Front Controller
 * - HandlerMapping : 클라이언트의 요청을 처리한 Controller들의 매핑이며, 스프링에서는 @RequestMapping을 이용하여 HandlerMapping 설정을 대체한다.
 * - Controller : 실질적인 클라이언트의 요청 처리
 * - ViewResolver : Controller가 리턴한 View이름이며, 실행될 JSP 경로를 완성
 * 
 * (2) 컨트롤러 클래스 제작 순서
 * ㄱ. @Controller를 이용한 클래스 생성
 * ㄴ. @RequestMapping을 이용한 요청경로 지정
 * ㄷ. 서비스 호출
 * ㄹ. 뷰 이름 리턴
 * 
 * 2. 서비스 클래스 제작
 * 	  클라이언트의 요청처리 메서드 구현(비즈니스 로직 구현)
 * 
 * 3. 뷰에 데이터를 전달
 * 	   서비스에서 로직을 수행한 후 뷰페이지로 반환한다,
 *    이 때 뷰에서 사용하게 될 데이터를 객체로 전달(=model)할 수 있다.
 *    -> JSP에서 EL태그로(${key})값을 전달받는다.
 *    
 * 	방법1. Model 클래스를 이용한 데이터 전달
 * 	방법2. ModelAndView 클래스를 이용한 데이터 전달
 */


@Controller
public class MyController {
	
	// 방법1. Model 클래스를 이용한 데이터 전달
	@RequestMapping("content")		// http://localhost/mvcbasic/content
	public String content(Model model) {
		System.out.println("url ==> content");
		
		// 뷰쪽으로 데이터를 넘기기 위해 모델 객체에 데이터를 설정
		// model.addAttribute("key", "value")
		model.addAttribute("id", "park");
		model.addAttribute("pwd", "park1234");
		model.addAttribute("address", "구로구");
		model.addAttribute("email", "aaaa@bbbb");
		
		// 뷰이름 설정 = prefix 				+ 뷰 			   + suffix
		//		/WEB-INF/views/         + test/content + .jsp
		return "test/content";
	}
	
	// 방법2. ModelAndView 클래스를 이용한 데이터 전달
	@RequestMapping("member")
	public ModelAndView member() {
		System.out.println("url ==> member()");
		
		ModelAndView mv = new ModelAndView();
		// 뷰쪽으로 데이터를 넘기기 위해 모델 객체에 데이터를 설정
		// mv.addObject("key", "value");
		mv.addObject("id", "kim");
		mv.addObject("birth", "19990101");
		mv.addObject("company", "korea");
		mv.addObject("salary", "50000");
		// 뷰이름 설정
		mv.setViewName("test/member");
		
		// Model과 View를 같이 반환
		return mv;
	}
	
	
}

