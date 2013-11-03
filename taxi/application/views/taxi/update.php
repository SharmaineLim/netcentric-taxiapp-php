
<div id="body">
	<?php echo validation_errors(); ?>

	<?php echo form_open('taxi/update/'.$taxi['id']) ?>

		<label for="id">ID</label>
		<input type="input" name="id" value="<?php echo $taxi['id'] ?>" disabled /><br />

		<label for="plate_number">Plate Number</label>
		<input type="input" name="plate_number" value="<?php echo $taxi['plate_number'] ?>" disabled /><br />

		<label for="company">Company</label>
		<input type="input" name="company" value="<?php echo $taxi['company'] ?>" /><br /><br />

		<input type="submit" name="submit" value="Update Taxi" />

	</form>
</div>
