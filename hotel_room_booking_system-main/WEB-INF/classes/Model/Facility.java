package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Facility extends Connect
{
	
	public Facility()
    {
		Connect.connect_mysql();
    }

	public String saveFacility(HashMap facilityData)
	{
		String SQL = "INSERT INTO `facility` (`facility_name`, `facility_description`) VALUES (?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) facilityData.get("facility_name"));
			pstmt.setString(2,(String) facilityData.get("facility_description"));
			
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
	
    public HashMap getFacilityDetails(int facility_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
            String SQL =  "SELECT * FROM `facility` WHERE facility_id = "+facility_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("facility_id",rs.getString("facility_id"));
				results.put("facility_name",rs.getString("facility_name"));
				results.put("facility_description",rs.getString("facility_description"));
				count++;
            }
			if(count==0)
			{
				results.put("facility_id","");
				results.put("facility_name","");
				results.put("facility_description","");
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }

	public String updateFacility(HashMap facilityData)
	{
		String SQL = "UPDATE `facility` SET `facility_name` = ?, `facility_description` = ? WHERE `facility_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			
			pstmt.setString(1,(String) facilityData.get("facility_name"));
			pstmt.setString(2,(String) facilityData.get("facility_description"));
			pstmt.setString(3,(String) facilityData.get("facility_id"));
			
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
	  
    public ArrayList getAllFacility()
	{
		String SQL = "SELECT * FROM `facility`";
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{			
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("facility_id",rs.getString("facility_id"));
				results.put("facility_name",rs.getString("facility_name"));
				results.put("facility_description",rs.getString("facility_description"));
				
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
}
