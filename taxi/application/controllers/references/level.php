<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Level extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('references/level_model');
		$this->load->helper('url');
	}

	public function index()
	{
		$data['levels'] = $this->level_model->retrieve();
		$data['title'] = 'Levels';

		$this->load->view('templates/header', $data);
		$this->load->view('references/level/index', $data);
		$this->load->view('templates/footer');
	}

	public function create()
	{
		$this->load->helper('form');
		$this->load->library('form_validation');

		$this->form_validation->set_rules('level', 'Level', 'required');

		if ($this->form_validation->run() === TRUE)
		{
			$data = array(
				'level' => $this->input->post('level')
			);

			$this->level_model->create($data);
			redirect('level');
		}
		else
		{
			$data['title'] = 'Add a New Level';

			$this->load->view('templates/header', $data);
			$this->load->view('references/level/create');
			$this->load->view('templates/footer');
		}
	}

	public function update($id = FALSE)
	{
		if ($id === FALSE)
		{
			redirect('level');
		}

		$this->load->helper('form');
		$this->load->library('form_validation');

		$this->form_validation->set_rules('level', 'Level', 'required');

		if ($this->form_validation->run() === TRUE)
		{
			$data = array(
				'id' => $id,
				'level' => $this->input->post('level')
			);

			$this->level_model->update($data);
			redirect('level');
		}
		else
		{
			$data2['id'] = $id;

			$data['level'] = $this->level_model->retrieve($data2);
			$data['title'] = 'Update Level';

			if (empty($data['level']))
			{
				redirect('level');
			}

			$data['level']['id'] = $id;

			$this->load->view('templates/header', $data);
			$this->load->view('references/level/update', $data);
			$this->load->view('templates/footer');
		}
	}
}

/* End of file level.php */
/* Location: ./application/controllers/references/level.php */