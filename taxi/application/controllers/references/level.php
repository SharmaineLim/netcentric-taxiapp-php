<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Level extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('references/level_model');
	}

	public function index()
	{
		$this->load->helper('form');
		$this->load->helper('url');
		$this->load->library('form_validation');

		$this->form_validation->set_rules('level', 'Level', 'required');

		if ($this->form_validation->run() === TRUE)
		{

			$data = array(
				'level' => $this->input->post('level')
			);

			$this->level_model->create($data);
		}

		$data['levels'] = $this->level_model->retrieve();
		$data['title'] = 'Levels';

		$this->load->view('templates/header', $data);
		$this->load->view('references/level/index', $data);
		$this->load->view('templates/footer');
	}

	public function create()
	{
		
	}

	public function update($id = FALSE)
	{
		if ($id === FALSE)
		{
			return $this->index();
		}


	}
}

/* End of file level.php */
/* Location: ./application/controllers/references/level.php */