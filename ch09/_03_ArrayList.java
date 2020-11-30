package ch09;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class _03_ArrayList {
	public static void main(String[] args) {
		
		List<_03_Book> library = new ArrayList<_03_Book>();
		
		library.add(new _03_Book("태백산맥","조정래"));
		library.add(new _03_Book("데미안","헤르만해세"));
		library.add(new _03_Book("어떻게 살것인가","유시민"));
		library.add(new _03_Book("토지","박경리"));
		library.add(new _03_Book("어린왕자","생택쥐패리"));
		
		for(int i=0; i<library.size(); i++) {
			_03_Book book = library.get(i);
			book.showBookInfo();
		}
		
		System.out.println("========");
		
		for(_03_Book book : library) {
			book.showBookInfo();
		}
		
		System.out.println("========");
		
		Iterator iterator = library.iterator();
		while(iterator.hasNext()) {
			_03_Book book = (_03_Book)iterator.next();
			book.showBookInfo();
		}
		
		System.out.println("끝");
		System.out.println(library);
				
		
	}
}
