<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("id");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/vetcaredb";
String userId = "rame123";
String password = "rootpwd";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VetCare Pet Clinic</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Spartan:wght@200;300;400;500;600;700;800;900&family=Supermercado+One&display=swap"
      rel="stylesheet"
    />

     <script
      src="https://kit.fontawesome.com/f6b58a74a1.js"
      crossorigin="anonymous"
    ></script>

    <!-- our style sheet should be here -->
     <link rel="stylesheet" href="Styles/PetProfileStyles/css/PetProfileStyle.css" />
     <link rel="stylesheet" href="Styles/Bootstrap/css/bootstrap.css" />
  
    
</head>
<body style="background-color:#e3ebea;">

    <section id="header"></section>
    
     <!-- pet list starts from here -->
   
        
       <div className="container" >
          <br/>
          <br/>     
              
        <div class="container" style="background-color:#ffffff;">
            <br/>
            <br/> 
            <h3 class="text-body" style="text-align:center;">Pets </h3> 
             <br/>
             <br/>  
             
              <div class="container">
               <div class="row">
                 
                  <div class="col-sm">
                      <div class=search>
		                <form action="petsearch" name="frm" method="post">
		                   <table align="center">
			                 <tr>
			                   <td colspan=2 style="font-size:12pt;" align="center">
			                     <td><input type="text" class="form-control"  name="name" placeholder="Search Name"></td>
		                       	 <td><input  type="submit" class="btn btn-success" name="submit" value="Search"></td></tr>
		                   </table>
   	                   </form>
                  	</div>
                 </div>
                  <div class="col-sm">
                       <a href="petprofile_addpet.jsp">
                          <center><button type="button" class="btn btn-success">Add New Pet</button></center>
                       </a>
                  </div>
                 <div class="col-sm">
                        <a href="petprofile_report_search.jsp">
                           <center><button type="button" class="btn btn-success">Pet Count Report</button></center>
                        </a>
                 </div>
                 <div class="col-sm">
                        <a href="petprofile_mainpage.jsp">
                           <center><button type="button" class="btn btn-success">Back</button></center>
                        </a>
                 </div>
             </div>
           </div>
             
             <br/>
             <br/>
             <div class="container">     
             <table class="table table-striped">
                <thead>
                   <tr>
                     <th scope="col">Pet ID</th>
                     <th scope="col">Owner ID</th>
                     <th scope="col">Pet Name</th>
                     <th scope="col">Pet Type</th>
                     <th scope="col">Breed</th>
                     <th scope="col">Sex</th>
                     <th scope="col">DOB</th>
                     <th scope="col">Registered Date</th>
                     <th scope="col">Update</th>
                     <th scope="col">Delete</th>
                    
                  </tr>
                </thead>
                <tbody>
                  <%
                   try{ 
                    connection = DriverManager.getConnection(connectionUrl, userId, password);
                    statement=connection.createStatement();
                    String sql ="SELECT * FROM pet";

                    resultSet = statement.executeQuery(sql);
                    while(resultSet.next()){
                  %>

                <tr>
                  <td><%=resultSet.getString("petID") %></td>
                  <td><%=resultSet.getString("ownerID") %></td>
                  <td><%=resultSet.getString("name") %></td>
                  <td><%=resultSet.getString("petType") %></td>
                  <td><%=resultSet.getString("breed") %></td>
                  <td><%=resultSet.getString("sex") %></td>
                  <td><%=resultSet.getString("dob") %></td>
                  <td><%=resultSet.getString("date") %></td>
                  <td><a href="petprofile_update_pet.jsp?id=<%=resultSet.getString("petID")%>"><button type="button" class="btn btn-info">
                  Update</button></a></td>
                  <td><a href="petprofile_delete_pet.jsp?id=<%=resultSet.getString("petID")%>"><button type="button" class="btn btn-danger">
                  Delete</button></a></td>
             
                 <% 
                 }

                 } catch (Exception e) {
                     e.printStackTrace();
                 }
                 %>
               </tr>
               
               </tbody>
           </table>
            <br/>
            <br/>  
           </div>
            
         </div>
         
         <br/>
         <br/>
         <br/>
         <br/>
      </div>
     
    
    
    <!-- pet list ends from here -->
    
    <section id="footer" class="section-p1"></section>

    <script src="main_js/nav.js"></script>
    <script src="main_js/footer.js"></script>
  


</body>
</html>