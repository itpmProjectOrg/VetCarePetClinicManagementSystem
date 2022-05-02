<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/vetcaredb";
String userid = "rame123";
String password = "rootpwd";

try {
	Class.forName(driver);
} 
catch (ClassNotFoundException e) {
	e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<%
try{
	connection = DriverManager.getConnection(connectionUrl, userid, password);
	statement=connection.createStatement();
	String sql ="select * from petowner where ownerID="+id;
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
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
    
<title>Update_petowner</title>
</head>
<body style="background-color:#e3ebea;">
    <section id="header"></section>
   

    <!-- owner update  starts from here -->
    <br/>
    <br/>
    <br/>
    <br/>
     <div class="container" style="background-color:#ffffff; width:50%">
            <br/>
            <br/> 
            <h3 class="text-body" style="text-align:center;">Edit Owner </h3>
             <br/>
             <br/>  
             <div class="container" style="width:50%">
              
             <form action="updatepetowner" method="post">
             <input type="hidden" name="patid" value="<%=resultSet.getString("ownerID") %>">
             <div class="form-group" >
                <label>Pet Owner's ID</label>
                <input type="text" name="ownerID" class="form-control" value="<%=resultSet.getString("ownerID") %>" readonly >
             </div>
             
              <div class="form-group" >
                <label>Name</label>
                <input type="text" name="name" class="form-control" value="<%=resultSet.getString("name") %>" >
             </div>
 
             <div class="form-group">
               <label>Address</label>
               <input type="text" name="addr" class="form-control"  value="<%=resultSet.getString("addr") %>" >
             </div>
                                                       
             <div class="form-group">
               <label>Contact Number</label>
               <input type="tel" name="contactNo" class="form-control"  value="<%=resultSet.getString("contactNo") %>" >
             </div>
  
               <input type="submit" value="EDIT" class="btn btn-success" style="width:100%">
             </form>
              
             <%
             }
              connection.close();
             } catch (Exception e) {
              e.printStackTrace();
             }
             %> 
              
             </div>
             <br/>
             <br/>
             
     </div>
    
    
    
    
    
    
    
     <!-- owner update ends from here -->

    <section id="footer" class="section-p1"></section>

    <script src="main_js/nav.js"></script>
    <script src="main_js/footer.js"></script>


</body>
</html>