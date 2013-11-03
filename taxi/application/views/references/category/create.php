
<div id="body">
	<?php echo validation_errors(); ?>

	<?php echo form_open('category/create') ?>

		<label for="category">Category</label>
		<input type="input" name="category" />

		<input type="submit" name="submit" value="Create Category" />

	</form>
</div>
