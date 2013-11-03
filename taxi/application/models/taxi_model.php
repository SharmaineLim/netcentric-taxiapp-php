<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Taxi_model extends CI_Model
{
	public function create($data)
	{
		if ($data === NULL OR empty($data))
		{
			return;
		}

		return $this->db->insert('taxi', $data);
	}

	public function retrieve($data = FALSE)
	{
		$this->db->order_by('plateNumber', 'asc');
		
		/* Retrieve all */
		if ($data === FALSE OR empty($data))
		{
			$query = $this->db->get('taxi');
			return $query->result_array();
		}

		/* Retrieve by id */
		if (array_key_exists('id', $data) && ctype_digit($data['id']))
		{
			$query = $this->db->get_where('taxi', array('id' => $data['id']));
			return $query->row_array();
		}

		/* Retrieve by plate number */
		if (array_key_exists('plate_number', $data))
		{
			$query = $this->db->get_where('taxi', array('plateNumber' => $data['plate_number']));
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

		return $this->db->update('taxi', $data, $id);
	}
}

/* End of file taxi_model.php */
/* Location: ./application/models/taxi_model.php */