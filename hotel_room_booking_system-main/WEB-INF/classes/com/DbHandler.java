package com;

public class DbHandler {
	
  private String tableName;
  private String idColumn;
  private String valueColumn;
  private String Columns;
  private int selID;
  private String conn;
  private String inputName;
  
	public DbHandler()
	{
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getIdColumn() {
		return idColumn;
	}

	public void setIdColumn(String idColumn) {
		this.idColumn = idColumn;
	}

	public String getValueColumn() {
		return valueColumn;
	}

	public void setValueColumn(String valueColumn) {
		this.valueColumn = valueColumn;
	}

	public String getColumns() {
		return Columns;
	}

	public void setColumns(String columns) {
		Columns = columns;
	}

	public int getSelID() {
		return selID;
	}

	public void setSelID(int selID) {
		this.selID = selID;
	}

	public String getConn() {
		return conn;
	}

	public void setConn(String conn) {
		this.conn = conn;
	}

	public String getInputName() {
		return inputName;
	}

	public void setInputName(String inputName) {
		this.inputName = inputName;
	}

}
