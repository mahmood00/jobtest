<?php

Class Tour_Model extends CI_Model
{
    public function getToursByCity($city)
    {
        $condition = "city =" . "'" . $city . "'";
        $this->db->select('*');
        $this->db->from('tours');
        $this->db->where($condition);
        $query = $this->db->get();
        return $query;
    }

}