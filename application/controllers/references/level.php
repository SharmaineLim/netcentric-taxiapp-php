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
		$this->load->library('form_validation');

		$this->form_validation->set_rules('level', 'Level', 'required');

		if ($this->form_validation->run() === TRUE)
		{
			$this->level_model->create();
		}

		$data['levels'] = $this->level_model->retrieve();
		$data['title'] = 'Levels';

		$this->load->view('templates/header', $data);
		$this->load->view('references/level/index', $data);
		$this->load->view('templates/footer');
	}
}