<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->load->library('session');
        $this->load->model('user_model');

    }

    public function login()
    {
        $username = $this->input->post('username');
        $password = md5($this->input->post('password'));
        $data = array(
            'username' => $username,
            'password' => $password
        );
        $result = array('success' => false);
        if($this->user_model->login($data)){
            $result['success'] = true;
            $session_data = array(
                'username' => $username,
                'validated' => true
            );
            $this->session->set_userdata('logged_in', $session_data);
        }
        return $this->output
            ->set_content_type('application/json')
            ->set_status_header(200)
            ->set_output(json_encode($result));
    }
    private function isLogin(){
        if(!$this->session->userdata('validated')){
            redirect('login');
        }
    }
    public function createUser($username)
    {
        $data = array(
            'email' => $username . '@gmail.com',
            'username' => $username,
            'password' => md5($username),
            'api_key' => hash('sha256',$username)
            );
        if($this->user_model->insertUser($data)){
            echo "successfully registered<br>";
            echo "email : " . $data['email'] . '<br>';
            echo "username : " . $data['username'] . '<br>';
            echo "password : " . $username . '<br>';

        } else {
            echo "user mahmood already exist";

        }

    }
}
