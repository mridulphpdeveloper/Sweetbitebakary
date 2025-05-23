<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(isset($_GET['action']) && $_GET['action']=="add"){
	$id=intval($_GET['id']);
	if(isset($_SESSION['cart'][$id])){
		$_SESSION['cart'][$id]['quantity']++;
	}else{
		$sql_p="SELECT * FROM products WHERE id={$id}";
		$query_p=mysqli_query($con,$sql_p);
		if(mysqli_num_rows($query_p)!=0){
			$row_p=mysqli_fetch_array($query_p);
			$_SESSION['cart'][$row_p['id']]=array("quantity" => 1, "price" => $row_p['productPrice']);
			header('location:index.php');
		}else{
			$message="Product ID is invalid";
		}
	}
}


?>

<!DOCTYPE HTML>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<title>SweetBite Bakary</title>
<!--Bootstrap -->
<link rel="stylesheet" href="assets2/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="assets2/css/style.css" type="text/css">
<link rel="stylesheet" href="assets2/css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="assets2/css/owl.transitions.css" type="text/css">
<link href="assets2/css/slick.css" rel="stylesheet">
<link href="assets2/css/bootstrap-slider.min.css" rel="stylesheet">
<link href="assets2/css/font-awesome.min.css" rel="stylesheet">

<link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets2/images/favicon-icon/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets2/images/favicon-icon/apple-touch-icon-114-precomposed.html">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets2/images/favicon-icon/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="assets2/images/favicon-icon/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="cakeshoplogo.jpg">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
<!-- CSS -->
<link href="style.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link href='files/dist/themes/fontawesome-stars.css' rel='stylesheet' type='text/css'>
   <!-- Bootstrap Core CSS -->
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

	    <!-- Customizable CSS -->
	    <link rel="stylesheet" href="assets/css/main.css">
	    <link rel="stylesheet" href="assets/css/green.css">
	    <link rel="stylesheet" href="assets/css/owl.carousel.css">
		<link rel="stylesheet" href="assets/css/owl.transitions.css">
		<!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
		<link href="assets/css/lightbox.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/animate.min.css">
		<link rel="stylesheet" href="assets/css/rateit.css">
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

		<!-- Demo Purpose Only. Should be removed in production -->
		<link rel="stylesheet" href="assets/css/config.css">

		<link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
		<link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
		<link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
		<link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
		<link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>

<!-- Script -->
<script src="jquery-3.0.0.js" type="text/javascript"></script>
<script src="files/dist/jquery.barrating.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
    $('.rating').barrating({
        theme: 'fontawesome-stars',
        onSelect: function(value, text, event) {

            // Get element id by data-id attribute
            var el = this;
            var el_id = el.$elem.data('id');

            // rating was selected by a user
            if (typeof(event) !== 'undefined') {

                var split_id = el_id.split("_");

                var postid = split_id[1];  // postid

                // AJAX Request
                $.ajax({
                    url: 'rating_ajax.php',
                    type: 'post',
                    data: {postid:postid,rating:value},
                    dataType: 'json',
                    success: function(data){
                        // Update average
                        var average = data['averageRating'];
                        $('#avgrating_'+postid).text(average);
                    }
                });
            }
        }
    });
});

</script>
</head>
<body>


<header class="header-style-1">
<?php include('includes/top-header.php');?>
<?php include('includes/main-header.php');?>
<?php include('includes/menu-bar.php');?>
</header>

<!-- Banners -->
<<section id="banner" class="banner-section">   
  <div class="container">     
    <div class="div_zindex">       
      <div class="row justify-content-center"> <!-- Centering the row -->
        <div class="col-md-6"> <!-- Increased column size for larger content -->
          <div class="banner_content text-center"> <!-- Added 'text-center' class to align content centrally -->
            <h1 class="banner-title" style="color: blue; font-weight: bold;">SweetBite Bakery</h1><!-- New class for custom styling -->
            <p class="banner-description" style="color: orange; font-weight: bold;">Delight in our irresistible cakes, cookies, biscuits, and fresh bread. Craving something unique? Let us craft the perfect custom cake for you!</p> <!-- New class for custom styling -->
            <a href="#products" class="btn">Order Now <span class="angle_arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
          </div>
        </div>     
      </div>     
    </div>   
  </div> 
</section>

