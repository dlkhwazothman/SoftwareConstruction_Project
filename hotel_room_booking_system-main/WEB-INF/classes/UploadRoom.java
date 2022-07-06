import java.io.File;
import java.io.IOException;
import Model.*;
import java.util.*;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/UploadRoom")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UploadRoom extends HttpServlet {
    private static final String SAVE_DIR = "roomImages";
     
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//// Logic for Upload the File ////
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
		long unixTime = System.currentTimeMillis() / 1000L;
	
		Part part;
        part = request.getPart("room_image");
        String fileName = extractFileName(part);
        if(!fileName.equals("")) {
			fileName = unixTime+"_"+extractFileName(part);
			part.write(savePath + File.separator + fileName);
		} else {
			fileName = request.getParameter("image_name");
		}
		//// Upload File Complete///
		
		/////Save the Room Details /////
		Room roomObj = new Room();
		String emp_id = "0";
		if((request.getParameter("act")).equals("Save"))
		{
			String room_facility_id = "";
		
			String[] facilityID = request.getParameterValues("room_facility_id");		
			///Save the Medicine Record ///
			for(int i=0;i<facilityID.length;i++)
			{
				room_facility_id += facilityID[i]+",";
			}		
			HashMap results = new HashMap();
			results.put("room_id",request.getParameter("room_id"));
			results.put("room_facility_id",room_facility_id);
			results.put("room_category_id",request.getParameter("room_category_id"));
			results.put("room_name",request.getParameter("room_name"));
			results.put("room_no_of_beds",request.getParameter("room_no_of_beds"));
			results.put("room_max_adult",request.getParameter("room_max_adult"));
			results.put("room_max_child",request.getParameter("room_max_child"));
			results.put("room_fare",request.getParameter("room_fare"));		
			results.put("room_description",request.getParameter("room_description"));
			results.put("room_image",fileName);
					
			if((request.getParameter("room_id")).equals(""))
			{
				roomObj.saveRoom(results);
				request.setAttribute("message", "Room Saved Successfully !!!!");
				getServletContext().getRequestDispatcher("/report-room.jsp").forward(request, response);
			}
			else
			{
				results.put("room_id",request.getParameter("room_id"));
				roomObj.updateRoom(results);
				request.setAttribute("message", "Room Updated Successfully !!!!");
				getServletContext().getRequestDispatcher("/report-room.jsp").forward(request, response);
			}
		}
    }
    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}
