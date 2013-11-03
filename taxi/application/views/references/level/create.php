
<div id="create">
	<?php echo validation_errors(); ?>

	<?php echo form_open('level/create') ?>

		<label for="level">Title</label>
		<input type="input" name="level" />

		<input type="submit" name="submit" value="Create Level" />

	</form>
</div>
