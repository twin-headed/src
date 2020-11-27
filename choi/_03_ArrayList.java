package choi;

import java.util.ArrayList;
import java.util.Iterator;

//	p224 ctrl+shift+o 자동임포트
public class _03_ArrayList {
	public static void main(String[] args) {
		
		ArrayList<_03_Book> library = new ArrayList<_03_Book>();
		
		library.add(new _03_Book("태백산맥", "조정래"));
		library.add(new _03_Book("데미안", "헤르만헤세"));
		library.add(new _03_Book("어떻게살것인가", "유시민"));
		library.add(new _03_Book("토지", "박경래"));
		library.add(new _03_Book("어린왕자", "생택쥐페리"));
		
		for(int i=0; i<library.size(); i++) {
			_03_Book book = library.get(i);
			book.showBookInfo();
		}
		System.out.println("=============");
		for(_03_Book book : library) {
			book.showBookInfo();
		}
		System.out.println("=============");
		Iterator iterator = library.iterator();
		while(iterator.hasNext()) {
			_03_Book book = (_03_Book) iterator.next();
			book.showBookInfo();
		}
	}
}
