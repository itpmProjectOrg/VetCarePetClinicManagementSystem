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
<body style="background-color:#e3ebea;">
     <section id="header"></section>
    
    <!-- pet insert  starts from here -->
         <br>
         <br> 
         <div class="container" style="background-color:#ffffff; width:50%">
  
           
            <br> 
            <h3 class="text-body" style="text-align:center;">Add a Pet </h3>
             <br>
             <br>  
             <div class="container" style="width:50%">
              
             <form action="petinsert" method="post">
             <div class="form-group" >
                <label>Pet Owner's ID</label>
                <input type="text" name="ownerID" class="form-control"  placeholder="1" id="clientid" required="required" >
             </div>
             
             <div class="form-group" >
                <label>Pet Name</label>
                <input type="text" name="name" class="form-control"  placeholder="Kerby" id="name" required="required"  >
             </div>
 
             <div class="form-group">
               <label>Pet Type</label>
               <input type="text" name="petType" class="form-control"  placeholder="Dog" id="pettype" required="required" >
             </div>
 
             <div class="form-group">
               <label>Breed</label>
               <input type="tel" name="breed" class="form-control"  placeholder="Golden Retriver" id="breed" required="required" >
             </div>
             
            <label for="gender">Sex</label><br>
             <input type="radio" id="male" name="sex" value="male"  > <label for="male">Male</label>
             <input type="radio" id="female" name="sex" value="female" > <label for="female">Female</label>
            
            <br>
             <br>
            <label for="date">DOB</label>
            <input type="date" placeholder="Enter date" name="dob" id="dob" required="required" > 
             <br>
            <br>
            <label for="date">Registered Date</label>
            <input type="date" placeholder="Enter date" name="date" id="date" required="required" > 
    
            <br>
             <br>
             <button type="submit" class="btn btn-success" style="width:100%">ADD</button>
            
             </form>
              
              
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