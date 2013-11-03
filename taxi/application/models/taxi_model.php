<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Taxi_model extends CI_Model
{
	public function create($data)
	{
		if ($data === NULL OR empty($data))
		{
			return;
		}

		$data2 = array(
			'company' => $data['company']
		);

		unset($data['company']);

		if ($this->db->insert('taxi', $data))
		{
			$data['no_company'] = TRUE;
			$temp = $this->retrieve($data);
			$data2['id_taxi'] = $temp['id'];

			return $this->db->insert('taxi_revision', $data2);
		}
	}

	public function retrieve($data = FALSE)
	{
		$this->db->order_by('plate_number', 'asc');
		
		/* Retrieve all */
		if ($data === FALSE OR empty($data))
		{
			$query = $this->db->get('taxi');
			$data2 = $query->result_array();

			for ($i = 0; $i < count($data2); $i++)
			{
				$data2[$i]['company'] = $this->retrieve_history($data2[$i])['company'];
			}

			return $data2;
		}

		/* Retrieve by id */
		if (array_key_exists('id', $data) && ctype_digit($data['id']))
		{
			$query = $this->db->get_where('taxi', array('id' => $data['id']));
			$data2 = $query->row_array();

			if ( ! array_key_exists('no_company', $data))
			{
				$data2['company'] = $this->retrieve_history($data2)['company'];
			}

			return $data2;
		}

		/* Retrieve by plate number */
		if (array_key_exists('plate_number', $data))
		{
			$query = $this->db->get_where('taxi', array('plate_number' => $data['plate_number']));
			$data2 = $query->row_array();

			if ( ! array_key_exists('no_company', $data))
			{
				$data2['company'] = $this->retrieve_history($data2)['company'];
			}
			
			return $data2;
		}
	}

	public function retrieve_history($data)
	{
		if ($data === NULL OR empty($data))
		{
			return NULL;
		}

		if ( ! (array_key_exists('id', $data) && ctype_digit($data['id'])))
		{
			return NULL;
		}

		/* Retrieve all by taxi id */
		if (array_key_exists('all', $data))
		{
			$query = $this->db->get_where('taxi_revision', array('id_taxi' => $data['id']));
			return $query->result_array();
		}

		/* Get MAX(id) by taxi id */
		$this->db->select_max('id');
		$query = $this->db->get_where('taxi_revision', array('id_taxi' => $data['id']));
		$id = $query->row_array()['id'];

		/* Retrieve latest by taxi id */
		$query = $this->db->get_where('taxi_revision',array('id' => $id));

		return $query->row_array();
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