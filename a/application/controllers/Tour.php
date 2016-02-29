<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tour extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->load->library('session');
        $this->load->model('tour_model');
        if(!$this->isLogin()){
            //echo json_encode(array("error" => 'Please Login!!'));
            //exit();
        }
    }

    public function search()
    {
        $city = $this->input->post('city');
        $queryA = $this->tour_model->getToursByCity($city);
        $queryB = $this->getDataFromB();
        return $this->output
            ->set_content_type('application/json')
            ->set_status_header(200)
            ->set_output(json_encode($queryA->result()));
    }
    private function getDataFromB(){

    }
    public function postCURL($_url, $_param){

        $postData = '';
        //create name value pairs seperated by &
        foreach($_param as $k => $v)
        {
            $postData .= $k . '='.$v.'&';
        }
        rtrim($postData, '&');


        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$_url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_POST, count($postData));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);

        $output=curl_exec($ch);

        curl_close($ch);

        return $output;
    }
    private function isLogin(){
        if(!$this->session->userdata('validated')){
            return false;
        }
        return true;
    }
}
