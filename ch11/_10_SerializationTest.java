package ch11;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

/* p550
	 * 직렬화
	 * -인스턴스의 정보를 그대로 저장하거나 네크워크를 통해 전송
	 * -인스턴스의 내용(인스턴스 변수값)을 연속 스트림으로 만드는 것이다.
	 * -스트림으로 만들어야 파일에 쓸수 있고, 네트워크로 전송할 수 있다.
	 * -implements Serializable : 직렬화 구현
	 * -transient : 해당 인스턴스변수는 직렬화나 복원과정에서 제외
	 * 
	 *  역직렬화
	 *  - 저장된 내용이나 전송받은 내용을 다시 복원하는 것
	 */
	class Person implements Serializable{
		private static final long serialVersionUID = -1503252402544036183L;
		String name;
		String job;
		
		public Person() {}
		
		public Person(String name, String job) {
			this.name = name;
			this.job = job;
		}
		
		@Override
		public String toString() {
			return name + " , " + job;
		}
		
			
	}
	
	public class _10_SerializationTest {
		public static void main(String[] args) throws ClassNotFoundException{
			Person personAhn = new Person("안재용","대표이사");
			Person personKim = new Person("김철수","상무이사");
			
			try(FileOutputStream fos = new FileOutputStream("serial.out");
					ObjectOutputStream oos = new ObjectOutputStream(fos)) { 
				
			} catch(IOException e) {
				e.printStackTrace();
			}
			try(FileInputStream fis = new FileInputStream("serial.out");
					ObjectInputStream ois = new ObjectInputStream(fis)) {
				Person p1 = (Person)ois.readObject();
				Person p2 = (Person)ois.readObject();
				
				System.out.println(p1);
				System.out.println(p2);
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
	
	
}
