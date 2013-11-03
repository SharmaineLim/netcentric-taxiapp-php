<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Taxi extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('taxi_model');
	}

	public function index()
	{
		$data['taxis'] = $this->taxi_model->retrieve();
		$data['title'] = 'Taxis';

		$this->load->view('templates/header', $data);
		$this->load->view('taxi/index', $data);
		$this->load->view('templates/footer');
	}

	public function create()
	{
		$this->load->helper('form');
		$this->load->library('form_validation');

		$this->form_validation->set_rules('plate_number', 'Plate Number', 'required');

		if ($this->form_validation->run() === TRUE)
		{
			$data = array(
				'plate_number' => $this->input->post('plate_number'),
				'company' => $this->input->post('company')
			);

			$this->taxi_model->create($data);
			redirect('taxi');
		}
		else
		{
			$data['title'] = 'Add a Taxi';

			$this->load->view('templates/header', $data);
			$this->load->view('taxi/create');
			$this->load->view('templates/footer');
		}
	}

	public function update($id = FALSE)
	{
		if ($id === FALSE)
		{
			redirect('taxi');
		}

		$this->load->helper('form');
		$this->load->library('form_validation');

		$this->form_validation->set_rules('company', 'Company', 'required');

		if ($this->form_validation->run() === TRUE)
		{
			$data = array(
				'id_taxi' => $id,
				'company' => $this->input->post('company')
			);

			$this->taxi_model->update($data);
			redirect('taxi');
		}
		else
		{
			$data2['id'] = $id;

			$data['taxi'] = $this->taxi_model->retrieve($data2);
			$data['title'] = 'Update Taxi';

			if (empty($data['taxi']))
			{
				redirect('taxi');
			}

			$data['taxi']['id'] = $id;

			$this->load->view('templates/header', $data);
			$this->load->view('taxi/update', $data);
			$this->load->view('templates/footer');
		}
	}
}

/* End of file taxi.php */
/* Location: ./application/controllers/taxi.php */