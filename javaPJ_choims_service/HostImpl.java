package javaPJ_choims_service;

public class HostImpl implements Host{

	private static HostImpl instance = new HostImpl();
	
	private HostImpl() {}
	
	@Override
	public void bookList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void bookAdd() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void bookUpdate() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void bookDel() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void orderList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void orderConfirm() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void orderCancel() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saleTotal() {
		// TODO Auto-generated method stub
		
	}
	
	public static HostImpl getInstance() {
		return instance;
	}
	
	
}
