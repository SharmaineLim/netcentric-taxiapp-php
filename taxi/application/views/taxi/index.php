
<div id="body">

	<p><?php echo anchor('taxi/create', 'Add a new plate number') ?></p>

	<p>
		<?php foreach ($taxis as $taxi_item): ?>
			<?php echo anchor('taxi/update/'.$taxi_item['id'],
				$taxi_item['id'].' : '.$taxi_item['plate_number'].
				' ('.$taxi_item['company'].')') ?><br />
		<?php endforeach ?>
	</p>

</div>
