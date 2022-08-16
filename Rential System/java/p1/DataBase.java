package p1;
import java.sql.*;

public class DataBase {
	static int a;
	static String b,c;
	Statement s;
	public static int oid;
	public static int hid;
	public DataBase(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rentialsystem","root","");
			s=conn.createStatement();	
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	/*DataBase(int a,String b,String c){
		this.a=a;
		this.b=b;
		this.c=c;
	}
	protected static int DbConnection() throws Exception{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","");
			Statement stmt=conn.createStatement();	
			c="'"+c+"'";
			b="'"+b+"'";
			int d=stmt.executeUpdate("insert into employ(id,name,dept) values("+a+","+b+","+c+")");
			return d;
	}*/
	public ResultSet getLogin(String user) {
		ResultSet rs = null;
			try {
				rs=s.executeQuery("select * from users where uname="+"'"+user+"'");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return rs;
	}
	public ResultSet house() {
		ResultSet rs = null;
		try {
			rs=s.executeQuery("select * from house");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet house(int id) {
		ResultSet rs = null;
		try {
			rs=s.executeQuery("select * from house where hid="+id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet houseImages(int id) {
		ResultSet rs = null;
		try {
			rs=s.executeQuery("select photo from himages where hid="+id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
}
	