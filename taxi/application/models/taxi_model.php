<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Taxi_model extends CI_Model
{
	public function __construct()
	{
		$this->load->database();
	}
}