<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*"%>    
    
<%
String id=request.getParameter("id");

try
{
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vetcaredb", "rame123", "rootpwd");
  Statement st=conn.createStatement();
  int i=st.executeUpdate("DELETE FROM pet WHERE petID="+id);
}
catch(Exception e)
{
   System.out.print(e);
   e.printStackTrace();
}
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
    
    <!-- pet insert  starts from here -->
         <br>
         <br> 
         <div class="container" style="background-color:#ffffff; width:50%">
  
           
            <br> 
             <br>
             <br>  
             <div class="container" style="width:50%">
              
             <h3 class="text-body" style="text-align:center;">Deleted Successfully!</h3>
                  <br/>
                  <br/>
               <div class="container">
                <div class="row">
                 
                  
                  <div class="col">
                       <center> 
                      <a href="petprofile_petlist.jsp"><button type="button" class="btn btn-outline-success" style="width:200px;">Back</button></a>
                      <br/>
                      <br/>
                     
                       
                      
                      </center>
                  </div>
              
                
                 
                </div>
            </div>
              
              
             </div>
             <br>
             <br>
             
     </div>
    
    
    
    
    
    
    
     <!-- pet insert ends from here -->
    
    <section id="footer" class="section-p1"></section>

    <script src="main_js/nav.js"></script>
    <script src="main_js/footer.js"></script>
  
</body>
</html>