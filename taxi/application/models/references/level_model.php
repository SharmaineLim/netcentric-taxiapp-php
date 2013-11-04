<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Level_model extends CI_Model
{
	/*
	 * If level doesn't exist,
	 * insert new level into database
	 */
	public function create($data)
	{
		/* Check if $data has data */
		if ($data === NULL OR empty($data))
		{
			return;
		}

		/* Check if level exists */
		if ( ! empty($this->retrieve($data)))
		{
			return;
		}

		return $this->db->insert('level', $data);
	}

	/* 
	 * Retrieve levels from database
	 * If no parameter passed, all levels are returned
	 * Can search by id or level
	 */
	public function retrieve($data = FALSE)
	{
		$this->db->order_by('id', 'desc');
		
		/* Retrieve all */
		if ($data === FALSE OR empty($data))
		{
			$query = $this->db->get('level');
			return $query->result_array();
		}

		$query = NULL;

		/* Retrieve by id */
		if (array_key_exists('id', $data) && ctype_digit($data['id']))
		{
			$query = $this->db->get_where('level', array('id' => $data['id']));
		}

		/* Retrieve by level */
		if (array_key_exists('level', $data))
		{
			$query = $this->db->get_where('level', array('level' => $data['level']));
		}
		
		return $query->row_array();
	}

	/* 
	 * Update level at id
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

		/* Update 'level' at $id */
		return $this->db->update('level', $data, $id);
	}
}

/* End of file level_model.php */
/* Location: ./application/models/references/level_model.php */