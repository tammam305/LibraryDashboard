<?php
$page="Home";
if(isset($_POST))
{
	foreach($_POST as $airline)
	{
		echo $airline." ";
	}
}
include("header.php");

include("db.php");?>
          <!-- Dashboard Counts Section-->
          
          <!-- Dashboard Header Section    -->
          <section class="dashboard-header"style="padding-top: 20px";>
            <div class="container-fluid">
              <div class="row">
                <!-- Statistics  ""-->
                <div class="statistics col-lg-3 col-12" style="margin-right: ;" >
                
                <div class="" style="background-color: white; width:999px; height: 830px;margin-right: 8px;">
                <div style="margin-left:350px;   ">
                  <form style="width:600px; height:500px; margin:0px; padding: none;" name="selected_airlines" action="processing.php" method="post">
                    <h1 style="margin-left:50px;margin-left: 110px;height: 30px;margin-bottom: 0px;"><strong><em>Airlines</em></strong></h1>
                   <P style="margin-left:50px;color:#EC7063;margin-left: 0px;color:red;width: 200px;font-size: 10px;margin-bottom:0px;"><strong><em>*To better result, please select more airlines</em></strong></P>
                    <table id="chb" style="width:350px; height:50px; background-color:#F4F6F6 ;" cellpadding="10px">
                        
                        <tbody><tr style="text-align: center;">
                            <th>
                             <input type="checkbox" class="airline" value="0" name="Singapore" onclick="return validate_selections()">
                            </th>
                          
                             <td>
                                <img src="img/air/10.png" width="200 px" height="50px">
                            </td>
                        </tr>
                          <tr  style="text-align: center;">
                           
                            <th>
                               <input type="checkbox" class="airline" name="Japan" onclick="return validate_selections()" value="1">
                            </th>
                          
                             <td>
                                <img src="img/air/9.jpg" width="200 px" height="50px">
                            </td>
                        </tr>
                                      
                             <tr  style="text-align: center;">
                           
                            <th>
                                <input type="checkbox" class="airline" name="Emirates" onclick="return validate_selections()" value="2">
                            </th>
                          
                             <td>
                                <img src="img/air/8.png" width="200 px" height="50px">
                            </td>
                        </tr>
                                      
                             <tr  style="text-align: center;">
                           
                            <th>
                                <input type="checkbox" class="airline" name="Cathay" onclick="return validate_selections()" value="3">
                            </th>
                          
                             <td>
                                <img src="img/air/7.png" width="200 px" height="50px">
                            </td>
                        </tr>
                                      
                                 <tr  style="text-align: center;">
                           
                            <th>
                                <input type="checkbox" class="airline" name="EVA Air" onclick="return validate_selections()" value="4">
                            </th>
                           
                             <td>
                                <img src="img/air/6.jpg" width="200 px" height="50px">
                            </td>
                        </tr>
                                      
                             <tr  style="text-align: center;">
                           
                            <th>
                                <input type="checkbox" class="airline" name="Etihad" onclick="return validate_selections()" value="5">
                            </th>
                            
                             <td>
                                <img src="img/air/5.jpg" width="200 px" height="50px">
                            </td>
                        </tr>                                                                                                                                              
                         <tr  style="text-align: center;">
                           
                            <th>
                              <input type="checkbox" class="airline" name="Lufthansa" onclick="return validate_selections()" value="6">
                            </th>
                             <td>
                                <img src="img/air/4.png" width="200 px" height="50px">
                            </td>
                        </tr>
                                                     
                         <tr  style="text-align: center;">
                           
                            <th>
                              <input type="checkbox" class="airline" name="Oman" value="7" onclick="return validate_selections()">
                            </th>
                          
                             <td>
                                <img src="img/air/omanlogo.jpg" width="200 px" height="50px">
                            </td>
                        </tr>
                        
                             <tr  style="text-align: center;">
                           
                            <th>
                                <input type="checkbox" class="airline" name="Saudi" onclick="return validate_selections()" value="8">
                            </th>
                           
                             <td>
                                <img src="img/air/2.jpg" width="200 px" height="50px">
                            </td>
                        </tr>
                        
                         <tr  style="text-align: center;">
                           
                            <th>
                                <input type="checkbox" class="airline" name="Royal" onclick="return validate_selections()" value="9">
                            </th>
                           
                             <td>
                                <img src="img/air/1.png" width="200 px" height="50px">
                            </td>
                        </tr> 
                                                                             
                    </tbody></table>

                    <div style="margin-top:5px;  ">
                    <input type="submit" id="submitbtn" class="btn btn-primary" disabled="" style="width: 350px; height:40px;" value="Analyze"></div>
                 
			</form>
    </div>

                </div>
                <!-- form validation javaScript   -->               
                <script>
					 function validate_selections()
	  				{
						  var airlines_selected = document.getElementsByClassName("airline");
						  var submitbtn = document.getElementById("submitbtn");
						  submitbtn.disabled = true;
						  for(var i = 0 ; i < airlines_selected.length; i++)
							  {
								  if(airlines_selected[i].checked)
									  {
										  submitbtn.disabled = false;
										  return;
									  }
							  }
					  }

					</script>
              
              
              </div>
            </div>
          </section>
          <!-- Feeds Section-->
         
          <?php
			include("footer.php");
			?>


  </body>
</html>