<div id="body">

	<p><?php echo anchor('category/create', 'Add a new category') ?></p>

	<p>
		<?php foreach ($categories as $category_item): ?>
			<?php echo anchor('category/update/'.$category_item['id'],
				$category_item['id'].' : '.$category_item['category']) ?><br />
		<?php endforeach ?>
	</p>

</div>
