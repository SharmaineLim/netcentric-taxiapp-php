<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Category extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('references/category_model');
	}

	public function index()
	{
		$this->load->helper('url');

		$data['categories'] = $this->category_model->retrieve();
		$data['title'] = 'Categories';

		$this->load->view('templates/header', $data);
		$this->load->view('references/category/index', $data);
		$this->load->view('templates/footer');
	}

	public function create()
	{
		$this->load->helper('form');
		$this->load->library('form_validation');

		$this->form_validation->set_rules('category', 'Category', 'required');

		if ($this->form_validation->run() === TRUE)
		{
			$data = array(
				'category' => $this->input->post('category')
			);

			$this->category_model->create($data);
			$this->index();
		}
		else
		{
			$data['title'] = 'Add a New Category';

			$this->load->view('templates/header', $data);
			$this->load->view('references/category/create');
			$this->load->view('templates/footer');
		}
	}

	public function update($id = FALSE)
	{
		$this->load->helper('url');

		$this->load->helper('form');
		$this->load->library('form_validation');

		$this->form_validation->set_rules('category', 'Category', 'required');

		if ($this->form_validation->run() === TRUE)
		{
			$data = array(
				'id' => $id,
				'category' => $this->input->post('category')
			);

			$this->category_model->update($data);
			$this->index();
		}
		else
		{
			if ($id === FALSE)
			{
				return $this->index();
			}

			$data2['id'] = $id;

			$data['category'] = $this->category_model->retrieve($data2);
			$data['title'] = 'Update category';

			if (empty($data['category']))
			{
				show_404();
			}

			$data['category']['id'] = $id;

			$this->load->view('templates/header', $data);
			$this->load->view('references/category/update', $data);
			$this->load->view('templates/footer');
		}
	}
}

/* End of file category.php */
/* Location: ./application/controllers/references/category.php */