package com;
import java.sql.*;
import java.util.*;
import java.io.*;

public class Connect
{
    public static Statement statement = null;
    public static Connection connection;
	public static ResultSet rs;
	public static PreparedStatement pstmt;

	public static void connect_mysql()
    {
    	try  
    	{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
    		connection = DriverManager.getConnection("jdbc:mysql://localhost/hotel_room_booking_system?" + "user=root");
			statement=connection.createStatement();
   		}
   		catch(Exception e)  
    	{
			System.out.println(" Error : "+ e.toString());
    	}
    }

	public static String getOptionList(DbHandler db)
	{
		String SQL = "SELECT "+db.getColumns()+" FROM "+db.getTableName()+" where "+db.getConn(); 
		String Option="<option value=''>Please Select</option>";
		try
		{
			rs = statement.executeQuery(SQL);
			while(rs.next())
			{
				int selectedID = rs.getInt(db.getIdColumn());
				if(selectedID==db.getSelID())
					Option+="<option value=\""+selectedID+"\" Selected>"+rs.getString(db.getValueColumn())+"</option>";
				else
					Option+="<option value=\""+selectedID+"\">"+rs.getString(db.getValueColumn())+"</option>";
			}
		}
		catch(Exception e)
		{
			System.out.println("Error : "+e);
		}
		return Option;
	}
	
	public static String  getChekboxOptionList(DbHandler db)
	{
		String SQL = "SELECT "+db.getColumns()+" FROM "+db.getTableName()+" where "+db.getConn(); 
		String Option="";
		String selArray[] = selID.split(",");

		try
		{
			rs = statement.executeQuery(SQL);
			while(rs.next())
			{
				String selectedID = rs.getString(db.getIdColumn());
				if(Arrays.asList(selArray).contains(db.getSelID()))
					Option+="<div class='multi-checkbox'><input name='"+inputName+"' type='checkbox' value=\""+selectedID+"\" checked class='checkbox-list'> "+rs.getString(db.getValueColumn())+"</div>";
				else
					Option+="<div class='multi-checkbox'><input name='"+inputName+"' type='checkbox' value=\""+selectedID+"\" class='checkbox-list'> "+rs.getString(db.getValueColumn())+"</div>";
			}
		}
		catch(Exception e)
		{
			Option = printStackTrace(e);
		}
		return Option;
	}
}
