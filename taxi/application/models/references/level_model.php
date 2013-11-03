<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Level_model extends CI_Model
{
	public function create($data)
	{
		if ($data === NULL OR empty($data))
		{
			return;
		}

		return $this->db->insert('level', $data);
	}

	public function retrieve($data = FALSE)
	{
		$this->db->order_by('id', 'desc');
		
		/* Retrieve all */
		if ($data === FALSE)
		{
			$query = $this->db->get('level');
			return $query->result_array();
		}

		/* Retrieve by id */
		if (ctype_digit($data))
		{
			$query = $this->db->get_where('level', array('id' => $data));
			return $query->row_array();
		}

		/* Retrieve by level */
		$query = $this->db->get_where('level', array('level' => $data));
		return $query->row_array();
	}

	/* Uncertain if this would work */
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

		return $this->db->update('level', $data, $id);
	}
}

/* End of file level_model.php */
/* Location: ./application/models/references/level_model.php */