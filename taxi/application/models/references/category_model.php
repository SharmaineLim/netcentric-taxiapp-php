<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Category_model extends CI_Model
{
	/*
	 * If category doesn't exist,
	 * insert new category into database
	 */
	public function create($data)
	{
		/* Check if $data has data */
		if ($data === NULL OR empty($data))
		{
			return;
		}

		/* Check if category exists */
		if ( ! empty($this->retrieve($data)))
		{
			return;
		}

		return $this->db->insert('category', $data);
	}

	/* 
	 * Retrieve categories from database
	 * If no parameter passed, all categories are returned
	 * Can search by id or category
	 */
	public function retrieve($data = FALSE)
	{
		$this->db->order_by('category', 'asc');

		/* Retrieve all */
		if ($data === FALSE OR empty($data))
		{
			$query = $this->db->get('category');
			return $query->result_array();
		}

		$query = NULL;

		/* Retrieve by id */
		if (array_key_exists('id', $data) && ctype_digit($data['id']))
		{
			$query = $this->db->get_where('category', array('id' => $data['id']));
		}

		/* Retrieve by category */
		else if (array_key_exists('category', $data))
		{
			$query = $this->db->get_where('category', array('category' => $data['category']));
		}

		return $query->row_array();
	}

	/* 
	 * Update category at id
	 */
	public function update($data)
	{
		/* Check if $data has data */
		if ($data === NULL OR empty($data))
		{
			return;
		}

		/* Put 'id' in its own array */
		$id = array(
			'id' => $data['id']
		);
		unset($data['id']);

		/* Update 'category' at $id */
		return $this->db->update('category', $data, $id);
	}
}

/* End of file category_model.php */
/* Location: ./application/models/references/category_model.php */