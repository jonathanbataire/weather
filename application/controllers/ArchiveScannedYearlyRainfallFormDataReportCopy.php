<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ArchiveScannedYearlyRainfallFormDataReportCopy extends CI_Controller {

    function __construct() {

        parent::__construct();
        error_reporting(E_PARSE);
        $this->load->model('DbHandler');
        $this->load->library('session');
        $this->load->library('encrypt');

    }
    public function index(){
        // $this->unsetflashdatainfo();
        $session_data = $this->session->userdata('logged_in');
        $userrole=$session_data['UserRole'];
        $userstation=$session_data['UserStation'];


        $query = $this->DbHandler->selectAll($userstation,'StationName','scans_yearly');  //value,field,table
        //  var_dump($query);
        if ($query) {
            $data['archivedscannedyearlyrainfallformreportdetails'] = $query;
        } else {
            $data['archivedscannedyearlyrainfallformreportdetails'] = array();
        }


        //Load the view.
        $this->load->view('archiveScannedYearlyRainfallFormDataReportCopy', $data);
    }

    public function DisplayFormToArchiveScannedYearlyRainfallFormReport(){
        $this->unsetflashdatainfo();
        $name='displaynewFormToArchiveScannedYearlyRainfallFormReport';
        $data['displaynewFormToArchiveScannedYearlyRainfallFormReport'] = array('name' => $name);

        //Get all Stations.
        $session_data = $this->session->userdata('logged_in');
        //$userrole=$session_data['UserRole'];
        $userstation=$session_data['UserStation'];

        $query = $this->DbHandler->selectAllFromSystemData($userstation,'StationName','stations');  //value,field,table
        //  var_dump($query);
        if ($query) {
            $data['stationsdata'] = $query;
        } else {
            $data['stationsdata'] = array();
        }

        /////////////////////////////////////////////////////////

        $this->load->view('archiveScannedYearlyRainfallFormDataReportCopy', $data);

    }
    public function DisplayFormToArchiveScannedYearlyRainfallFormReportForUpdate(){
        $this->unsetflashdatainfo();
        $session_data = $this->session->userdata('logged_in');
        $userstation=$session_data['UserStation'];

        $query = $this->DbHandler->selectAllFromSystemData($userstation,'StationName','stations');  //value,field,table
        //  var_dump($query);
        if ($query) {
            $data['stationsdata'] = $query;
        } else {
            $data['stationsdata'] = array();
        }




        $scannedyearlyrainfallformreportid = $this->uri->segment(3);

        $query = $this->DbHandler->selectById($scannedyearlyrainfallformreportid,'id','scans_yearly');  //$value, $field,$table
        if ($query) {
            $data['scannedyearlyrainfallformreportidDetails'] = $query;
        } else {
            $data['scannedyearlyrainfallformreportidDetails'] = array();
        }


        $this->load->view('archiveScannedYearlyRainfallFormDataReportCopy', $data);
    }


    public function insertInformationForArchiveScannedYearlyRainfallFormReport(){
        $this->unsetflashdatainfo();
        $session_data = $this->session->userdata('logged_in');
        $role=$session_data['UserRole'];

        $file_element_name = 'archievescannedcopy_yearlyrainfallformdatareport';


        $config['upload_path'] = 'archive/';
        // $config['upload_path'] = '/uploads/';
        $config['allowed_types'] = 'gif|jpg|png|jpeg|pdf|doc|docx|xlsx|ppt|pptx';
        $config['encrypt_name'] = FALSE;
        // $config['max_size'] = '2GB';
        //IMB=1024KB  2MB=2048KB   1GB=1024MB   2GB=2048MB
        //1MB=1024KB  THEN 2048MB=2097152KB
        $config['max_size'] = '2097152';  // Can be set to particular file size , here it is 2 MB(2048 Kb)
        $config['max_height'] = '768';
        $config['max_width'] = '1024';

        $config['remove_spaces'] = TRUE;

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload($file_element_name))
        {
            $status = 'error';
            echo   $msg = $this->upload->display_errors('', '');
        }
        else
        {
            $data = $this->upload->data();
            $filename = $data['file_name'];




            $formname = $this->input->post('formname_yearlyrainfallformreport');



                $station = $this->input->post('station_ArchiveScannedYearlyRainfallFormReport');
                $stationNo = $this->input->post('stationNo_ArchiveScannedYearlyRainfallFormReport');
                $stationId= $this->DbHandler->identifyStationById($station,$stationNo);



           // $monthOFScannedYearlyRainfallFormReport = $this->input->post('monthOfScannedYearlyRainfallFormReport_yearlyrainfallformreport');
            $yearOFScannedYearlyRainfallFormReport = $this->input->post('yearOfScannedYearlyRainfallFormReport_yearlyrainfallformreport');


            $description = $this->input->post('description_yearlyrainfallformreport');

            //$creationDate= date('Y-m-d H:i:s');
            $Approved="FALSE";
            $firstname=$session_data['FirstName'];
            $surname=$session_data['SurName'];
            $SubmittedBy=$user=$firstname.' '.$surname;

            $insertScannedYearlyRainfallFormReportDataDetails=array(
                'Form_scanned' => $formname, 
                'station' => $stationId, 'Year' => $yearOFScannedYearlyRainfallFormReport,
                'Approved'=> $Approved,'SY_SubmittedBy'=>$SubmittedBy,
                'Description'=>$description,'FileRef' => $filename);

            //$this->DbHandler->insertInstrument($insertInstrumentData);
            $insertsuccess= $this->DbHandler->insertData($insertScannedYearlyRainfallFormReportDataDetails,'scans_yearly'); //Array for data to insert then  the Table Name

            //Redirect the user back with  message
            if($insertsuccess){
                //Store User logs.
                //Create user Logs
                $session_data = $this->session->userdata('logged_in');
                $userrole=$session_data['UserRole'];
                $userstation=$session_data['UserStation'];
                $userstationNo=$session_data['StationNumber'];
                $name=$session_data['FirstName'].' '.$session_data['SurName'];

                $userlogs = array('User' => $name,
                    'UserRole' => $userrole,'Action' => 'Added new Scanned Metar Form details',
                    'Details' => $name . ' added new Scanned Metar Form details into the system ',
                    'StationName' => $userstation,
                    'StationNumber' => $userstationNo ,
                    'IP' => $this->input->ip_address());
                //  save user logs
                // $this->DbHandler->saveUserLogs($userlogs);


                $this->session->set_flashdata('success', 'New Scanned Metar Form details info was added successfully!');
                $this->index();

            }
            else{
                $this->session->set_flashdata('error', '"Sorry, we encountered an issue! ');
                $this->index();

            }

        }
    }
     public 	function update_approval() {
		$session_data = $this->session->userdata('logged_in');
      $userstation=$session_data['UserStation'];
	  $user_id=$session_data['Userid'];
		$id= $this->input->post('id');
		$data = array(
		'Approved' => $this->input->post('approve')
		
		);
		$query=$this->DbHandler->updateApproval1($id,$data,"scans_yearly");
		if ($query) {
		$this->session->set_flashdata('success', 'Data was updated successfully!');
		$this->index();
		}else{
		$this->session->set_flashdata('error', 'Sorry, Data was not updated, Please try again!');
		$this->index();	
		}
		}


    public function updateInformationForArchiveScannedYearlyRainfallFormReport(){
        $this->unsetflashdatainfo();

        $this->load->helper(array('form', 'url'));
        $session_data = $this->session->userdata('logged_in');
        $role=$session_data['UserRole'];

        $file_element_name = 'updatearchievescannedcopy_yearlyrainfallformdatareportcopy';

        if (isset($_FILES[$file_element_name]) && is_uploaded_file($_FILES[$file_element_name]['tmp_name'])) { //file has been uploaded
            $config['upload_path'] = 'archive/';
        // $config['upload_path'] = '/uploads/';
        $config['allowed_types'] = 'gif|jpg|png|jpeg|pdf|doc|docx|xlsx|ppt|pptx';
        $config['encrypt_name'] = FALSE;
        // $config['max_size'] = '2GB';
        //IMB=1024KB  2MB=2048KB   1GB=1024MB   2GB=2048MB
        //1MB=1024KB  THEN 2048MB=2097152KB
        $config['max_size'] = '2097152';  // Can be set to particular file size , here it is 2 MB(2048 Kb)
        $config['max_height'] = '768';
        $config['max_width'] = '1024';

        $config['remove_spaces'] = TRUE;

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload($file_element_name))
        {
            $status = 'error';
            echo   $msg = $this->upload->display_errors('', '');
        }
        else
        {
            $data = $this->upload->data();
            $filename = $data['file_name'];
        }
        }
        else {    //no file has been uploaded.

                $filename= $this->input->post('PreviouslyUploadedFileName_yearlyrainfallformdatareportcopy');
            }



            $formname = $this->input->post('formname');

                $station = $this->input->post('station');
                $stationNo = $this->input->post('stationNo');
                $stationId = $this->input->post('stationId');

            //$monthOFScannedMonthlyRainfallFormReport = $this->input->post('monthOfScannedMonthlyRainfallFormReport');
            $yearOFScannedYearlyRainfallFormReport = $this->input->post('yearOfScannedYearlyRainfallFormReport');


            $description = $this->input->post('description');
            $id = $this->input->post('id');
            $approved=$this->input->post('approval');


            $updateScannedYearlyRainfallFormReportDataDetails=array(
                'Approved'=>$approved,
                'station' => $stationId, 'year'=> $yearOFScannedYearlyRainfallFormReport,
                'Description'=>$description,'FileRef' => $filename);

            //$this->DbHandler->insertInstrument($insertInstrumentData);
            $updatesuccess=$this->DbHandler->updateData($updateScannedYearlyRainfallFormReportDataDetails,'','scans_yearly',$id);

            //Redirect the user back with  message
            if($updatesuccess){
                //Store User logs.
                //Create user Logs
                $session_data = $this->session->userdata('logged_in');
                $userrole=$session_data['UserRole'];
                $userstation=$session_data['UserStation'];
                $userstationNo=$session_data['StationNumber'];
                $name=$session_data['FirstName'].' '.$session_data['SurName'];

                $userlogs = array('User' => $name,
                    'UserRole' => $userrole,'Action' => 'Added new Scanned Annual Year Rainfall Form details',
                    'Details' => $name . ' added new Scanned Annual Year Rainfall Form details into the system ',
                    'StationName' => $userstation,
                    'StationNumber' => $userstationNo ,
                    'IP' => $this->input->ip_address());
                //  save user logs
                // $this->DbHandler->saveUserLogs($userlogs);


                $this->session->set_flashdata('success', 'New Scanned Annual Year Rainfall Form details info was added successfully!');
                $this->index();

            }
            else{
                $this->session->set_flashdata('error', '"Sorry, we encountered an issue! ');
                $this->index();

            }

       // }

    }
    public function deleteInformationForArchiveScannedYearlyRainfallFormReport() {
        $this->unsetflashdatainfo();

        $id = $this->uri->segment(3); // URL Segment Three.

        $rowsaffected = $this->DbHandler->deleteData('scans_yearly',$id);  //$rowsaffected > 0

        if ($rowsaffected) {
            //Store User logs.
            //Create user Logs
            $session_data = $this->session->userdata('logged_in');
            $userrole=$session_data['UserRole'];
            $userstation=$session_data['UserStation'];
            $userstationNo=$session_data['StationNumber'];
            $name=$session_data['FirstName'].' '.$session_data['SurName'];

            $userlogs = array('User' => $name,
                'UserRole' => $userrole,'Action' => 'Deleted instrument details',
                'Details' => $name . ' deleted instrument details into the system ',
                'StationName' => $userstation,
                'StationNumber' => $userstationNo ,
                'IP' => $this->input->ip_address());
            //  save user logs
            // $this->DbHandler->saveUserLogs($userlogs);

            $this->session->set_flashdata('success', 'Instrument info was deleted successfully!');
            $this->index();

            //redirect('/element', 'refresh');
        }
        else {

            $this->session->set_flashdata('error', '"Sorry, we encountered an issue! ');
            $this->index();

        }

    }
    function getInstruments($stationName) {  //Pass the StationName to get the Station Number.
        $this->load->helper(array('form', 'url'));

        $stationName = ($stationName == "") ? $this->input->post('stationName') : $stationName;
//check($value,$field,$table)
        if ($this->input->post('stationName') == "") {
            echo '<span style="color:#f00">Please Input Name. </span>';
        } else {


            //$get_result = $this->DbHandler->getResults($stationName, 'StationName', 'instruments');   // $value, $field, $table
            $data['results'] = $this->DbHandler->getResults($stationName, 'StationName', 'instruments');
            if($data['results']){   // we got a result, output json
                echo json_encode( $data['results'] );
            } else {
                echo json_encode( array('error' => true) );
            }

        }
    }
    ///Check DB against the DATE,STATIONName,StationNumber,TIME,METAR/SPECI OPTION
    function checkInDBIfArchiveScannedYearlyRainfallFormDataReportCopyRecordExistsAlready($year,$stationName,$stationNumber) {  //Pass the StationName to get the Station Number.
        $this->load->helper(array('form', 'url'));

        $stationName = ($stationName == "") ? $this->input->post('stationName') : $stationName;

        $year = ($year == "") ? $this->input->post('year') : $year;
        $stationNumber = ($stationNumber == "") ? $this->input->post('stationNumber') : $stationNumber;

        //check($value,$field,$table)
        if ($this->input->post('stationName') == "") {
            echo '<span style="color:#f00">Please Input Name. </span>';
        }
        else {


            $get_result = $this->DbHandler->checkInDBIfArchiveScannedYearlyRainfallFormDataReportCopyRecordExistsAlready($year,$stationName,$stationNumber,'scans_yearly');   // $value, $field, $table

            if( $get_result){
                echo json_encode($get_result);

            }
            else{

                echo json_encode($get_result);
            }
        }


    }
    public function unsetflashdatainfo(){

        if(isset($_SESSION['error'])){
            unset($_SESSION['error']);
        }

        elseif(isset($_SESSION['success'])){
            unset($_SESSION['success']);
        }
        elseif(isset($_SESSION['warning'])){
            unset($_SESSION['warning']);
        }
        elseif(isset($_SESSION['info'])){
            unset($_SESSION['info']);
        }

    }


}

?>
