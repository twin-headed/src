package ch02;

class Foo {
	public static String classVar = "I class var";
	public String instanceVar = "I instance var";
	public static void classMethod() {
		System.out.println(classVar); // Ok
//		System.out.println(instanceVar); //Error
	}
	public void instaceMethod() {
		System.out.println(classVar); // Ok
		System.out.println(instanceVar); //OK
	}
	Foo() {}
	public Foo(String instanceVar) {
		this.instanceVar = instanceVar;
	}
	
	
	
}

public class Rhombus {
	public static void main(String[] args) {
		
		System.out.println(Foo.classVar); // OK
//		System.out.println(Foo.instanceVar); //Error
		Foo.classMethod();
//		Foo.instanceMethod(); //Error
		Foo f1 = new Foo("ok");
		System.out.println(f1.instanceVar);
		Foo f2 = new Foo();
		System.out.println(f2.instanceVar);
		// 클래스의 변수의 값이 바뀌면 모든 인스턴스의 해당 변수값이 바뀐다.
		// 인스턴스에서 클래스 멤버변수를 바꿀수도 있는데 그러면 또 모든 인스턴스의 해당변수값이 바뀐다.
		// 인스턴스에서 인스턴스변수를 바꾸면 해당 인스턴스에만 영향이 있을뿐 클래스와 타 인스턴스에는 영향이 가지않는다.
	
		
		
		
		
		
	}
}
