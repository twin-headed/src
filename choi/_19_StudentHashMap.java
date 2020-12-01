package choi;

import java.util.HashMap;

public class _19_StudentHashMap {
	HashMap<Integer,_19_Student> hashmap;
	
	public _19_StudentHashMap() {
		hashmap = new HashMap<Integer, _19_Student>();
	}
	
	public void addStudent(_19_Student student) {
		hashmap.put(student.getStudentId(), student);
	}
	
	public boolean removeStudent(int studentId) {
		if(hashmap.containsKey(studentId)) {
			hashmap.remove(studentId);
			return true;
		}else 
			System.out.println("아이디를 찾을수 없습니다.");
			return false;
	}
}
