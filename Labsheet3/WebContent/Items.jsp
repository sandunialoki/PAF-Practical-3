<%@ page import = "com.*" %>
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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<div class="container">
      <div class="row">
           <div class="col">
 
            </div>
     </div>
</div>

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
			+ "Item code: <input name='itemCode' type='text' class='form-control'><br>"
			+ "Item name: <input name='itemName' type='text' class='form-control'><br> "
			+ "Item price: <input name='itemPrice' type='text' class='form-control'><br> "
			+ "Item description: <input name='itemDesc' type='text' class='form-control'><br> "
			+ "<input name='btnSubmit' type='submit' value='Save' class='btn btn-primary'> " + "</form>");
		}
	}
	else {
		out.print("<form method='post' action='Items.jsp'> " + "<input name='action' value='insert' type='hidden'> "
		+ "Item code: <input name='itemCode' type='text' class='form-control'><br>"
		+ "Item name: <input name='itemName' type='text' class='form-control'><br> "
		+ "Item price: <input name='itemPrice' type='text' class='form-control'><br> "
		+ "Item description: <input name='itemDesc' type='text' class='form-control'><br> "
		+ "<input name='btnSubmit' type='submit' value='Save'  class='btn btn-primary'> " + "</form>");
	}
	%>
	
	<div class='alert alert-success'>
	<%out.print(session.getAttribute("statusMsg"));%>
	</div>
	
	<br>
	<%
 	Item itemObj = new Item();
 	out.print(itemObj.readItems());
	%>
</body>	
</html>