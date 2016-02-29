<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tour extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->load->library('session');
        $this->load->model('tour_model');

    }

    public function search()
    {
        $xml = file_get_contents('php://input');
        $request = simplexml_load_string($xml);
        if($request->auth->username == 'mahmood' && $request->auth->password == 'mahmood123'){
            $queryB = $this->tour_model->getToursByCity($request->city);
            $result = $queryB->result_array();
            $xmlData = new SimpleXMLElement('<?xml version="1.0"?><tours></tours>');
            $this->arrayToXml($result, $xmlData);
            $XMLResult = $xmlData->asXML();
            return $this->output
                ->set_content_type('text/xml')
                ->set_status_header(200)
                ->set_output($XMLResult);
        }

    }
    function arrayToXml( $data, &$xml_data ) {
        foreach( $data as $key => $value ) {
            if( is_array($value) ) {
                if( is_numeric($key) ){
                    $key = 'tour';
                }
                $subnode = $xml_data->addChild($key);
                $this->arrayToXml($value, $subnode);
            } else {
                $xml_data->addChild("$key",htmlspecialchars("$value"));
            }
        }
    }
}
