<?php echo $header; ?>
<div class="<?php if($mt_onepage_checkout_small_width == true){ ?> container <?php }else{ ?> container-fluid <?php } ?> ">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<?php if ($error_warning) { ?>
	<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<?php } ?>
	<div class="row">
		<div id="content" class="col-sm-12 col-md-4">
			<h2><?php echo $text_user; ?></h2>
			<div class="radio">
				<label>
					<input type="radio" name="account" value="guest" checked="checked" />
					<?php echo $text_guest; ?>
				</label>
			</div>
			<div class="radio">
				<label>
					<input type="radio" name="account" value="registered_user" />
					<?php echo $text_registered_user; ?>
				</label>
			</div>
			<div class="radio">
				<label>
					<input type="radio" name="account" value="register" />
					<?php echo $text_register; ?>
				</label>
			</div>
			<div id="mt_checkout_login_div">
				<div class="form-group">
					<label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
					<input type="text" name="email" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
				</div>
				<div class="form-group">
					<label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
					<input type="password" name="password" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
					<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
				</div>
				<input type="button" value="<?php echo $button_login; ?>" id="button-login" class="btn btn-primary" />
			</div>
			<div id="mt_checkout_info_div">
				<div class="form-group required">
					<label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
					<input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname" class="form-control" />
				</div>
				<div class="form-group required">
					<label class="control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
					<input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-payment-lastname" class="form-control" />
				</div>
			    <div class="form-group required">
					<label class="control-label" for="input-payment-email"><?php echo $entry_email; ?></label>
					<input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-payment-email" class="form-control" />
				</div>
				<div class="form-group required">
					<label class="control-label" for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
					<input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-payment-telephone" class="form-control" />
				</div>
				<div class="form-group">
					<label class="control-label" for="input-payment-company"><?php echo $entry_company; ?></label>
					<input type="text" name="company" value="" placeholder="<?php echo $entry_company; ?>" id="input-payment-company" class="form-control" />
				</div>
				<div class="form-group required">
					<label class="control-label" for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
					<input type="text" name="address_1" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-payment-address-1" class="form-control" />
				</div>
				<div class="form-group required">
					<label class="control-label" for="input-payment-city"><?php echo $entry_city; ?></label>
					<input type="text" name="city" value="" placeholder="<?php echo $entry_city; ?>" id="input-payment-city" class="form-control" />
				</div>
				<div class="form-group required">
					<label class="control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
					<input type="text" name="postcode" value="" placeholder="<?php echo $entry_postcode; ?>" id="input-payment-postcode" class="form-control" />
				</div>
				<div class="form-group required">
					<label class="control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
					<select name="country_id" id="input-payment-country" class="form-control">
						<option value=""><?php echo $text_select; ?></option>
						<?php foreach ($countries as $country) { ?>
						<?php if ($country['country_id'] == $country_id) { ?>
						<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>
				<div class="form-group required">
					<label class="control-label" for="input-payment-zone"><?php echo $entry_zone; ?></label>
					<select name="zone_id" id="input-payment-zone" class="form-control">
					</select>
				</div>
			</div>
			<div id="mt_checkout_password_div">
				<div class="form-group required">
					<label class="control-label" for="input-payment-password"><?php echo $entry_password; ?></label>
					<input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-payment-password" class="form-control" />
				</div>
				<div class="form-group required">
					<label class="control-label" for="input-payment-confirm"><?php echo $entry_confirm; ?></label>
					<input type="password" name="confirm" value="" placeholder="<?php echo $entry_confirm; ?>" id="input-payment-confirm" class="form-control" />
				</div>
			</div>
		</div>
		<div id="content" class="col-sm-12 col-md-4" style="background-color:red;">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
		<div id="content" class="col-sm-12 col-md-4" style="background-color:green;">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
	</div>
</div>
<script type="text/javascript">
$( document ).ready(() => {
    $('input[type=radio][name=account]').change(function() {
    if (this.value == 'guest') {
        $("#mt_checkout_login_div").hide();
        $("#mt_checkout_password_div").hide();
		$("#mt_checkout_info_div").show();
    }
    else if (this.value == 'registered_user') {
        $("#mt_checkout_login_div").show();
        $("#mt_checkout_password_div").hide();
		$("#mt_checkout_info_div").hide();
    }else if (this.value == 'register') {
        $("#mt_checkout_login_div").hide();
        $("#mt_checkout_password_div").show();
		$("#mt_checkout_info_div").show();
    }
});
});
</script>
<?php echo $footer; ?>