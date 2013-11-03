<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Subcategory_model extends CI_Model
{
	public function create($data)
	{
		if ($data === NULL OR empty($data))
		{
			return;
		}

		return $this->db->insert('subcategory', $data);
	}

	public function retrieve($data = FALSE)
	{
		$this->db->order_by('subcategory', 'asc');
		
		/* Retrieve all */
		if ($data === FALSE)
		{
			$query = $this->db->get('subcategory');
			return $query->result_array();
		}

		/* Retrieve by id */
		if (array_key_exists('id', $data) && ctype_digit($data['id']))
		{
			$query = $this->db->get_where('subcategory', array('id' => $data['id']));
			return $query->row_array();
		}

		/* Retrieve by subcategory */
		if (array_key_exists('subcategory', $data))
		{
			$query = $this->db->get_where('subcategory', array('subcategory' => $data['subcategory']));
			return $query->row_array();
		}
	}

	public function update($data)
	{
		if ($data === NULL OR empty($data))
		{
			return;
		}

		$id = array(
			'id' => $data['id']
		);

		unset($data['id']);

		return $this->db->update('subcategory', $data, $id);
	}
}

/* End of file subcategory_model.php */
/* Location: ./application/models/references/subcategory_model.php */