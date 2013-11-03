<div id="container">
	<h1>Levels</h1>

	<div id="body">
		<div id="create">
			<?php echo validation_errors(); ?>

			<?php echo form_open('level') ?>

				<label for="level">Title</label>
				<input type="input" name="level" />

				<input type="submit" name="submit" value="Create Level" />

			</form>
		</div>
		<?php foreach ($levels as $level_item): ?>
			<?php echo anchor('level/update/'.$level_item['id'],
				$level_item['id'].' : '.$level_item['level']) ?><br />
		<?php endforeach ?>
	</div>
</div>