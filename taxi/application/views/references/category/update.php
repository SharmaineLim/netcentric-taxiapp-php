
<div id="body">
	<?php echo validation_errors(); ?>

	<?php echo form_open('category/update/'.$category['id']) ?>

		<label for="id">ID</label>
		<input type="input" name="id" value="<?php echo $category['id'] ?>" disabled /><br />

		<label for="category">Category</label>
		<input type="input" name="category" value="<?php echo $category['category'] ?>" /><br /><br />

		<input type="submit" name="submit" value="Update Category" />

	</form>
</div>
