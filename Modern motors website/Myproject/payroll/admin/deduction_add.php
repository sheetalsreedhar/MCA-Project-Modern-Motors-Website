<?php
	include 'includes/session.php';

	if(isset($_POST['add'])){
		$emp_id= $_POST['emp_id'];
		$description = $_POST['description'];
		$amount = $_POST['amount'];

		$sql = "INSERT INTO deductions (emp_id,description, amount) VALUES ('$emp_id','$description', '$amount')";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Deduction added successfully';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	}	
	else{
		$_SESSION['error'] = 'Fill up add form first';
	}

	header('location: deduction.php');

?>