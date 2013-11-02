<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Level_model extends CI_Model
{
	public function __construct()
	{
		$this->load->database();
	}

	public function create()
	{
		$this->load->helper('url');

		$data = array(
			'level' => $this->input->post('level')
		);

		return $this->db->insert('level', $data);
	}

	public function retrieve($data = FALSE)
	{
		$this->db->order_by('id', 'desc');
		
		/* Retrieve all */
		if ($data == FALSE)
		{
			$query = $this->db->get('level');
			return $query->result_array();
		}

		/* Retrieve by id */
		if (is_int($data))
		{
			$query = $this->db->get_where('level', array('id' => $data));
			return $query->row_array();
		}

		/* Retrieve by level */
		if (is_string($data))
		{
			$query = $this->db->get_where('level', array('level' => $data));
			return $query->row_array();
		}
	}

	/* Uncertain if this would work */
	public function update()
	{
		$this->load->helper('url');

		$id = $this->input->post('id');

		if (empty($id))
		{
			return;
		}

		$data = array(
			'level' => $this->input->post('level')
		);

		return $this->db->update('level', $data, array('id' => $id));
	}
}

/* End of file level_model.php */
/* Location: ./application/models/references/level_model.php */