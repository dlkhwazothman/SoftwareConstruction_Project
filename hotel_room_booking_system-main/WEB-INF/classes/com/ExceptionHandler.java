package com;

import java.io.PrintWriter;
import java.io.StringWriter;

public class ExceptionHandler {
	
	public static String  printStackTrace(Exception e)
	{
		StringWriter writer = new StringWriter();
		PrintWriter printWriter = new PrintWriter( writer );
		e.printStackTrace( printWriter );
		printWriter.flush();
		String Option = "Error : "+writer.toString();
		System.out.println("Error : "+e);
		return Option;
	}
}
