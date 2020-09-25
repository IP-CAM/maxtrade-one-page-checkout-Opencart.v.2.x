<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">

    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-html" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">

	<div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
        </div>

        <div class="panel-body">
		
		
<!--  standard form opencart -->
		<form action="<?php echo $form_action; ?>" method="post" id="form-html" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-4 control-label" for="input-status"><?php echo $entry_status; ?></label>
				<div class="col-sm-8">
					<select name="mt_onepage_checkout_status" id="input-status" class="form-control">
						<option value="1" <?php if ($mt_onepage_checkout_status) { ?> selected="selected" <?php } ?>><?php echo $text_enabled; ?></option>
						<option value="0" <?php if (!$mt_onepage_checkout_status) { ?> selected="selected" <?php } ?>><?php echo $text_disabled; ?></option>
					</select>
					<div class="text-small"><?php echo $entry_status_small; ?></div>
				</div>
			</div>
		</form>
<!--  standard form opencart -->

	  </div>
	</div>

  </div>
</div>

<?php echo $footer; ?>
