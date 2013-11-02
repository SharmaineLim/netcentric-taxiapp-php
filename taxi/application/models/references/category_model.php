<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Category_model extends CI_Model
{
	public function retrieve($id = FALSE)
	{
		if ($id == FALSE)
		{
			$query = $this->db->get('category');
			return $query->result_array();
		}
	}
}

/* End of file category_model.php */
/* Location: ./application/models/references/category_model.php */