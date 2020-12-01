package choi;

public class _08_Main {
	public static void main(String[] args) {
		_08_GenericPrinter<_08_Plastic> gp = new _08_GenericPrinter<_08_Plastic>();
		
		gp.setMaterial(new _08_Plastic());
		_08_Plastic gd = gp.getMaterial();
		gd.doPrinting();
	}
}
