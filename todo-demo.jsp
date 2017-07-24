<%@ page import="java.util.*" %>
<html>
<body>
<!-- Step1 create HTML form -->
<form action="todo-demo.jsp">
Add new item: <input type = "text" name ="theItem"/>
     <input type ="submit" value="submit"/>
     
</form>

<!-- Step 2: Add new item "TO DO" list -->
<% 
    //get the TO DO items from the session
    List<String> items = (List<String>) session.getAttribute("myToDoList");

    // if  the to do items doesn't exist , then craete a new one
    if(items == null){
	items = new ArrayList<String>();
	session.setAttribute("myToDoList",items);
    }
//see if there is form data to add
String theItem = request.getParameter("theItem");
if ( (theItem != null) && (!theItem.trim().equals("")) ) {
    items.add(theItem);
 }
%>
<!-- Step 3: Display all the "TO DO item from session -->
<hr>
<b>To DO List Items: </b><br/>
<ol>
<%
  for(String temp: items)
  {
	  out.println("<li>" + temp + "</li>");
  }
%>
</ol>

</body>

</html>