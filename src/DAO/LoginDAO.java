package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.model.Account;
import DB.MyDB;

// // query here <
public class LoginDAO {
	Connection conn = null;  // open connect to sql server
	PreparedStatement ps = null; // send query from ide to sqlserver
	ResultSet rs = null;  
	
	public boolean checkRole(String email, String role)
	{
		try {
			System.out.println("~~~ 2.31 ~~~~  ");
			String query= "select * from AccountRole where Email='"+email+"' and Role='"+role+"'";
			System.out.println(query);
			System.out.println(email + role);
			conn = new  MyDB().getConnection(); 
			System.out.println("~~~ After db ~~~~  ");
			ps = conn.prepareStatement(query);			
			rs = ps.executeQuery();	
			System.out.println("~~~ After db ~~~~  ");
			System.out.println(rs);
			while(rs.next())
			{
				return true;
			}
			System.out.println("Return Truee");
			} catch (Exception e) { System.out.println(e); System.out.println("~~~ 2.3 ~~~~  ");
		}

		return false;
	}
	public Account checkLogin(String email, String pass)
	{

		try {
			String query= "select * from Account where Email=? and Password=?";
			
			conn = new  MyDB().getConnection(); // sai o day
			ps = conn.prepareStatement(query);			
			ps.setString(1, email);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				Account a = new Account(rs.getString(1), rs.getString(2));
				return a;
			}
			} catch (Exception e) { System.out.println(e);
		}
		return null;
	}

    public String login(String email, String pass)
    {
        try {
			String query2 = "SELECT isAvailable FROM Account WHERE Email = '"+email+"'";
			Connection conn2 = new  MyDB().getConnection();
			PreparedStatement ps2 = conn2.prepareStatement(query2);
			ResultSet rs2 = ps2.executeQuery();
			System.out.println("ALAAAA");
			if (rs2.next())
			{
				if (rs2.getString(1).equals("0"))
					return "BAN";
				System.out.println(rs2.getString(1) );
			}
			System.out.println("DAdasD         f");
            String query= "SELECT [dbo].[KienTraDangNhap] ('"+email+"','"+pass+"')";
            conn = new  MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while(rs.next())
            {
                return rs.getString(1);
            }
        } catch (Exception e) { System.out.println(e);
        }
        return "fix";
    }
	
}
