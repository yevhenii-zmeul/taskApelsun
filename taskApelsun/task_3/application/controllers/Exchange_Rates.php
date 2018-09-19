<?php
class Exchange_Rates extends CI_Controller {

        // connect the necessary settings and caching for 10 minutes
        public function __construct()
        {
                parent::__construct();
                $this->load->model('exchange_rates_model');
                $this->load->helper('url');
                $this->output->cache(10);

        }
        
        // main page, it displays the current exchange rate
        public function index()
        {
                $data['new_course'] = $this->exchange_rates_model->get_new_course();
                $data['title'] = 'New course';

                $this->load->view('templates/header', $data);
                $this->load->view('exchange_rates/index', $data);
                $this->load->view('templates/footer');
        }

        // page with the history of the courses
        public function history()
        {
                $data['courses'] = $this->exchange_rates_model->get_courses();
                $data['title'] = 'History course';

                $this->load->view('templates/header', $data);
                $this->load->view('exchange_rates/history', $data);
                $this->load->view('templates/footer');
        }
}