package tt;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class Connect {
	
	private DBConnectionMgr pool;

	public Connect() {
		pool=DBConnectionMgr.getInstance();
	}
	
	public Select_option_bean select(int no,int group) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		Select_option_bean bean=new Select_option_bean();
		try {
			con=pool.getConnection();
			sql="select * from select_option where `no`=? and `group`=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setInt(2, group);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				bean.setNo(rs.getInt("no"));
				bean.setOption_name(rs.getString("option_name"));
				bean.setValue(rs.getString("value"));
				bean.setGroup(rs.getInt("group"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return bean;
	}
	
	
	
	public JqGridBean list(int i) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		JqGridBean bean=new JqGridBean();
		try {
			con=pool.getConnection();
			sql="select * from asp where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, i);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				bean.setNo(rs.getInt("no"));
				bean.setTeam(rs.getString("team"));
				bean.setProject_no(rs.getString("project_no"));
				bean.setProject_name(rs.getString("project_name"));
				bean.setDivision(rs.getString("division"));
				bean.setClient(rs.getString("client"));
				bean.setDate(rs.getString("date"));
				bean.setSales(rs.getInt("sales"));
				bean.setM1(rs.getInt("m1"));
				bean.setM2(rs.getInt("m2"));
				bean.setM3(rs.getInt("m3"));
				bean.setM4(rs.getInt("m4"));
				bean.setM5(rs.getInt("m5"));
				bean.setM6(rs.getInt("m6"));
				bean.setM7(rs.getString("m7"));
				bean.setM8(rs.getInt("m8"));
				bean.setProfit(rs.getInt("profit"));
				bean.setRate(rs.getInt("rate"));
				bean.setInput_date(rs.getString("input_date"));
				bean.setInput(rs.getString("input"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return bean;
		
	}
	
	
	public JqGridBean date_list(String start_date, String end_date) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		JqGridBean bean=new JqGridBean();
		try {
			con=pool.getConnection();
			sql="select * from asp where `date`>=? and `date`<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, start_date);
			pstmt.setString(2, end_date);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				bean.setNo(rs.getInt("no"));
				bean.setTeam(rs.getString("team"));
				bean.setProject_no(rs.getString("project_no"));
				bean.setProject_name(rs.getString("project_name"));
				bean.setDivision(rs.getString("division"));
				bean.setClient(rs.getString("client"));
				bean.setDate(rs.getString("date"));
				bean.setSales(rs.getInt("sales"));
				bean.setM1(rs.getInt("m1"));
				bean.setM2(rs.getInt("m2"));
				bean.setM3(rs.getInt("m3"));
				bean.setM4(rs.getInt("m4"));
				bean.setM5(rs.getInt("m5"));
				bean.setM6(rs.getInt("m6"));
				bean.setM7(rs.getString("m7"));
				bean.setM8(rs.getInt("m8"));
				bean.setProfit(rs.getInt("profit"));
				bean.setRate(rs.getInt("rate"));
				bean.setInput_date(rs.getString("input_date"));
				bean.setInput(rs.getString("input"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return bean;
		
	}
	
	
	
	
	public boolean insert(String team,String project_no,String project_name,String division,
			String client,String date,int sales,int m1,int m2,int m3,int m4,int m5,
			int m6,String m7,int m8,int profit,int rate,String input) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql=null;
		boolean flag=false;
		try {
			con=pool.getConnection();
			sql="insert asp(team,project_no,project_name,division,client,date,sales,"
					+ "m1,m2,m3,m4,m5,m6,m7,m8,profit,rate,input)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,team);
			pstmt.setString(2,project_no);
			pstmt.setString(3,project_name);
			pstmt.setString(4,division);
			pstmt.setString(5,client);
			pstmt.setString(6,date);
			pstmt.setInt(7,sales);
			pstmt.setInt(8,m1);
			pstmt.setInt(9,m2);
			pstmt.setInt(10,m3);
			pstmt.setInt(11,m4);
			pstmt.setInt(12,m5);
			pstmt.setInt(13,m6);
			pstmt.setString(14,m7);
			pstmt.setInt(15,m8);
			pstmt.setInt(16,profit);
			pstmt.setInt(17,rate);
			pstmt.setString(18,input);
			
			if (pstmt.executeUpdate()==1) {
				flag=true;
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return flag;
	}
	
	
	
	public boolean delete(int no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql=null;
		boolean flag=false;
		try {
			con=pool.getConnection();
			sql="delete from `twice`.`asp` where no in (?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,no);
			if (pstmt.executeUpdate()==1) {
				flag=true;
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return flag;
	}
	
	
	
/*	public boolean nosort() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		boolean flag=false;
		try {
			con=pool.getConnection();
			sql="SET @COUNT = 0;UPDATE twice.asp SET no = @COUNT:=@COUNT+1;";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return bean;
	}
	*/
	
	
	
	public boolean date_insert(String date) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql=null;
		boolean flag=false;
		try {
			con=pool.getConnection();
			sql="insert tt values(?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,date);
			
			if (pstmt.executeUpdate()==1) {
				flag=true;
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return flag;
	}
	
}
