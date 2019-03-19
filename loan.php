<?php
$page="New Loan";
include("header.php");
include "db.php";
if(!isset($_GET["isbn"]) && !isset($_GET["states"]))
{
	header("Location: book.php");
	exit();
}
if(isset($_GET["isbn"])){
$isbn = $_GET["isbn"];

 $query = "SELECT isbn,title FROM `book` WHERE isbn = '$isbn'";
    $result = mysqli_query($con,$query);
    $row = mysqli_fetch_assoc($result);
}

  if(isset($_POST["submit"])){

                 $isbn = $_GET["isbn"];
                 $ID= $_POST["studentID"];
                 $NAME= $_POST["sname"];
	  			 $loanD= date("Y-m-d H:i:s");
                 $query="SELECT * FROM `loan` WHERE bookISBN='$isbn' and  studentID='$ID' and returnDate IS null;";
	  			 if(empty(mysqli_fetch_assoc(mysqli_query($con,$query))))
				 {
               			$query2="SELECT * FROM `book` WHERE isbn = $isbn";
	  					$result2 = mysqli_query($con,$query2);
                   		$row2 = mysqli_fetch_assoc($result2);
	  			   		$query1 = "INSERT INTO `loan`(`bookISBN`, `studentID`,studentName,`date`) VALUES ('$isbn',$ID,'$NAME','$loanD')";
	     		   		$query2 = "UPDATE `book` SET `available`=available - 1 WHERE isbn = '$isbn'";
                 		if($row2['available'] != 0 && mysqli_query($con,$query1) && mysqli_query($con,$query2))
                 			$states=1;
	  			 		else
					 		$states=0;
				  }else
					$states=2;
	  
    header("Location: loan.php?isbn=$isbn&states=$states");
    exit(); 
             

             
    
}      

?>
 

        
          <!-- Breadcrumb-->
          <div class="breadcrumb-holder container-fluid">
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
              <li class="breadcrumb-item"><a href="books.php">Books</a></li>
              <li class="breadcrumb-item active">New Loan</li>
            </ul>
          </div>
          <section class="forms"> 
            <div class="container-fluid">
              <div class="row">
                  <div class="col-lg-12">
                  <div class="card">
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Add New Loan</h3>
                    </div>
                    <div class="card-body">
  <?php 
		if(isset($_GET["states"]) && !empty($_GET["states"]) && $_GET["states"] == 1)
			 echo '<h2>The Book was loanded successfully.</h2>';
		elseif(isset($_GET["states"]) && empty($_GET["states"])&& $_GET["states"] == 0)
			  echo '<h2>The Book was NOT loanded successfully.</h2>';
		elseif(isset($_GET["states"]) && !empty($_GET["states"])&& $_GET["states"] == 2)
			  echo '<h2>Sorry, You can\'t loan 2 books of the same book.</h2>';
			  else
			  { ?>                        
                        
                      <form class="form-horizontal" name="add" method="POST" action="loan.php?isbn=<?php echo $isbn?>" onsubmit="return validate();">
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">ISBN</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" disabled name="isbn" id="isbn" value="<?php echo $isbn; ?>">                 
                          </div>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">Book Title</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" disabled name="title" id="title" value="<?php echo $row['title']; ?>">
                          </div>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">Student ID</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="studentID" id="studentID">
                              <span class="error" id="eSID">*Required</span>
                          </div>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">Student Name</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="sname" id="sname">
                              <span class="error" id="eSName">*Required</span>
                          </div>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">Loan Date</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="date" disabled value="<?php echo date("Y-m-d");?>" id="date">
                              <!--<span class="error" id="eDate">*Required</span>-->
                          </div>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">
                          <div class="col-sm-4 offset-sm-3">
                            <button type="reset" class="btn btn-secondary" >Reset</button>
                            <button class="btn btn-primary" name="submit">Loan Book</button>
                          </div>
                        </div>
                      </form>                        
                 <?php }?>
                        <script>
                            
                        function validate()
                            {
                                var eSID = document.getElementById("eSID");
                                var eSName = document.getElementById("eSName");
                                var eDate = document.getElementById("eDate");
                                var SID = document.add.studentID.value;
                                var SName = document.add.sname.value;
                                var Date = document.add.date.value;
                                var e = 1;
                                
                                if(SID === "")
                                    {
                                        e = 0;
                                        eSID.setAttribute("style","visibility: visible");
                                    }
                                else
                                    {
                                        eSID.setAttribute("style","visibility: hidden"); 
                                    }
                                if(SName === "")
                                    {
                                        e = 0;
                                        eSName.setAttribute("style","visibility: visible");
                                    }
                                else
                                    {
                                        eSName.setAttribute("style","visibility: hidden"); 
                                    }
//                                if(Date === "")
//                                    {
//                                        e = 0;
//                                        eDate.setAttribute("style","visibility: visible");
//                                    }
//                                else
//                                    {
//                                        eDate.setAttribute("style","visibility: hidden"); 
//                                    }
                                
                                if(e == 1)
                                    {
                                        return true;
                                    }
                                else
                                    {
                                        
                                        return false;
                                    }
                                
                            }
                        
                        
                        
                        </script>
                        
                        
                        
                        
                        
                        
                    </div>
                  </div>
                </div>
            </div>
           </div>
          </section>
            <!-- Page Footer-->        
  <?php include("footer.php") ?>
<!-- Javascript files-->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="js/front.js"></script>
  </body>
</html>