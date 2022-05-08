<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<body style="background-color:#ffffff;">
     <section id="header"></section>
   
     <br/>
    <br/>
    <br/>
    <br/>
      <div class="container" style="background-color:#e3ebea; width:50%">
      
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
    <div class = "container">
    	<section id="footer" class="section-p1"></section>
	</div>
    <script src="main_js/nav.js"></script>
    <script src="main_js/footer.js"></script>
</body>
</html>