package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Room extends Connect
{

	public Room()
    {
		Connect.connect_mysql();
    }

	public String saveRoom(HashMap roomData)
	{
		String SQL = "INSERT INTO `room` (`room_category_id`, `room_facility_id`, `room_name`, `room_no_of_beds`, `room_max_adult`, `room_max_child`, `room_fare`, `room_description`, `room_image`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) roomData.get("room_category_id"));
			pstmt.setString(2,(String) roomData.get("room_facility_id"));
			pstmt.setString(3,(String) roomData.get("room_name"));
			pstmt.setString(4,(String) roomData.get("room_no_of_beds"));
			pstmt.setString(5,(String) roomData.get("room_max_adult"));
			pstmt.setString(6,(String) roomData.get("room_max_child"));
			pstmt.setString(7,(String) roomData.get("room_fare"));
			pstmt.setString(8,(String) roomData.get("room_description"));
			pstmt.setString(9,(String) roomData.get("room_image"));
			
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			error = printStackTrace(e);
		}
		return error;
	}

    public HashMap getRoomDetails(int room_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
            String SQL =  "SELECT * FROM `room`,`category` WHERE room_category_id = category_id AND room_id = "+room_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				results.put("room_id",rs.getString("room_id"));
				results.put("category_name",rs.getString("category_name"));
				results.put("room_facility_id",rs.getString("room_facility_id"));
				results.put("room_category_id",Integer.parseInt(rs.getString("room_category_id")));
				results.put("room_name",rs.getString("room_name"));
				results.put("room_no_of_beds",rs.getString("room_no_of_beds"));
				results.put("room_max_adult",rs.getString("room_max_adult"));
				results.put("room_max_child",rs.getString("room_max_child"));
				results.put("room_fare",rs.getString("room_fare"));		
				results.put("room_image",rs.getString("room_image"));
				results.put("room_description",rs.getString("room_description"));
				count++;
            }
			if(count==0)
			{
				results.put("room_id","");
				results.put("room_facility_id","");
				results.put("room_category_id",0);
				results.put("room_name","");
				results.put("room_no_of_beds","");
				results.put("room_max_adult","");
				results.put("room_max_child","");
				results.put("room_fare","");		
				results.put("room_image","");
				results.put("room_description","");
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }

	public String updateRoom(HashMap roomData)
	{
		String SQL = "UPDATE `room` SET `room_category_id` = ?, `room_facility_id` = ?, `room_name` = ?, `room_no_of_beds` = ?, `room_max_adult` = ?, `room_max_child` = ?, `room_fare` = ?, `room_description` = ?, room_image = ? WHERE `room_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			
			pstmt.setString(1,(String) roomData.get("room_category_id"));
			pstmt.setString(2,(String) roomData.get("room_facility_id"));
			pstmt.setString(3,(String) roomData.get("room_name"));
			pstmt.setString(4,(String) roomData.get("room_no_of_beds"));
			pstmt.setString(5,(String) roomData.get("room_max_adult"));
			pstmt.setString(6,(String) roomData.get("room_max_child"));
			pstmt.setString(7,(String) roomData.get("room_fare"));
			pstmt.setString(8,(String) roomData.get("room_description"));
			pstmt.setString(9,(String) roomData.get("room_image"));
			pstmt.setString(10,(String) roomData.get("room_id"));
			
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			error = printStackTrace(e);
		}
		return error;
	}
	 
    public ArrayList getAllRoom()
	{
		String SQL = "SELECT * FROM `room`,`category` WHERE room_category_id = category_id";
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{			
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("room_id",rs.getString("room_id"));
				results.put("category_name",rs.getString("category_name"));
				results.put("room_facility_id",rs.getString("room_facility_id"));
				results.put("room_category_id",Integer.parseInt(rs.getString("room_category_id")));
				results.put("room_name",rs.getString("room_name"));
				results.put("room_no_of_beds",rs.getString("room_no_of_beds"));
				results.put("room_max_adult",rs.getString("room_max_adult"));
				results.put("room_max_child",rs.getString("room_max_child"));
				results.put("room_fare",rs.getString("room_fare"));		
				results.put("room_image",rs.getString("room_image"));
				results.put("room_description",rs.getString("room_description"));
				
				count++;
                resultArray.add(results);
            }
         }
		catch(Exception e)
		{
            System.out.println("Error is: "+ e);
        }
        return resultArray;
    }

	public String getCategoryOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
		DbHandler db = new DBHandler ();
		db.setTableName("category");
		db.setIdColumn("category_id");
		db.setValueColumn("category_name");
		db.setColumns("category_id,category_name");
		db.setSelID(selectedID);
		db.setConn("1");
    	return Connect.getOptionList(db);
    	
    	
    }

	public String getFacilityOption(String SelID)
    {
		DbHandler db = new DBHandler ();
		db.setTableName("facility");
		db.setIdColumn("facility_id");
		db.setValueColumn("facility_name");
		db.setColumns("facility_id,facility_name");
		db.setSelID(SelID);
		db.setConn("1");
		db.setInputName("room_facility_id");
    	return Connect.getChekboxOptionList(db);
    }
}
