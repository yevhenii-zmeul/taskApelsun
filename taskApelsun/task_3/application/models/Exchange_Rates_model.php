<?php
class Exchange_Rates_model extends CI_Model {
    
    //api privatbank
    const RESOURCE = 'https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5';

    // a variable with the current exchange rate for the site
    private $site_course;

        public function __construct()
        {
            $this->load->database();
        }

        // get a new course
        public function get_new_course()
        {
            $data = file_get_contents(Exchange_Rates_model::RESOURCE);
            $courses = json_decode($data, true);
            
            // select the desired currencies
            foreach($courses as $course){
                if ($course['ccy']=="USD"){

                    $curr_course['usd_buy']=(float)$course['buy'];
                    $curr_course['usd_sale']=(float)$course['sale'];
                }
                if ($course['ccy']=="EUR"){

                    $curr_course['eur_buy']=(float)$course['buy'];
                    $curr_course['eur_sale']=(float)$course['sale'];
                }
            }
            
            // check the site rate variable
            if (empty($this->site_course))
            {
                // if the variable is empty, then we look at the last record in the database
                $this->site_course = $this->get_last_course();
            }
            
            // check with the course on the site
            if ($this->check_course($curr_course))
            {
                // if different then add to the database
                $this->add_course();
            }
    
            return $curr_course;
        }

        // get the whole story for output
        public function get_courses()
        {
            $query = $this->db->get('history_courses');
            return $query->result_array();

        }

        // function to check the last record
        protected function get_last_course()
        {
            $query = $this->db->query("SELECT * FROM history_courses ORDER BY date DESC LIMIT 1");
            return $query->result_array()[0];
           

        }

        // function to add a record
        protected function add_course()
        {
                $data = array(
                        'date' => date("Y-m-d"),
                        'usd_buy' => $this->site_course['usd_buy'],
                        'usd_sale' => $this->site_course['usd_sale'],
                        'eur_buy' => $this->site_course['eur_buy'],
                        'eur_sale' => $this->site_course['eur_sale'],
                );

                return $this->db->insert('history_courses', $data);
        }

        // function for checking the current course on the site and received by api
        protected function check_course($curr_course)
        {
            $course_flag = FALSE;

                if ($this->site_course['usd_buy'] != $curr_course['usd_buy'])
                {
                    $this->site_course['usd_buy'] = $curr_course['usd_buy'];
                    $course_flag = TRUE;
                }
                if ($this->site_course['usd_sale'] != $curr_course['usd_sale'])
                {
                    $this->site_course['usd_sale'] = $curr_course['usd_sale'];
                    $course_flag = TRUE;
                }
                if ($this->site_course['eur_buy'] != $curr_course['eur_buy'])
                {
                    $this->site_course['eur_buy'] = $curr_course['eur_buy'];
                    $course_flag = TRUE;
                }
                if ($this->site_course['eur_sale'] != $curr_course['eur_sale'])
                {
                    $this->site_course['eur_sale'] = $curr_course['eur_sale'];
                    $course_flag = TRUE;
                }
                
            return $course_flag;    
        }
}