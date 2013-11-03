
<div id="body">
	<?php echo validation_errors(); ?>

	<?php echo form_open('taxi/create') ?>

		<label for="plate_number">Plate Number</label>
		<input type="input" name="plate_number" /><br />

		<label for="company">Company</label>
		<input type="input" name="company" /><br /><br />

		<input type="submit" name="submit" value="Add Taxi" />

	</form>
</div>