<style>
  /* CSS for banner content */
  #banner {
    background-color: #f8f9fa;
    padding: 50px 0;
  }

  .banner-content {
    font-family: 'Verdana', sans-serif;
  }

  .banner-title {
    font-size: 3.5rem; /* Increase font size */
    font-weight: bold;
    color: #1e3a8a; /* Blue color for the title */
    text-transform: uppercase;
    animation: blink 1s infinite; /* Blinking effect */
  }

  .banner-description {
    font-size: 1.5rem;
    color: #e67e22; /* Orange color for the description */
    font-weight: bold;
    margin-top: 20px;
    animation: blink 2s infinite; /* Slightly slower blinking for the description */
  }

  .btn {
    margin-top: 30px;
    padding: 10px 25px;
    font-size: 1.25rem;
    background-color: #e63946;
    color: #fff;
    border-radius: 5px;
    text-decoration: none;
  }

  .btn:hover {
    background-color: #d62828;
  }

  /* Blinking effect keyframes */
  @keyframes blink {
    0% { opacity: 1; }
    50% { opacity: 0.5; }
    100% { opacity: 1; }
  }

  /* Centering the banner content */
  .row.justify-content-center {
    display: flex;
    justify-content: center;
  }

  .col-md-6 {
    text-align: center; /* Ensures the content is centered in the column */
  }
</style>

<!-- /Banners -->

<!-- Resent Cat-->
<section class="section-padding gray-bg">
  <div class="container">
    <div class="section-header text-center">
      <h2>What we have in wait <span> For You</span></h2>

    <div class="row">
      <!-- Recently Listed New Cakes -->
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="resentnewCake">
<?php
$ret=mysqli_query($con,"select * from products ORDER BY id DESC");
while ($row=mysqli_fetch_array($ret))
{
?>
<div class="col-list-3">
<div class="recent-Cake-list" id="products">
<div class="car-info-box"> 
    <a href="product-details.php?pid=<?php echo htmlentities($row['id']);?>">
        <img src="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage1']);?>" class="img-responsive" alt="image">
    </a>  
</div>
    
<div class="Cake-title-m" style="color:black;">
<h4><a href="product-details.php?pid=<?php echo htmlentities($row['id']);?>"><?php echo htmlentities($row['productName']);?></a></h4>
<h6 class="price">BDT <?php echo htmlentities($row['productPrice']);?> <s>BDT <?php echo htmlentities($row['productPriceBeforeDiscount']);?></s></h6>
</div>
    
    
    
<div class="inventory_info_m">
	
	<div class="action">
    <a href="product-details.php?pid=<?php echo $row['id']; ?>" class="lnk btn btn-primary"style="background-color:#FF5733; border-color:#FF5733;">Product View</a>
  </div>
	<br>
  <div class="action">
    <a href="index.php?page=product&action=add&id=<?php echo $row['id']; ?>" class="lnk btn btn-primary">Add to Cart</a>


    <a class="btn btn-primary" style="background-color: #FFC300; border-color: #FFC300; font-size: 0.85rem; padding: 6px;" data-toggle="tooltip" data-placement="right" title="Add to Wishlist" href="product-details.php?pid=<?php echo htmlentities($row['id'])?>&&action=wishlist">
    <i class="fa fa-heart"></i>
  </a>
     
    
</div>
    

</div>
</div>
</div>
<?php } ?>
      </div>
    </div>
  </div>
  </div>
    </div>
</section>
<!-- /Resent Cat -->
<!-- Testimonial Section -->
<section class="section-padding testimonial-section parallex-bg">
  <div class="container div_zindex">
    <div class="section-header white-text text-center">
      <h2>Our Satisfied <span>Customers</span></h2>
    </div>
    <div class="row">
      <div id="testimonial-slider" class="owl-carousel owl-theme">
        <?php
        $sql_p = "SELECT yt.Testimonial, u.name AS UserName FROM sbb_testimonial yt JOIN users u ON yt.UserEmail = u.email";
        $qry = mysqli_query($con, "select * from productreviews where status=1");
        while ($rvw = mysqli_fetch_array($qry)) {
        ?>
          <div class="testimonial-m">
            <div class="testimonial-content">
              <div class="testimonial-heading">
                <h5><?php echo htmlentities($rvw['name']); ?></h5>
                <p><?php echo htmlentities($rvw['review']); ?></p>
              </div>
            </div>
          </div>
        <?php } ?>
        <?php
        mysqli_free_result($qry);
        mysqli_close($con);
        ?>
      </div>
    </div>
  </div>
  <div class="dark-overlay"></div>
</section>
<!-- /Testimonial Section -->
<!--Back to top-->
<div id="back-top" class="back-top"> <a href="#top"><i class="fa fa-angle-up" aria-hidden="true"></i> </a> </div>
 <?php include('includes/footer.php');?>
<!-- Scripts -->
<script src="assets2/js/jquery.min.js"></script>
<script src="assets2/js/bootstrap.min.js"></script>
<script src="assets2/js/interface.js"></script>
<script src="assets2/js/bootstrap-slider.min.js"></script>
<script src="assets2/js/slick.min.js"></script>
<script src="assets2/js/owl.carousel.min.js"></script>
</body>
</html>