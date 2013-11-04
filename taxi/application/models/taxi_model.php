<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Taxi_model extends CI_Model
{
	/*
	 * If taxi exists, forward to update()
	 * Else, insert new taxi into database
	 */
	public function create($data)
	{
		/* Check if $data has data */
		if ($data === NULL OR empty($data))
		{
			return;
		}

		/* Retrieve if taxi already exists */
		$data['no_company'] = TRUE;
		$retrieved = $this->retrieve($data);
		unset($data['no_company']);

		/* If taxi exists, update revision */
		if ( ! empty($retrieved))
		{
			$data['id_taxi'] = $retrieved['id'];
			unset($data['plate_number']);

			return $this->update($data);
		}

		/** If taxi doesn't exist, insert taxi and revision **/

		/* Move 'company' to its own array */
		$data2 = array(
			'company' => $data['company']
		);
		unset($data['company']);

		/* Insert new taxi */
		$inserted = $this->db->insert('taxi', $data);

		if ($inserted === TRUE)
		{
			/* Get id of inserted taxi */
			$data['no_company'] = TRUE;
			$temp = $this->retrieve($data);
			$data2['id_taxi'] = $temp['id'];

			/* Insert new revision */
			return $this->db->insert('taxi_revision', $data2);
		}

		return $inserted;
	}

	/* 
	 * Retrieve taxis from database
	 * If no parameter passed, all taxis are returned
	 * Can search by id or plate_number
	 */
	public function retrieve($data = FALSE)
	{
		$this->db->order_by('plate_number', 'asc');
		
		/* Retrieve all, with company */
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

		$data2 = array();

		/* Retrieve by id */
		if (array_key_exists('id', $data) && ctype_digit($data['id']))
		{
			$query = $this->db->get_where('taxi', array('id' => $data['id']));
			$data2 = $query->row_array();
		}

		/* Retrieve by plate number */
		else if (array_key_exists('plate_number', $data))
		{
			$query = $this->db->get_where('taxi', array('plate_number' => $data['plate_number']));
			$data2 = $query->row_array();
		}

		/* Retrieve company */
		if ( ! (array_key_exists('no_company', $data) OR empty($data2)))
		{
			$data2['company'] = $this->retrieve_history($data2)['company'];
		}
		
		return $data2;
	}

	/* 
	 * Retrieve taxi details' history from database:
	 * If $data['all'] exists, returns whole history
	 * Else, returns only the latest history
	 */
	public function retrieve_history($data)
	{
		/* Check if $data has data */
		if ($data === NULL OR empty($data))
		{
			return;
		}

		$id_taxi = 0;

		/* From 'id' or 'id_taxi', put in $id_taxi */
		if ( ! (array_key_exists('id', $data) && ctype_digit($data['id'])))
		{
			if ( ! (array_key_exists('id_taxi', $data) && ctype_digit($data['id_taxi'])))
			{
				return;
			}

			$id_taxi = $data['id_taxi'];
		}
		else
		{
			$id_taxi = $data['id'];
		}

		/* Retrieve all by id_taxi */
		if (array_key_exists('all', $data))
		{
			$query = $this->db->get_where('taxi_revision', array('id_taxi' => $id_taxi));
			return $query->result_array();
		}

		/* Get MAX(id) by taxi_id */
		$this->db->select_max('id');
		$query = $this->db->get_where('taxi_revision', array('id_taxi' => $id_taxi));
		$id = $query->row_array()['id'];
		//echo $id;

		/* Retrieve latest by id */
		$query = $this->db->get_where('taxi_revision',array('id' => $id));
		return $query->row_array();
	}

	/* 
	 * If something changed,
	 * insert new taxi revision into database
	 */
	public function update($data)
	{
		/* Check if $data has data */
		if ($data === NULL OR empty($data))
		{
			return;
		}

		/* Check if something changed */
		if ($data['company'] !== $this->retrieve_history($data)['company'])
		{
			return $this->db->insert('taxi_revision', $data);
		}
	}
}

/* End of file taxi_model.php */
/* Location: ./application/models/taxi_model.php */