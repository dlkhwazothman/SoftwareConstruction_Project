package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Book extends Connect
{

	public Book()
    {
		Connect.connect_mysql();
    }

	public String saveBook(HashMap bookData)
	{
		String SQL = "INSERT INTO `book` (`book_room_id`, `book_user_id`, `book_date`, `book_from_date`, `book_to_date`, `book_no_rooms`, `book_no_persons`, `book_no_childs`, `book_name`, `book_mobile`, `book_email`, `book_total_amount`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) bookData.get("book_room_id"));
			pstmt.setString(2,(String) bookData.get("book_user_id"));
			pstmt.setString(3,(String) bookData.get("book_date"));
			pstmt.setString(4,(String) bookData.get("book_from_date"));
			pstmt.setString(5,(String) bookData.get("book_to_date"));
			pstmt.setString(6,(String) bookData.get("book_no_rooms"));
			pstmt.setString(7,(String) bookData.get("book_no_persons"));
			pstmt.setString(8,(String) bookData.get("book_no_childs"));
			pstmt.setString(9,(String) bookData.get("book_name"));
			pstmt.setString(10,(String) bookData.get("book_mobile"));
			pstmt.setString(11,(String) bookData.get("book_email"));
			pstmt.setString(12,(String) bookData.get("book_total_amount"));
			
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

    public HashMap getBookDetails(int book_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
            String SQL =  "SELECT * FROM `book` WHERE book_id = "+book_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("book_id",rs.getString("book_id"));
				results.put("book_room_id",rs.getString("book_room_id"));
				results.put("book_user_id",rs.getString("book_user_id"));
				results.put("book_date",rs.getString("book_date"));
				results.put("book_from_date",rs.getString("book_from_date"));
				results.put("book_to_date",rs.getString("book_to_date"));
				results.put("book_no_rooms",rs.getString("book_no_rooms"));
				results.put("book_no_persons",rs.getString("book_no_persons"));
				results.put("book_no_childs",rs.getString("book_no_childs"));
				results.put("book_name",rs.getString("book_name"));
				results.put("book_mobile",rs.getString("book_mobile"));
				results.put("book_email",rs.getString("book_email"));
				results.put("book_total_amount",rs.getString("book_total_amount"));
				count++;
            }
			if(count==0)
			{
				results.put("book_id","");
				results.put("book_name","");
				results.put("book_description","");
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }

	public String updateBook(HashMap bookData)
	{
		String SQL = "UPDATE `book` SET `book_room_id` = ?, `book_user_id` = ?, `book_date` = ?, `book_from_date` = ?, `book_to_date` = ?, `book_no_rooms` = ?, `book_no_persons` = ?, `book_no_childs` = ?, `book_name` = ?, `book_mobile` = ?, `book_email` = ?, `book_total_amount` = ? WHERE ``book_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			
			pstmt.setString(1,(String) bookData.get("book_room_id"));
			pstmt.setString(2,(String) bookData.get("book_user_id"));
			pstmt.setString(3,(String) bookData.get("book_date"));
			pstmt.setString(4,(String) bookData.get("book_from_date"));
			pstmt.setString(5,(String) bookData.get("book_to_date"));
			pstmt.setString(6,(String) bookData.get("book_no_rooms"));
			pstmt.setString(7,(String) bookData.get("book_no_persons"));
			pstmt.setString(8,(String) bookData.get("book_no_childs"));
			pstmt.setString(9,(String) bookData.get("book_name"));
			pstmt.setString(10,(String) bookData.get("book_mobile"));
			pstmt.setString(11,(String) bookData.get("book_email"));
			pstmt.setString(12,(String) bookData.get("book_total_amount"));
			pstmt.setString(13,(String) bookData.get("book_id"));
			
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
	
    public ArrayList getAllBook(String user_id)
	{
		String SQL;
		if(user_id.equals("0"))
			SQL = "SELECT * FROM `book`, `room`, `category` WHERE room_category_id = category_id AND book_room_id = room_id";
		else 
			SQL = "SELECT * FROM `book`, `room`, `category` WHERE room_category_id = category_id AND book_room_id = room_id AND book_user_id = "+user_id;
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{			
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				
				HashMap results = new HashMap();
				results.put("book_id",rs.getString("book_id"));
				results.put("book_room_id",rs.getString("book_room_id"));
				results.put("book_user_id",rs.getString("book_user_id"));
				results.put("book_date",rs.getString("book_date"));
				results.put("book_from_date",rs.getString("book_from_date"));
				results.put("book_to_date",rs.getString("book_to_date"));
				results.put("book_no_rooms",rs.getString("book_no_rooms"));
				results.put("book_no_persons",rs.getString("book_no_persons"));
				results.put("book_no_childs",rs.getString("book_no_childs"));
				results.put("book_name",rs.getString("book_name"));
				results.put("book_mobile",rs.getString("book_mobile"));
				results.put("book_email",rs.getString("book_email"));
				results.put("book_total_amount",rs.getString("book_total_amount"));
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
}
