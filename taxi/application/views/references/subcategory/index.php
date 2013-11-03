
<div id="body">

	<p><?php echo anchor('subcategory/create', 'Add a new subcategory') ?></p>

	<p>
		<?php foreach ($subcategories as $subcategory_item): ?>
			<?php echo anchor('subcategory/update/'.$subcategory_item['id'],
				$subcategory_item['id'].' : '.$subcategory_item['subcategory']) ?><br />
		<?php endforeach ?>
	</p>

</div>
