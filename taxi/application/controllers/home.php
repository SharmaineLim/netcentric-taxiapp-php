<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller
{
	public function index()
	{
		$this->load->library('user_agent');
		
		if ($this->agent->is_mobile && !$this->agent->is_browser)
		{
			/* Code here */
			/* This is used as proof that the user_agent library is usable */
		}
		
		else
		{
			$data['title'] = 'Taxi App!';
			
			$this->load->view('templates/header', $data);
			$this->load->view('home/index');
			$this->load->view('templates/footer');
		}
	}
}

/* End of file home.php */
/* Location: ./application/controllers/home.php */