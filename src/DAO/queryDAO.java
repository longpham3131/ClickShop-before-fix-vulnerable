package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DB.MyDB;
import com.model.*;
import com.sun.org.apache.bcel.internal.generic.Select;


public class queryDAO {

    Connection conn = null;
    Statement stmt = null;
    PreparedStatement ps = null;
    CallableStatement clmt = null;
    ResultSet rs = null;
    ResultSet rs2 = null;

    public boolean insertAccount(String email, String firstName, String lastName,
                                 String phone, String address, String gender, String dateBirth, String role) {

        try {
//        String sqlBgTran =  "BEGIN TRANSACTION SAVE TRANSACTION Tran_InsertUpdateAccountRole ";
            String sqlExec = "{ Call USP_TaoUser (?,?,?, ?, ?, ?, ?, ?) }";
//        String sqlCommit = " COMMIT";
            conn = new MyDB().getConnection();
            clmt = conn.prepareCall(sqlExec);
            //   System.out.println("-++++++++++++++0+++++++++++++-");
            clmt.setString(1, email);
            clmt.setString(2, firstName);
            clmt.setString(3, lastName);
            clmt.setString(4, phone);
            clmt.setString(5, address);
            clmt.setString(6, gender);
            clmt.setString(7, dateBirth);
            clmt.setString(8, role);
            // System.out.println("-++++++++++++++1+++++++++++++-");
            clmt.execute();
            // System.out.println("-++++++++++++++2+++++++++++++-");

            //  System.out.println("-++++++++++++++3+++++++++++-");
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean registed(String email, String pass, String firstName, String lastName,
                            String phone, String address, String gender, String dateBirth) {
        try {

            String sqlExec = "{ Call USP_DangKy (?,?,?, ?, ?, ?, ?, ?) }";

            conn = new MyDB().getConnection();

            conn.setAutoCommit(false);

            clmt = conn.prepareCall(sqlExec);
            clmt.setString(1, email);
            clmt.setString(2, pass);
            clmt.setString(3, firstName);
            clmt.setString(4, lastName);
            clmt.setString(5, phone);
            clmt.setString(6, address);
            clmt.setString(7, gender);
            clmt.setString(8, dateBirth);
            clmt.execute();
            conn.commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean deleteAccount(String email) {  // isAvailable = 0
        try {

            String query2 = "update Account set isAvailable='0'  WHERE Email='" + email + "'";
            System.out.println(query2);
            conn = new MyDB().getConnection();
            System.out.println(query2);
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean blockProduct(String id) {  // isAvailable = 0
        try { // delete Role truoc, vi no co khoa ngoai
            //String query2 = "delete from AccountRole where email='" + email + "'";
            String query2 = "update Product set Available='0'  WHERE ProductId='" + id + "'";
            System.out.println(query2);
            conn = new MyDB().getConnection();
            System.out.println(query2);
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean unBlockAccount(String email) {  // isAvailable = 0
        try {

            String query2 = "update Account set isAvailable='1'  WHERE Email='" + email + "'";
            System.out.println(query2);
            conn = new MyDB().getConnection();
            System.out.println(query2);
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean unBlockProduct(String id) {  // isAvailable = 0
        try {
            String query2 = "update Product set Available='1'  WHERE ProductId='" + id + "'";
            System.out.println(query2);
            conn = new MyDB().getConnection();
            System.out.println(query2);
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean resetPass(String email) {  // isAvailable = 0
        try { // delete Role truoc, vi no co khoa ngoai
            //String query2 = "delete from AccountRole where email='" + email + "'";
            String query2 = "update Account set Password='clickshop123aA@'  WHERE Email='" + email + "'";
            System.out.println(query2);
            conn = new MyDB().getConnection();
            System.out.println(query2);
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean updateAccount(String email, String firstName, String lastName,
                                 String phone, String address, String gender, String dateBirth) {
        //  Connection conn1 = null;
        //  CallableStatement cs = null;
        try {
            String query = "{Call USP_CapNhatUser(?,?,?,?,?,?,?)}";

            conn = new MyDB().getConnection();
            conn.setAutoCommit(false);
            clmt = conn.prepareCall(query);
            clmt.setString(1, email);
            clmt.setString(2, firstName);
            clmt.setString(3, lastName);
            clmt.setString(4, phone);
            clmt.setString(5, address);
            clmt.setString(6, gender);
            clmt.setString(7, dateBirth);
            clmt.execute();
            conn.commit();
            System.out.println("------------------------------------");
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean accountExists(String email) {
        try {
            String query = "{  ? = call UF_KiemTraTonTai(?)}";
            conn = new MyDB().getConnection();
            clmt = conn.prepareCall(query);

            clmt.registerOutParameter(1, Types.INTEGER);
            clmt.setString(2, email);
            clmt.execute();

            int result = clmt.getInt(1);

            if (result == 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean productIDExists(String id) {
        String query = "select * from Product where ProductId='" + id + "'";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            if (rs.next()) {
                return true; // co ton tai email nay trong dbo.Account
            }
            return false;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public List<Article> paging() {
        String query = "SELECT Account.*, AccountRole.Role FROM  Account, AccountRole where Account.Email = AccountRole.Email";
        List<Article> list = new ArrayList<Article>();
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Article(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(14)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    // ------------------ END ACCOUNT ---------------//
    // ------------------ START DISPLAY ---------------//

    public List<Display> hienthi(int index) {
        String query = "SELECT Product.ProductId, Product.Name,Product.UnitPrice , Image.ImagePath, Product.Description, Product.SubCategoryId , SubCategory.CategoryId " +
                "FROM dbo.Product ,dbo.[Image],dbo.SubCategory " +
                "WHERE Product.ProductId = Image.ProductId AND Product.SubCategoryId = SubCategory.SubCategoryId";
        List<Display> listSanpham = new ArrayList<Display>();
        try {

            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listSanpham.add(new Display(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            return listSanpham;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Display> filterSanpham(String name) {
        String query = "SELECT Product.ProductId, Product.Name,Product.UnitPrice , Image.ImagePath, Product.Description, Product.SubCategoryId , SubCategory.CategoryId " +
                "FROM dbo.Product ,dbo.[Image],dbo.SubCategory " +
                "WHERE Product.ProductId = Image.ProductId AND Product.SubCategoryId = SubCategory.SubCategoryId AND SubCategory.Name = '" + name + "'";
        List<Display> listLoc = new ArrayList<Display>();
        try {

            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listLoc.add(new Display(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            return listLoc;
        } catch (Exception e) {
        }
        return null;
    }
    public List<Display> filterSapxep(String name,String type) {
        String query = "SELECT Product.ProductId, Product.Name,Product.UnitPrice , Image.ImagePath, Product.Description, Product.SubCategoryId , SubCategory.CategoryId " +
                "FROM dbo.Product ,dbo.[Image],dbo.SubCategory " +
                "WHERE Product.ProductId = Image.ProductId AND Product.SubCategoryId = SubCategory.SubCategoryId AND SubCategory.Name = '" + name + "'"
                +"ORDER BY UnitPrice " + type;
        List<Display> listSapxep = new ArrayList<Display>();
        try {

            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listSapxep.add(new Display(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            return listSapxep;
        } catch (Exception e) {
        }
        return null;
    }

    public int getNumberPage() {
        String query = "SELECT COUNT(*) FROM dbo.Product ";
        try {

            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 12;
                if (total % 12 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Display> getPaging(int index) {
        String query = "SELECT Product.ProductId, Product.Name,Product.UnitPrice , Image.ImagePath, Product.Description, Product.SubCategoryId , SubCategory.CategoryId, Product.Available \n" +
                "FROM dbo.Product ,dbo.[Image],dbo.SubCategory \n" +
                "WHERE Product.ProductId = Image.ProductId AND Product.SubCategoryId = SubCategory.SubCategoryId\n" +
                "ORDER BY ProductId \n" +
                "OFFSET ? ROWS \n" +
                "FETCH FIRST 12 ROWS ONLY;";
        List<Display> listPhantrang = new ArrayList<Display>();
        try {

            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 12);
            rs = ps.executeQuery();
            while (rs.next()) {
                listPhantrang.add(new Display(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            return listPhantrang;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Display> getPagingSort(int index, String sapxep) {
        String query = "SELECT Product.ProductId, Product.Name, Product.UnitPrice , Image.ImagePath, Product.Description, Product.SubCategoryId , SubCategory.CategoryId, Product.Available\n" +
                "FROM dbo.Product ,dbo.[Image],dbo.SubCategory\n" +
                "WHERE Product.ProductId = Image.ProductId AND Product.SubCategoryId = SubCategory.SubCategoryId\n" +
                "ORDER BY UnitPrice " + sapxep + "\n" +
                "OFFSET ? ROWS \n" +
                "FETCH FIRST 12 ROWS ONLY";
        List<Display> listSapxeptatca = new ArrayList<Display>();
        try {

            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 12);
            rs = ps.executeQuery();
            while (rs.next()) {
                listSapxeptatca.add(new Display(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            return listSapxeptatca;
        } catch (Exception e) {
        }
        return null;
    }


    // ------------------ END DISPLAY ---------------//

    // ------------------ START PRODUCT ---------------//

    public List<Article1> sanpham() {
        String query = "SELECT pro.*, img.ImagePath FROM dbo.Product pro, dbo.Image img WHERE pro.ProductId = img.ProductId ";
        List<Article1> list1 = new ArrayList<Article1>();
        try {

            conn = new MyDB().getConnection();
            Statement stmt = null;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                Connection conn2 = null;
                List<ProductSize> listprodsz = new ArrayList<ProductSize>();
                String query2 = "SELECT pz.ProductSizeId,pz.Size,pz.Available FROM ProductSize pz WHERE ProductID =" + rs.getString(1);
                conn2 = new MyDB().getConnection();
                Statement stmt2 = null;
                stmt2 = conn2.createStatement();

                rs2 = stmt2.executeQuery(query2);
                while (rs2.next()) {
                    listprodsz.add(new ProductSize(rs2.getString(1), rs2.getString(2), rs2.getString(3)));
                }
                list1.add(new Article1(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), listprodsz));
            }
            return list1;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Category> listcategory() {
        String query = "SELECT * FROM  dbo.SubCategory";
        List<Category> list = new ArrayList<Category>();
        try {

            Statement stmt = null;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {

                list.add(new Category(rs.getString(1), rs.getString(3)));

            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public String getProductSizeId(String productId, String name, String available) {
        String query = "Select pz.ProductSizeId,pz.Size,pz.Available  from ProductSize pz where ProductID =" + productId + "  and Size ='" + name + "' and Available = " + available;
        String data = "";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = rs.getString(1);
            }
            return data;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean insertProduct(String subcategory, String name, String img, int unitprice,
                                 String gender, String description, String available) {
        Connection conn1 = null;
        CallableStatement clsm = null;
        ResultSet rs = null;
        try {
            String query = "{ Call PSP_ThemSP(?,?,?,?,?,?,?)}";

            conn1 = new MyDB().getConnection();
            clsm = conn1.prepareCall(query);

            clsm.setString(1, subcategory);
            clsm.setString(2, name);
            clsm.setString(3, img);
            clsm.setInt(4, unitprice);
            clsm.setString(5, gender);
            clsm.setString(6, description);
            clsm.setString(7, available);
            clsm.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean insertProductSize(String productSizeId, String name, String available) {
        Connection conn1 = null;
        CallableStatement clsm = null;
        ResultSet rs = null;
        try {
            String query = "{ Call PSP_ThemSizeSanPham(?,?,?)}";
            conn1 = new MyDB().getConnection();
            clsm = conn1.prepareCall(query);
            clsm.setString(1, productSizeId);
            clsm.setString(2, name);
            clsm.setString(3, available);
            clsm.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean deleteProductSize(String productsizeid) {
        try {
            String query = "delete from ProductSize where ProductSizeId =" + productsizeid;
            conn = new MyDB().getConnection();
            System.out.println(query);
            ps = conn.prepareStatement(query);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public List<ProductSize> getAllSizeById(String productid) {
        List<ProductSize> listprodsz = new ArrayList<ProductSize>();
        String query = "select * from Productsize where ProductID =" + productid;
        try {

            Statement stmt = null;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {

                listprodsz.add(new ProductSize(rs.getString(1).trim(), rs.getString(3).trim(), rs.getString(4).trim()));

            }
            return listprodsz;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean productExists(String productid) {
        String query = "select * from Product where ProductId=?";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productid);
            rs = ps.executeQuery();

            if (rs.next()) {
                return true; // co ton tai productid nay trong dbo.product
            }
            return false;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean deleteProduct(String productid) { // khong xai` vi anh huong toi don dat hang
        try { // delete Role truoc, vi no co khoa ngoai
            String query2 = "delete from PriceHistory where productid='" + productid + "'";
            conn = new MyDB().getConnection();
            System.out.println(query2);
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();

            String query3 = "delete from Image where productid='" + productid + "'";
            conn = new MyDB().getConnection();
            System.out.println(query3);
            ps = conn.prepareStatement(query3);
            ps.executeUpdate();

            String query4 = "delete from Comment where productid='" + productid + "'";
            conn = new MyDB().getConnection();
            System.out.println(query4);
            ps = conn.prepareStatement(query4);
            ps.executeUpdate();

            String query = "delete from Product where productid='" + productid + "'";
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean updateProduct(String productid, String subcategory, String name, String img, int unitprice, String gender,
                                 String description, String available) {
        Connection conn1 = null;
        CallableStatement clsm = null;
        ResultSet rs = null;
        try {
            String query = "{ Call PSP_CapNhatSanPham(?,?,?,?,?,?,?,?)}";
            conn1 = new MyDB().getConnection();
            clsm = conn1.prepareCall(query);
            clsm.setString(1, productid);
            clsm.setString(2, subcategory);
            clsm.setString(3, name);
            clsm.setString(4, img);
            clsm.setInt(5, unitprice);
            clsm.setString(6, gender);
            clsm.setString(7, description);
            clsm.setString(8, available);
            clsm.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean updateProductSize(String productSizeId, String name, String available) {
        Connection conn1 = null;
        CallableStatement clsm = null;
        ResultSet rs = null;
        try {
            String query = "{ Call PSP_CapNhatSizeSanPham(?,?,?)}";
            conn1 = new MyDB().getConnection();
            clsm = conn1.prepareCall(query);
            clsm.setString(1, productSizeId);
            clsm.setString(2, name);
            clsm.setString(3, available);
            clsm.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    // ------------------ END PRODUCT ---------------//

    // ------------------ START ORDER ---------------//
    public List<OrderList> donhang(int index) {
        String query = "SELECT VIE.*, Pur.Status,  Pur.CancelInvoice  FROM dbo.OV_OrderView VIE, PurchaseOrder Pur WHERE VIE.PurchaseOrderId = Pur.PurchaseOrderId";
        List<OrderList> listDon = new ArrayList<OrderList>();
        try {

            conn = new MyDB().getConnection();
            stmt = conn.createStatement();

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                listDon.add(new OrderList(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
            return listDon;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean updateOrder(String purchaseorderid, String address, String phone) {
        Connection conn1 = null;
        CallableStatement clsm = null;
        ResultSet rs = null;
        try {
            String query = "{ Call OSP_CapNhanDonHang(?,?,?)}";
            System.out.println(query);
            conn1 = new MyDB().getConnection();
            clsm = conn1.prepareCall(query);

            clsm.setString(1, purchaseorderid);
            clsm.setString(2, address);
            clsm.setString(3, phone);
            clsm.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean updateOrderDetail(String purchaseorderdetailid, String purchaseorder, String productid, String
            quantity, String unitprice,
                                     String subtotal) {
        Connection conn1 = null;
        CallableStatement clmst = null;
        ResultSet rs = null;
        try {
            String query = "{ CALL dbo.OSP_CapNhatChiTiet(?,?,?,?,?,?)}";

            System.out.println(query);
            conn1 = new MyDB().getConnection();
            clmst = conn1.prepareCall(query);
            clmst.setString(1, purchaseorderdetailid);
            clmst.setString(2, purchaseorder);
            clmst.setString(3, productid);
            clmst.setString(4, quantity);
            clmst.setString(5, unitprice);
            clmst.setString(6, subtotal);
            clmst.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    // ----------------- DASH BOARD ---------------- //
    public int countEmployee() {

        // String query = "Select * From CountNV()";
        String query = "select count(*) as SoluongNV from AccountRole where Role= 'Shipper' OR Role ='Saler'";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int countUser() {
        String query = "select count(*) from AccountRole WHERE (Role='USER')";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int countOtherDetail() {
        String query = "select count(*) from PurchaseOrder WHERE (CancelInvoice='TRUE' AND Status='Completed')";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int countSubTotal() {
        String query = "select SUM(SubTotal) from PurchaseOrder";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int[] countPie() {
        String query = "select soLanMua from DemTheoCategory() ORDER BY CategoryId ASC";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<String> list = new ArrayList<String>();
            while (rs.next()) {
                String val = rs.getString(1);
                list.add(val);
            }

            String[] pies = new String[list.size()];
            System.out.println("Contents of list ::" + list);
            //list.toArray(pies);
            pies = (String[]) list.toArray(new String[list.size()]);
            int[] pie = new int[pies.length];
            for (int i = 0; i < pies.length; i++) {
                pie[i] = Integer.parseInt(pies[i]);
            }
            return pie;
        } catch (Exception e) {
            System.out.println("  bug  ");
            System.out.println(e);
        }
        return null;
    }

    // -----------------END DASH BOARD ---------------- //

    // -------------------- Ship in Admin -------------------------//

    //----- fill 4 o dau -------//
    public int countNeedShipper() {
        String query = "select Count(PurchaseOrderId) from PurchaseOrder Where Status='Init'";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int countInShipping() {
        String query = "select Count(S.PurchaseOrderId) from Shipper S, PurchaseOrder PO Where (S.Status='shipping' OR S.Status='Cancel' OR S.Status='Completed') AND PO.PurchaseOrderId = S.PurchaseOrderId AND PO.Status='Processing'";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int countPickingUP() {
        String query = "select count(*) from Shipper WHERE (Status='Picking')";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int countShipper() {
        String query = "select count(*) from AccountRole WHERE (Role='shipper')";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    //----- fill 4 o dau -------//

    //------ Bang so 1 ---------//
    public List<Shipper> shipperList() {         // rs2.next() can then undo trong truong hop co testcase nhieu shipper
        // return ---- accountId,  email,  firstName,  phone,   ortherCarring
        String query = "SELECT  * FROM dbo.SV_shipperList";

        String query2 = "SELECT S.ShipperId ,COUNT(*) as carrying\n" +
                "\tFROM  Shipper S\n" +
                "\tWHERE S.Status='shipping'\n" +
                "\tGROUP BY S.ShipperId";
        List<Shipper> list = new ArrayList<Shipper>();
        try {
            conn = new MyDB().getConnection();
            Statement stmt = null;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            Connection conn2 = null;
            PreparedStatement ps2 = null;
            ResultSet rs2 = null;
            conn2 = new MyDB().getConnection();
            ps2 = conn2.prepareStatement(query2);
            rs2 = ps2.executeQuery();

            while (rs.next()) {

                if (rs2.next() == true && rs.getString(1).equals(rs2.getString(1))) {
                    list.add(new Shipper(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                            rs2.getString(2), rs.getString(5), rs.getString(6), rs.getString(7)));
                    System.out.print("```" + rs.getString(1) + "```" + rs2.getString(1));
                } else
                    list.add(new Shipper(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                            "0", rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            return list;
        } catch (Exception e) {
            System.out.print(e);
        }
        return null;
    }

    // ----- Bang so 2 ---------//
    public List<OrtherNoShipper> initOrderList() {
        // return ---- accountId,  email,  firstName,  phone,   ortherCarring
        String query = "SELECT  * FROM dbo.SV_initOrderList";
        List<OrtherNoShipper> list = new ArrayList<OrtherNoShipper>();
        try {
            conn = new MyDB().getConnection();
            Statement stmt = null;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                list.add(new OrtherNoShipper(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<DetailOrder> OrtherDetailNoShip() {
        String query = "SELECT  * FROM dbo.SV_OrtherDetailNoShip";
        List<DetailOrder> list = new ArrayList<DetailOrder>();
        try {
            conn = new MyDB().getConnection();
            Statement stmt = null;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                list.add(new DetailOrder(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6)));
            }
            //System.out.println("Contents of list ::" + list);
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean convertNoShipToPickup(String shipperID, String OrtherID) {      // can them transaction here <<<<<<<<<<
        System.out.println("Vao querrryyyyyyyyy");
        Connection conn1 = null, conn2 = null;
        PreparedStatement ps1 = null, ps2 = null;
        ResultSet rs = null;
        try {
            String query = "update PurchaseOrder set Status='Processing'" +
                    " WHERE PurchaseOrderId='" + OrtherID + "'";
            String query2 = "insert into Shipper " +
                    "values('" + OrtherID + "', '" + shipperID + "', 'Picking')";

            conn1 = new MyDB().getConnection();
            conn2 = new MyDB().getConnection();

            ps1 = conn1.prepareStatement(query);
            ps1.executeUpdate();

            ps2 = conn2.prepareStatement(query2);
            ps2.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    // ----end Bang so 2 ---------//
    // ---- Bang so 3 ---------//
    public List<PickingUp> pickupList() {
        // return ---- accountId,  email,  firstName,  phone,   ortherCarring
        String query = "SELECT  * FROM dbo.SV_pickupList";
        List<PickingUp> list = new ArrayList<PickingUp>();
        try {
            conn = new MyDB().getConnection();
            Statement stmt = null;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                list.add(new PickingUp(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<DetailOrder> OrtherDetailPicking() {
        String query = "SELECT  * FROM SV_OrtherDetailPicking";
        List<DetailOrder> list = new ArrayList<DetailOrder>();
        try {
            conn = new MyDB().getConnection();
            Statement stmt = null;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                list.add(new DetailOrder(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean Shipperpicked(String OrtherID) {      // can them transaction here <<<<<<<<<<
        Connection conn1 = null;
        PreparedStatement ps1 = null;
        ResultSet rs = null;
        try {

            String query = "update Shipper set Status='Shipping'" +
                    " WHERE PurchaseOrderId='" + OrtherID + "'";


            conn1 = new MyDB().getConnection();

            ps1 = conn1.prepareStatement(query);
            ps1.executeUpdate();

            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    // ---End Bang 3 ---//
    //---- Bang so 4 -----//
    public List<Shipping> shippingList() {
        String query = "select  * from dbo.SV_shippingList";
        List<Shipping> list = new ArrayList<Shipping>();
        try {
            conn = new MyDB().getConnection();
            Statement stmt = null;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                list.add(new Shipping(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<DetailOrder> OrtherDetailShipping() {
        String query = "SELECT  * from  SV_OrtherDetailShipping";
        List<DetailOrder> list = new ArrayList<DetailOrder>();
        try {
            conn = new MyDB().getConnection();
            Statement stmt = null;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                list.add(new DetailOrder(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6)));
            }
            //System.out.println("Contents of list ::" + list);
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean endOrder(String OrtherID, String Status) {
        Connection conn1 = null, conn2 = null;
        PreparedStatement ps1 = null, ps2 = null;
        ResultSet rs = null;
        try {

            String query = "update PurchaseOrder set Status='Completed' " +
                    "WHERE PurchaseOrderId='" + OrtherID + "'";
            if (Status.equals("Cancel")) {
                query = "update PurchaseOrder set  Status='Completed', CancelInvoice='False'" +
                        " WHERE PurchaseOrderId='" + OrtherID + "'";
                String queryCoin = "Select AccountId, SubTotal FROM PurchaseOrder WHERE PurchaseOrderId='" + OrtherID + "'";
                Connection coincon = new MyDB().getConnection();
                Statement stmt = null;
                stmt = coincon.createStatement();
                ResultSet rsx = stmt.executeQuery(queryCoin);
                rsx.next();
                System.out.println("xxx "+rsx.getString(1)+ "  yyy  "+ rsx.getString(2));
                Congtien(rsx.getString(1), rsx.getString(2));
            }
            String query2 = "delete from Shipper WHERE PurchaseOrderId='" + OrtherID + "'";


            conn1 = new MyDB().getConnection();
            conn2 = new MyDB().getConnection();

            ps1 = conn1.prepareStatement(query);
            ps1.executeUpdate();

            ps2 = conn2.prepareStatement(query2);
            ps2.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public void Congtien(String accid, String coin) {
        String query = "\n" +
                "UPDATE dbo.Account \n" +
                "\tSET coin = coin+" + coin + "\n" +
                "\tWHERE AccountId = '" + accid + "'";
         System.out.println(query);
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            ps.executeQuery();
        } catch (Exception e) {
        }
    }

    // ----------- End ship Admin -------------------//
    //------------------------------  TRANG CUA SHIPPPER ----------------------------->

    public String idByEmail(String email) {
        String query = "SELECT A.AccountId\r\n"
                + "	FROM Account A \r\n"
                + "	WHERE A.Email= '" + email + "' \r\n";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            return null;
        } catch (Exception e) {
        }
        return null;
    }

    public String countPicking(String shipperEmail) {
        String query = "SELECT Count(*)\r\n"
                + "	FROM Shipper S, Account A \r\n"
                + "	WHERE A.Email= '" + shipperEmail + "'  AND S.Status = 'Picking' AND A.AccountId = S.ShipperId \r\n";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
//  System.out.printf("...."+ rs.getString(1));
            while (rs.next()) {
                System.out.printf(shipperEmail + ",,,," + rs.getString(1));
                return rs.getString(1);
            }
            return null;
        } catch (Exception e) {
        }
        return null;
    }

    public String countShipping(String shipperEmail) {
        String query = "SELECT Count(*)\r\n"
                + "	FROM Shipper S, Account A \r\n"
                + "	WHERE A.Email= '" + shipperEmail + "'  AND S.Status = 'Shipping' AND A.AccountId = S.ShipperId \r\n";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.printf("---" + rs.getString(1));
                return rs.getString(1);
            }
            return null;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean shipperAction(String orderid, String status) {
        Connection conn1 = null;
        PreparedStatement ps1 = null;
        ResultSet rs = null;
        try {
            String query = "update Shipper set Status='" + status + "'" +
                    " WHERE PurchaseOrderId='" + orderid + "'";

            conn1 = new MyDB().getConnection();

            ps1 = conn1.prepareStatement(query);
            ps1.executeUpdate();

            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    //------END TRANG CUA SHIPPPER --------->

    // -------------------------- Client -------------------------- //

    public List<Article> myInfo(String email) {
        String query = "SELECT Account.* FROM  Account where Account.Email = '" + email + "'";
        List<Article> list = new ArrayList<Article>();
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Article(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getString(11), rs.getString(12), "User"));
            }
            System.out.print("sdfsdfsdfs d     " + list);
            return list;
        } catch (Exception e) {
        }
        return null;
    }


    public String initOrder(String accid, String Subtotal, String address, String phone, String name) {
        try {

            System.out.println(accid + Subtotal + address + phone + name);
            String queery = "insert into PurchaseOrder OUTPUT Inserted.PurchaseOrderId" +
                    " VALUES ('" + accid + "','" + Subtotal + "','" + address + "'," +
                    "'" + phone + "','Init',GETDATE(),'" + name + "','true')";

            conn = new MyDB().getConnection();
//            conn.setAutoCommit(false);
//            clmt = conn.prepareCall(queery);
//            clmt.setString(1, "1");
//            clmt.setString(2, Subtotal);
//            clmt.setString(3, address);
//            clmt.setString(4, phone);
//            clmt.setString(5, "Int");
//            clmt.setString(6, name);
//            clmt.setString(7, "true");
//            clmt.execute();
//            conn.commit();
            ps = conn.prepareStatement(queery);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean InsertDetailOrder(String PurchaseOrderId, String ProductId, String Quantity, String Cost, String
            UnitPrice, String size) {
        try {
            String sub = String.valueOf(Integer.parseInt(UnitPrice) * Integer.parseInt(Quantity));

            String sqlExec = "insert into PurchaseOrderDetail VALUES(? ,? ,? ,? ,? ,?,?) ";

            conn = new MyDB().getConnection();
            conn.setAutoCommit(false);
            clmt = conn.prepareCall(sqlExec);
            clmt.setString(1, PurchaseOrderId);
            clmt.setString(2, ProductId);
            clmt.setString(3, Quantity);
            clmt.setString(4, Cost);
            clmt.setString(5, UnitPrice);
            clmt.setString(6, sub);
            clmt.setString(7, size);
            clmt.execute();
            conn.commit();
            //    System.out.println("dcm loi hoai 1");
            //  String query2 = "Update Product \n" +
            //         "set Available = (Available-" + Quantity + ") where ProductId='" + ProductId + "'";
            String query2 = "Update ProductSize \n" +
                    "set Available = (Available-" + Quantity + ") where ProductId='" + ProductId + "' and [Size] = '" + size + "'";
            conn = new MyDB().getConnection();
            //  System.out.println("dcm loi hoai 2");
            ps = conn.prepareStatement(query2);
            //   System.out.println("dcm loi hoai 3");
            ps.executeUpdate();
            //    System.out.println("dcm loi hoai 4");
            return true;
        } catch (Exception e) {
            //       System.out.println("dcm loi hoai 1");
            System.out.println(e);
            return false;
        }
    }

    // Order Tracking
    public List<TrackOrder> trackShip(String id) {
        String query = "SELECT  PO.AccountId ,PO.PurchaseOrderId, PO.SubTotal, S.Status\n" +
                "FROM PurchaseOrder PO, Shipper S\n" +
                "WHERE  PO.AccountId = '" + id + "' AND PO.PurchaseOrderId=S.PurchaseOrderId";
        List<TrackOrder> list = new ArrayList();
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TrackOrder(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<TrackOrder> trackOrder(String id) {
        String query = "SELECT  PO.AccountId ,PO.PurchaseOrderId, PO.SubTotal, PO.Status\n" +
                "FROM PurchaseOrder PO\n" +
                "WHERE  PO.AccountId = '" + id + "' ";
        List<TrackOrder> list = new ArrayList();
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TrackOrder(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<TrackAllOrder> trackingAllById(String id) {
        String query = "SELECT  PO.AccountId ,PO.PurchaseOrderId, Pro.Name, P.Quantity, P.Subtotal, PO.Status\n" +
                "    FROM PurchaseOrderDetail P, Product Pro, PurchaseOrder PO\n" +
                "    WHERE PRO.ProductId = P.ProductId AND  PO.PurchaseOrderId = P.PurchaseOrderId AND PO.AccountId = '" + id + "' ";
        List<TrackAllOrder> list = new ArrayList();
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TrackAllOrder(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6)));
            }

            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<TrackAllOrder> trackShippingById(String id) {
        String query = "SELECT  PO.AccountId ,PO.PurchaseOrderId, Pro.Name, P.Quantity, P.Subtotal, S.Status\n" +
                "FROM PurchaseOrderDetail P, Product Pro, PurchaseOrder PO, Shipper S\n" +
                "WHERE PRO.ProductId = P.ProductId AND  PO.PurchaseOrderId = P.PurchaseOrderId \n" +
                "AND PO.AccountId = '" + id + "' AND S.PurchaseOrderId = P.PurchaseOrderId";
        List<TrackAllOrder> list = new ArrayList();
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TrackAllOrder(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6)));
                System.out.println("+-+-+-+-+" + rs.getString(6));
            }

            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean resetPassword(String email, String newpass) {
        Connection conn1 = null;
        PreparedStatement ps1 = null;
        ResultSet rs = null;
        try {
            String query = "Update Account set Password='" + newpass + "' Where Email = '" + email + "'";
            System.out.println(query);
            conn1 = new MyDB().getConnection();
            ps1 = conn1.prepareStatement(query);
            ps1.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public String GetQuanityAvai(String ProductID) {
        String query = "SELECT Available\n" +
                "FROM Product\n" +
                "WHERE  ProductId = '" + ProductID + "'";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            return null;
        } catch (Exception e) {
        }
        return null;
    }

    public String getCoin(String email) {
        String query = "SELECT A.coin\r\n"
                + "	FROM Account A \r\n"
                + "	WHERE A.Email= '" + email + "' \r\n";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    public String orderExist(String orderID) {
        String query = "SELECT PurchaseOrderId FROM dbo.PurchaseOrder  WHERE PurchaseOrderId = '" + orderID + "'";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }


    public void truCoin(String email, String sub) {
        String query = "\n" +
                "UPDATE dbo.Account \n" +
                "\tSET coin = coin-" + sub + "\n" +
                "\tWHERE Email = '" + email + "'";
        // System.out.println(query);
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            ps.executeQuery();
        } catch (Exception e) {
        }
    }


    // block order day ne
    public boolean blockOrder(String id) {
        try {
            String query2 = "update PurchaseOrder set CancelInvoice='0', Status='Completed' WHERE PurchaseOrderId='" + id + "'";
            System.out.println(query2);
            conn = new MyDB().getConnection();
            System.out.println(query2);
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }


    public boolean insertVoucher(String code, String coin) {
        try {
            String query2 = "INSERT INTO [dbo].[voucher]   ([code]\n" +
                    "           ,[coin]\n" +
                    "           ,[status]) values ('" + code + "', '" + coin + "','1')";
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public int statusVoucher(String code) {
        try {
            String query2 = "select status from [dbo].[voucher]  where code='" + code + "'";
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query2);
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString(1));
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public String coinVoucher(String code) {
        try {
            String query2 = "select coin from [dbo].[voucher]  where code='" + code + "'";
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query2);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean trueVoucher(String code) {
        try {
            String query2 = "select * from [dbo].[voucher]  where code='" + code + "'";
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query2);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public List<Voucher> voucherList() {
        String query = "SELECT * FROM  Voucher";
        List<Voucher> list = new ArrayList<Voucher>();
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            String st;
            while (rs.next()) {
                if (rs.getInt(3) == 1)
                    st = "Có hiệu lực";
                else if (rs.getInt(3) == 0)
                    st = "Không hiệu lực";
                else
                    st = "Đã được sử dụng";
                list.add(new Voucher(rs.getString(1), rs.getString(2), st));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean avaiVoucher(String code) {
        try {
            String query2 = "update Voucher set Status='1' WHERE code='" + code + "'";
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean blockVoucher(String code) {
        try {
            String query2 = "update Voucher set Status='0' WHERE code='" + code + "'";
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean deleteVoucher(String code) {
        try {
            String query2 = "delete Voucher WHERE code='" + code + "'";
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean useVoucher(String code, String mail) {
        try {
            String query1 = "select coin from [dbo].[voucher]  where code='" + code + "'";
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query1);
            rs = ps.executeQuery();

            if (rs.next()) {
               String coin = rs.getString(1);
                String query2 = "update Account set coin = coin+ "+coin+" WHERE Email='" + mail + "'";
                conn = new MyDB().getConnection();
                ps = conn.prepareStatement(query2);
                ps.executeUpdate();

                String query3 = "update Voucher set status = '-1' where code='" + code + "'";
                conn = new MyDB().getConnection();
                ps = conn.prepareStatement(query3);
                ps.executeUpdate();
                System.out.println(query2);
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return false;
    }


    public boolean VoucherAvai(String code) {
        try {
            String query2 = "select * from [dbo].[voucher]  where code='" + code + "' AND status='1'";
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query2);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}