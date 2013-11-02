<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Subcategory_model extends CI_Model
{
	public function __construct()
	{
		$this->load->database();
	}

	public function retrieve($id = FALSE)
	{
		if ($id == FALSE)
		{
			$query = $this->db->get('subcategory');
			return $query->result_array();
		}
	}
}

/* End of file subcategory_model.php */
/* Location: ./application/models/references/subcategory_model.php */