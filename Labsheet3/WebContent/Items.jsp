<%@ page import = "com.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    
<%
if (request.getParameter("action") != null)
{ 
	 Item itemObj = new Item();
	 
	 //itemObj.connect();//For testing the connect method
	 
	 //call the insert function
	 if ( request.getParameter("action").equalsIgnoreCase("insert"))
	 {
		 String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),request.getParameter("itemName"),request.getParameter("itemPrice"),request.getParameter("itemDesc"));
 		 session.setAttribute("statusMsg", stsMsg);
 	 }
	//call the update function
	 else if (request.getParameter("action").equalsIgnoreCase("update"))
	 {
		System.out.println("newUpdate");
	    String stsMsg = itemObj.updateItem(Integer.parseInt(request.getParameter("itemID")),request.getParameter("itemCode"),request.getParameter("itemName"),request.getParameter("itemPrice"),request.getParameter("itemDesc"));
	 	session.setAttribute("statusMsg", stsMsg);
	 }
	//call the delete function
	 else if(request.getParameter("action").equalsIgnoreCase("delete"))
	 {
		System.out.println("newDelete");
	 	String stsMsg = itemObj.deleteItem(Integer.parseInt(request.getParameter("itemID")));
	    session.setAttribute("statusMsg", stsMsg);
	 }
 

}	
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>

</head>
<body>
	<h1>Items Management</h1>
	<%
	if (request.getParameter("action") != null) {
		//call the select function
		if (request.getParameter("action").toString().equalsIgnoreCase("select")) {
			Item itemObj = new Item();
			out.print(itemObj.readOneItem(Integer.parseInt(request.getParameter("itemID"))));
		} 
		else {
			out.print("<form method='post' action='Items.jsp'> " + "<input name='action' value='insert' type='hidden'> "
			+ "Item code: <input name='itemCode' type='text'><br>"
			+ "Item name: <input name='itemName' type='text'><br> "
			+ "Item price: <input name='itemPrice' type='text'><br> "
			+ "Item description: <input name='itemDesc' type='text'><br> "
			+ "<input name='btnSubmit' type='submit' value='Save'> " + "</form>");
		}
	}
	else {
		out.print("<form method='post' action='Items.jsp'> " + "<input name='action' value='insert' type='hidden'> "
		+ "Item code: <input name='itemCode' type='text'><br>"
		+ "Item name: <input name='itemName' type='text'><br> "
		+ "Item price: <input name='itemPrice' type='text'><br> "
		+ "Item description: <input name='itemDesc' type='text'><br> "
		+ "<input name='btnSubmit' type='submit' value='Save'> " + "</form>");
	}
	%>
	<%
 	out.print(session.getAttribute("statusMsg"));
	%>
	<br>
	<%
 	Item itemObj = new Item();
 	out.print(itemObj.readItems());
	%>
</body>	
</html>