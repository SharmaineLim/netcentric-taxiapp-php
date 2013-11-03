
<div id="body">
	<?php echo validation_errors(); ?>

	<?php echo form_open('subcategory/update') ?>

		<label for="id">ID</label>
		<input type="input" name="id" value="" /><br />

		<label for="category">Category</label>
		<select name="category">
			<option value="volvo">Volvo</option>
			<option value="saab">Saab</option>
			<option value="opel">Opel</option>
		  <option value="audi">Audi</option>
		</select><br />

		<label for="subcategory">Subcategory</label>
		<input type="input" name="subcategory" value="" /><br />

		<label for="level">Risk Level</label>
		<select name="level">
			<option value="high">High</option>
			<option value="medium">Medium Risk</option>
			<option value="low">Low Risk</option>
		  <option value="no">No Risk</option>
		</select><br /><br />

		<input type="submit" name="submit" value="Update Subcategory" />

	</form>
</div>
