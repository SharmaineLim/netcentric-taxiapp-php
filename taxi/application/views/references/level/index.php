
<div id="body">

	<p><?php echo anchor('level/create', 'Add a new level') ?></p>

	<p>
		<?php foreach ($levels as $level_item): ?>
			<?php echo anchor('level/update/'.$level_item['id'],
				$level_item['id'].' : '.$level_item['level']) ?><br />
		<?php endforeach ?>
	</p>

</div>
