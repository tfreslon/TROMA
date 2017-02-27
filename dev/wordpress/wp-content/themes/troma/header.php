<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> <head profile="http://gmpg.org/xfn/11">
		<title><?php bloginfo('name') ?><?php if ( is_404() ) : ?> &raquo; <?php _e('Not Found') ?><?php elseif ( is_home() ) : ?> &raquo; <?php bloginfo('description') ?><?php else : ?><?php wp_title() ?><?php endif ?></title>

			<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	    <link rel="shortcut icon" href="favicon.ico">
	    <!-- Google Fonts -->
	    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700|Monsterrat:400,700|Merriweather:400,300italic,700' rel='stylesheet' type='text/css'>
	    <!-- Animate.css -->
	    <link rel="stylesheet" href="wp-content/themes/troma/css/animate.css">
	    <!-- Icomoon Icon Fonts-->
	    <link rel="stylesheet" href="wp-content/themes/troma/css/icomoon.css">
	    <!-- Magnific Popup-->
	    <link rel="stylesheet" href="wp-content/themes/troma/css/magnific-popup.css">
	    <!-- Owl Carousel -->
	    <link rel="stylesheet" href="wp-content/themes/troma/css/owl.carousel.min.css">
	    <link rel="stylesheet" href="wp-content/themes/troma/css/owl.theme.default.min.css">
	    <!-- Bootstrap  -->
	    <link rel="stylesheet" href="wp-content/themes/troma/css/bootstrap.css">
	    <!-- Cards -->
	    <link rel="stylesheet" href="wp-content/themes/troma/css/cards.css">
	    <!-- Modernizr JS -->
	    <script src="wp-content/themes/troma/js/deps/modernizr-2.6.2.min.js"></script>


			<?php wp_head(); ?>
			<?php wp_get_archives('type=monthly&format=link'); ?>
			<?php //comments_popup_script(); <?php wp_head(); ?>




		</head> <body>
