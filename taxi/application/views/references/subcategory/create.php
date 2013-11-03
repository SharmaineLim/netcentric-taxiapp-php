
<div id="body">
	<?php echo validation_errors(); ?>

	<?php echo form_open('subcategory/create') ?>

		<label for="category">Category</label>
		<select name="category">
			<?php
				foreach ($categories as $category_item)
				{
					echo '<option value="'.$category_item['id'].'">';
					echo $category_item['category'].'</option>';
				}
			?>
		</select><br />

		<label for="subcategory">Subcategory</label>
		<input type="input" name="subcategory" /><br />

		<label for="level">Risk Level</label>
		<select name="level">
			<?php
				foreach ($levels as $level_item)
				{
					echo '<option value="'.$level_item['id'].'">';
					echo $level_item['level'].'</option>';
				}
			?>
		</select><br /><br />

		<input type="submit" name="submit" value="Create Subcategory" />

	</form>
</div>
