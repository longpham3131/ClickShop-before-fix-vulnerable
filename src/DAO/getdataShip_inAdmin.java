package DAO;

public class getdataShip_inAdmin {
	public int countNeedShipper()
	{
		queryDAO dao = new queryDAO();
		int a= dao.countNeedShipper();
		return a;
	}
	public int countInShipping()
	{
		queryDAO dao = new queryDAO();
		int a= dao.countInShipping();
		return a;
	}
	public int countPickingUP()
	{
		queryDAO dao = new queryDAO();
		int a= dao.countPickingUP();
		return a;
	}
	public int countShipper()
	{
		queryDAO dao = new queryDAO();
		int a= dao.countShipper();
		return a;
	}
}
