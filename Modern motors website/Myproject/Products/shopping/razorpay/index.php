<?php 
require_once('config.php'); 
?>
<html>
  <head>
    <title> RazorPay</title>
    <meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="style7.css">
  <body>
 <div class="wrapper">
 <div class="form-holder">
 <h2>Make Payment</h2>
 <hr>
 <form action="" method="post" class="form">
  <div class="form-group">
    <style>
      .razorpay-payment-button {
        color: #ffffff !important;
        background-color: #7266ba;
        border-color: #7266ba;
        font-size: 14px;
		margin-left:155px;
        padding: 10px;
      }
    </style>
	</div>
	</form>
	</body>
  </head>
  <body>
    <form action="charge.php" method="POST">
    <!-- Note that the amount is in paise = 50 INR -->
    <script
        src="https://checkout.razorpay.com/v1/checkout.js"
        data-key="<?php echo $razor_api_key; ?>"
        data-amount="10000"
        data-buttontext="Pay with Razorpay"
        data-name="Modern Motors.com"
        data-description="Pay with RazorPay"
        data-image="logo.jpeg"
        data-prefill.name="Sheetal sreedhar"
        data-prefill.email="support@razorpay.com"
        data-theme.color="#51D8F0"
    ></script>
    <input type="hidden" value="Hidden Element" name="hidden">
    </form>
  </body>
</html>