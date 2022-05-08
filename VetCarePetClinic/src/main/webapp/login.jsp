<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
      <link rel="stylesheet" href="Styles/Bootstrap/css/bootstrap.css" />
    
</head>
<body>

     <br/>
    <br/>
    <br/>
    <br/>
      <div class="container" style="background-color:#ffffff; width:50%">
      
     <br/>
    <br/>
    <h3 class="text-body" style="text-align:center;">Log In </h3>
           
    <br/>  
      <div class="container" style="width:50%">
           
    <form action="Login" method="post">
         <div class="form-group" >
                <label> User Name</label>
                <input type="text" name="uname" class="form-control" required="required">
         </div>
          <div class="form-group" >
                <label> Password </label>
                <input type="password" name="password" class="form-control"   required="required">
         </div>
       <input type="submit"  class="btn btn-success" style="width:100%" value="login">
    </form>
    </div>
     <br/>
     <br/>
     <br/> 
     </div>
     <br/>
    <br/>
    <br/>
    <br/>

</body>
</html>