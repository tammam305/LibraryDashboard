
  <?php


$isbn = (isset($_GET["isbn"]) && !empty($_GET["isbn"]))?$_GET["isbn"]:header("Location: analysis.php")||exit();
include "db.php";

 $query = "SELECT book.isbn,book.title,book.author,book.publisher,book.pubYear,book.edition,book.quntity,book.image,COUNT(loan.id) AS 'loan',book.available FROM book LEFT JOIN loan ON book.isbn = loan.bookISBN WHERE book.isbn=$isbn  GROUP BY book.isbn";
    $result = mysqli_query($con,$query);
    $row = mysqli_fetch_assoc($result);

?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Book Description | Library System</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <div class="page login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
            <!-- Logo & Information Panel-->
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                 <div class="image"><img src="<?php echo $row['image']; ?>" alt="<?php echo $row['title']; ?>" class="img-fluid" width="200" height="200"></div>
                  <div class="logo">
                    <!--<h1>Learning PHP, MySQL and JavaScript</h1>-->
                    <h1><?php echo $row['title']; ?></h1>  
                  </div>
                  <!--<p>Robin Nixon</p>-->
                    <p><?php echo $row['author']; ?></p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white">
              <div class="card">
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Book Details</h3>
                    </div>
                    <div class="card-body">
                      <table class="table">
                        <thead>
                          <tr>
                            <th>ISBN</th>
                            <th>Publisher</th>
                            <th>Edition</th>
                            <th>Year of Publication</th>
                          </tr>
                        </thead>
                        <tbody>
                          <!--<tr>
                            <th scope="row">9781491918661</th>
                            <td>OReilly Media</td>
                            <td>4th</td>
                            <td>2014</td>
                          </tr>-->
                            
                            <tr>
                            <th scope="row"><?php echo $isbn; ?></th>
                            <td><?php echo $row['publisher']; ?></td>
                            <td><?php echo $row['edition']; ?></td>
                            <td><?php echo $row['pubYear']; ?></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Quantity Details</h3>
                    </div>
                    <div class="card-body">
                      <table class="table">
                        <thead>
                          <tr>
                            <th>Quantity</th>
                            <th>Loaned</th>
                            <th>Available</th>
                          </tr>
                        </thead>
                        <tbody>
                            
                          <!--<tr>
                            <td>30</td>
                            <td>10</td>
                            <td>20</td>
                          </tr>-->
                           <tr>
                            <td><?php echo $row['quntity']; ?></td>
                            <td><?php echo $row['loan']; ?></td>
                            <td><?php echo $row['available']; ?></td>
                          </tr> 
                            
                            
                        </tbody>
                      </table>
                    </div>
                </div>
                <div class="content text-center">
                        <a href="books.php" class="btn btn-primary"><i class="fa fa-chevron-circle-left"></i> Back to Book List</a>
                </div>
            </div>
          </div>
        </div>
      </div>
      <div class="copyrights text-center">
        <p>&copy; 2017, CCSIT Web-based Systems Project First Semester 2017-18 </p>
      </div>
    </div>
    <!-- Javascript files-->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="js/front.js"></script>
  </body>
</html>