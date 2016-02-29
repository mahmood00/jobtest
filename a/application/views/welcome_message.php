<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>

<!doctype html>
<html ng-app="toursApp">
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-resource.min.js">
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-route.min.js">
	</script>
	<script src="https://cdn.firebase.com/libs/angularfire/0.9.0/angularfire.min.js"></script>
	<script src="<?php echo asset_url() ?>js/App.js"></script>
	<link rel="stylesheet" href="<?php echo asset_url() ?>css/style.css">


	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Tours App</title>

	<!-- Bootstrap core CSS -->
	<link href="https://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">


	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->



</head>
<body>
<div ng-view></div>
</body>
</html>