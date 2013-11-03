<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Subcategory extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('references/subcategory_model');
	}

	public function index()
	{
		$this->load->helper('url');

		$data['subcategories'] = $this->subcategory_model->retrieve();
		$data['title'] = 'Subcategories';

		$this->load->view('templates/header', $data);
		$this->load->view('references/subcategory/index', $data);
		$this->load->view('templates/footer');
	}

	public function create()
	{

	}

	public function update($id)
	{

	}
}

/* End of file subcategory.php */
/* Location: ./application/controllers/references/subcategory.php */