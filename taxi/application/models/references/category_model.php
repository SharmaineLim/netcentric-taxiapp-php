<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Category_model extends CI_Model
{
	public function create($data)
	{
		if ($data === NULL OR empty($data))
		{
			return;
		}

		return $this->db->insert('category', $data);
	}

	public function retrieve($data = FALSE)
	{
		$this->db->order_by('category', 'asc');
		
		/* Retrieve all */
		if ($data === FALSE)
		{
			$query = $this->db->get('category');
			return $query->result_array();
		}

		/* Retrieve by id */
		if (ctype_digit($data))
		{
			$query = $this->db->get_where('category', array('id' => $data));
			return $query->row_array();
		}

		/* Retrieve by category */
		$query = $this->db->get_where('category', array('category' => $data));
		return $query->row_array();
	}

	/* Uncertain if this would work */
	public function update($data)
	{
		if ($data === NULL OR empty($data))
		{
			return;
		}

		$category = array(
			'category' => $data['category']
		);

		$id = array(
			'id' => $data['id']
		);

		return $this->db->update('category', $category, $id);
	}
}

/* End of file category_model.php */
/* Location: ./application/models/references/category_model.php */