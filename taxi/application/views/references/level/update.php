
<div id="body">
	<?php echo validation_errors(); ?>

	<?php echo form_open('level/update/'.$level['id']) ?>

		<label for="id">ID</label>
		<input type="input" name="id" value="<?php echo $level['id'] ?>" disabled /><br />

		<label for="level">Level</label>
		<input type="input" name="level" value="<?php echo $level['level'] ?>" /><br /><br />

		<input type="submit" name="submit" value="Update Level" />

	</form>
</div>
