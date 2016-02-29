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
        $requestXml = $this->getRequestXml($city);

        $responseXML = $this->sendRequestToGetData('http://localhost/test/b/index.php/tour/search', $requestXml);
        $response = simplexml_load_string($responseXML);
        $responseArray = json_decode(json_encode((array) $response), 1);

        $queryA = $this->tour_model->getToursByCity($city);
        $queryAResult = $queryA->result_array();
        if (!isset($responseArray['tour'][0]) && isset($responseArray['tour'])){
            // in this case the result contain one tour and its not a multidimensional;
            $responseArray['tour'] = array($responseArray['tour']);
        }
        if(isset($responseArray['tour'])){
            $allTours = array_merge($responseArray['tour'],$queryAResult);

        } else {
            $allTours = $queryAResult;

        }
        return $this->output
            ->set_content_type('application/json')
            ->set_status_header(200)
            ->set_output(json_encode($allTours));
    }
    private function getRequestXml($city){
        $request = array(
            "city" => $city,
            "auth" => array(
                'username' => 'mahmood',
                'password' => 'mahmood123'
            )
        );
        $xmlData = new SimpleXMLElement('<?xml version="1.0"?><toursrequest></toursrequest>');
        $this->arrayToXml($request,$xmlData);
        $result = $xmlData->asXML();
        return $result;
    }
    private function arrayToXml( $data, &$xml_data ) {
        foreach( $data as $key => $value ) {
            if( is_array($value) ) {
                if( is_numeric($key) ){
                    $key = 'item'.$key;
                }
                $subnode = $xml_data->addChild($key);
                $this->arrayToXml($value, $subnode);
            } else {
                $xml_data->addChild("$key",htmlspecialchars("$value"));
            }
        }
    }
    public function sendRequestToGetData($url, $xml){

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        //curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_POST, count($xml));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-type: application/xml',
            'Content-length: ' . strlen($xml)
        ));
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
