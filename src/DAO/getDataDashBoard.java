package DAO;

public class getDataDashBoard {
	public int countEMP()
	{
		queryDAO dao = new queryDAO();
		int a= dao.countEmployee();
		System.out.print(a);
		return a;
	}
	public int countUSER()
	{
		queryDAO dao = new queryDAO();
		int a= dao.countUser();
		return a;
	}
	public int countOtherDetail()
	{
		queryDAO dao = new queryDAO();
		int a= dao.countOtherDetail();
		return a;
	}
	public int countSubTotal()
	{
		queryDAO dao = new queryDAO();
		int a= dao.countSubTotal();
		return a;
	}
	public int[] pieChart()
	{
		queryDAO dao = new queryDAO();
		int[] a= dao.countPie();
		return a;
	}
}
