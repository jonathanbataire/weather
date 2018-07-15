<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//session_start(); //we need to start session in order to access it through CI
class Users extends CI_Controller {

    function __construct() {

        parent::__construct();
        error_reporting(E_PARSE);
        $this->load->model('DbHandler');
        $this->load->library('session');
        $this->load->library('encrypt');


    }
    public function index(){
        //$this->unsetflashdatainfo();
        $this->session->sess_expire_on_close = TRUE;
        $session_data = $this->session->userdata('logged_in');
        $userrole=$session_data['UserRole'];
        $userstation=$session_data['StationId'];


        $query = $this->DbHandler->selectAllSystemUsers($userstation,'station','systemusers');  //value,field,table
        //  var_dump($query);
        if ($query) {
            $data['allusers'] = $query;
        } else {
            $data['allusers'] = array();
        }

        //All Stations
        $query = $this->DbHandler->selectAllFromSystemData($userstation,'StationName','stations');
        //  var_dump($query);
        if ($query) {
            $data['stationsdata'] = $query;
        } else {
            $data['stationsdata'] = array();
        }

        $this->load->view('users', $data);
    }

    public function DisplayStationUsersForm(){
        $this->unsetflashdatainfo();
        $name='displaynewstationuserform';
        $data['displaynewstationuserform'] = array('name' => $name);

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


        $this->load->view('users', $data);

    }
    public function DisplayStationUsersFormForUpdate(){
        $this->unsetflashdatainfo();
        $session_data = $this->session->userdata('logged_in');
        $userrole=$session_data['UserRole'];
        $userstation=$session_data['UserStation'];

        $query = $this->DbHandler->selectAllFromSystemData($userstation,'StationName','stations');  //value,field,table
        if ($query) {
            $data['stationsdata'] = $query;
        } else {
            $data['stationsdata'] = array();
        }

        ///////////////////////////////////////////////////////////////////////

        $userid = $this->uri->segment(3);
        $query = $this->DbHandler->selectUserById($userid,'Userid','systemusers');  //$value, $field,$table
        if ($query) {
            $data['stationuserdataid'] = $query;
        } else {
            $data['stationuserdataid'] = array();
        }


        $this->load->view('users', $data);
    }



    public function insertUser(){
        $this->unsetflashdatainfo();
                $session_data = $this->session->userdata('logged_in');
        $UserRole=$session_data['UserRole'];
        $firstname =firstcharuppercase(chgtolowercase($this->input->post('user_firstname')));
        //$fname=firstcharuppercase($firstname);
        $surname = firstcharuppercase(chgtolowercase($this->input->post('user_surname')));
        //$sname=firstcharuppercase($surname);
        $useremail = chgtolowercase($this->input->post('user_email'));
        $userphone = $this->input->post('user_phone');
        //$urole=firstcharuppercase($URole);

        if($UserRole=="Manager" || $UserRole=="ManagerData"){
            $userRoleAssigned = $this->input->post('user_Role_AssignedBy_Manager');
            $station = firstcharuppercase(chgtolowercase($this->input->post('user_station_Manager')));
            $stationNo = $this->input->post('user_stationNo_Manager');
          }
      else if($UserRole=="OC"){
          $userRoleAssigned = $this->input->post('user_Role_AssignedBy_OC');
          $station = firstcharuppercase(chgtolowercase($this->input->post('user_station_OC')));
          $stationNo = $this->input->post('user_stationNo_OC');
        }

      if($userRoleAssigned=="OC" || $userRoleAssigned=="Observer" || $userRoleAssigned=="ObserverArchive" || 
      $userRoleAssigned=="WeatherAnalyst" || $userRoleAssigned=="ObserverDataEntrant" || $userRoleAssigned=="WeatherForecaster"){

                $stationRegion = "NULL";

            }elseif($userRoleAssigned=="ZonalOfficer" || $userRoleAssigned=="SeniorZonalOfficer"){

              $station ="";
              $stationNo ="";
              $stationRegion = $this->input->post('user_stationRegion_AssignedBy_Manager');
            }else{
          $station ="";
          $stationNo ="";
          $stationRegion = "";
        }

        $createdBy=$UserRole;
        $active = 1;
        $reset=1;


        //Before you insert check for Duplicate User.
        //Send User Credentials to the Email Address
        $result=$this->DbHandler->checkforDuplicateUserDetails($firstname,$surname,$useremail,$station,$stationNo,$stationRegion,$userRoleAssigned);
        //print_r($result); exit('hey...');
        if(!$result){
           $stationId=$this->DbHandler->identifyStationById($station,$stationNo);
            $generatedusername = firstcharlowercase(firstletter($firstname)).'.'.firstcharlowercase($surname);
            //Check if username to be generated Exists in the DB Already
            //$usernameExists=$this->DbHandler->checkIfUserNameExistsAlreadyInDB($username);
            $counter =-1;
            $username = $this->DbHandler->generateUniqueUsername($generatedusername,$surname,$counter);
            

            if($username != false){

            $randompassword = $this->generatePasswdString();
            if($randompassword){
                $encryptpassword=md5($randompassword);

                //UserName:FirstLeta of FirstName and the SurName
                //Load a custom helper
                $this->load->helper("myphpstringfunctions_helper");

               // $username = firstcharlowercase(firstletter($firstname)).'.'.firstcharlowercase($surname);



                      //Send the User Credentials.
                      $htmlmessage = 'Hello '.''.$firstname.' '.$surname.'<br></br><br></br>'.
                          'Your  New WIMEA-ICT Web Interface  Credentials are'.'<br></br><br></br>'.
                          'You have been assigned as '.$userRoleAssigned.'<br></br><br></br>'.
                          'UserName:'.''.'<b><em>'.$username.'</b></em><br></br><br></br>'.
                          'Password:'.''.'<b><em>'.$randompassword.'</b></em><br></br><br></br>'.
                          '<a href="http://www.wimea.mak.ac.ug/wdr/">Click here to login!</a>'.
                          'Thank You'.'<br></br><b></br><b></br>'.'WIMEA-ICT';

                      //If true an Email has been sent Else
                      $results=$this->sendMail($htmlmessage,$useremail);
                      if($results){ 

                  $insertUserData=array(
                      'FirstName' => $firstname, 'SurName' => $surname,
                      'UserPassword' => $encryptpassword,'UserName' => $username,
                      'UserEmail' => $useremail, 'UserPhone' => $userphone,
                      'UserRole' => $userRoleAssigned, 'station' => $stationId,
                      "region_zone" => $stationRegion,
                      'LastPasswdChange'=> date('Y-m-d H:i:s'),
                      'LastLoggedIn'=>date('Y-m-d H:i:s'),
                      'Active'=>$active,
                      'Reset'=>$reset,'CreatedBy'=>$createdBy);
                  $insertsuccess= $this->DbHandler->insertData($insertUserData,'systemusers');
                  
                  if($insertsuccess){

                    $session_data = $this->session->userdata('logged_in');
                        $userrole=$session_data['UserRole'];
                        $userstationId=$session_data['StationId'];
                        $id=$session_data['Userid'];
                        $name=$session_data['FirstName'].' '.$session_data['SurName'];

                        $data_id = $this->DbHandler->getdataid($insertUserData,'systemusers','Userid');
                        $userlogoutlogs = array('Userid' => $id,'Action' => 'Added User Details','data_id'=>$data_id,
                            'Details' => $name . ' Inserted '.$userRoleAssigned.' '.$firstname.' '.$surname. ' in the system ',
                            'IP' => $this->input->ip_address());
                        //  save user logs
                         $this->DbHandler->saveUserLogs($userlogoutlogs);

                    $this->session->set_flashdata('success', 'New User info was added successfully and User Password has been sent to their email!');
                      $this->index();



                  }//end of if failed to insert
                  //Failed to insert the user
                  else{
                      $this->session->set_flashdata('error', '"Sorry, we encountered an issue User has not been inserted! ');
                      $this->index();
                  }
                       }
                        else{ //User Email has not been sent
                              $this->session->set_flashdata('error', 'Email not sent and user has not been inserted');
                              $this->index();

                         }
                
        }//end of if random password
            else{
            $this->session->set_flashdata('error','Failed to generate random password');
                $this->index();

        } //end of else
               }//end of if username exists already
               else{
                   $retd = 'Account Names'.' '. $firstname .' '. $surname.''.' already has a username in the System';
                   $this->session->set_flashdata('error', $retd);
                   $this->index();
               }
        }  //Duplicate Results in the DB already
        //When user to be inserted has the same info in the db
        else{


            $ret = 'Account with email '.' '. $useremail.' and user role '.chgtouppercase($userRoleAssigned).''.' is already in the System';
            $this->session->set_flashdata('error', $ret);
            $this->index();

        }



    }


    public function SelectManagerStations(){
       
        $this->load->helper(array('form', 'url'));

        $region = ($stationName == "") ? $this->input->post('region') : $region;
        $result = $this->DbHandler->SelectZonalStations($region);   // $value, $field, $table
        echo json_encode($result);
    }

    public function generatePasswdString(){
        $this->unsetflashdatainfo();
        $this->load->helper(array('string'));

        return random_string('alnum', 8);
    }
    public function  sendMail($htmlmsgbody,$msgreceiver)
    {
        $this->unsetflashdatainfo();
        $this->load->library('email');

        $config['protocol'] = 'smtp';
        $config['smtp_host'] = 'ssl://smtp.gmail.com';
        $config['smtp_port'] = '465';
        $config['smtp_user'] = 'wimeaictwdr@gmail.com';  //change it
        $config['smtp_pass'] = '1c7wimearepo.'; //change it
        $config['charset'] = 'utf-8';
        $config['newline'] = "\r\n";
        $config['mailtype'] = 'html';


        $config['wordwrap'] = TRUE;
        $this->email->initialize($config);

        $this->email->from('wimeaictwdr@gmail.com','WIMEA-ICT');   //change it
        $this->email->to($msgreceiver);       //change it
        $this->email->subject("WIMEA-ICT Web Interface Credentials");
        $this->email->message($htmlmsgbody);

        if($this->email->send(FALSE)) {
            return true;
        } else {
            return false;//die("not sent".$this->email->print_debugger(array('headers')));
        }
        // if ($this->email->send()) {
        //return  'success';
        //    $data['success'] = 1;
        // return true;
        // } else {
        //   $data['success'] = 0;
        //   $data['error']= $this->email->print_debugger(array('headers'));
        //return false;
        //}
        //   echo "<pre>";
        //   print_r($data);
        //  echo "</pre>";

    }
    public function updateUser(){
        $this->unsetflashdatainfo();

        $this->load->helper(array('form', 'url'));
        $session_data = $this->session->userdata('logged_in');
        $UserRole=$session_data['UserRole'];
        $ocStationid = $session_data['StationId'];

        $firstname =firstcharuppercase(chgtolowercase( $this->input->post('firstname')));
        //$fname=firstcharuppercase($firstname);
        $surname = firstcharuppercase(chgtolowercase($this->input->post('surname')));
        //$sname=firstcharuppercase($surname);
        $useremail = chgtolowercase($this->input->post('email'));
        $userphone = $this->input->post('contact');
        $id = $this->input->post('id');
        $stationId = $this->input->post('stationId_Manager');
        //$urole=firstcharuppercase($URole);

        if($UserRole=="Manager" || $UserRole=="ManagerData"){
            $userRoleAssigned = $this->input->post('Role_AssignedBy_Manager');
            $stationRegion = $this->input->post('stationRegion_AssignedBy_Manager');
            $stationid = $this->input->post('stationid');

        }
        else if($UserRole=="OC"){
            $userRoleAssigned = $this->input->post('Role_AssignedBy_OC');
            $station = firstcharuppercase(chgtolowercase($this->input->post('station_OC')));
            $stationNo = $this->input->post('stationNo_OC');
            $stationRegion = $this->input->post('stationRegion_OC');
            $stationid = $ocStationid;
        }

        if($userRoleAssigned=="OC" || $userRoleAssigned=="Observer" || $userRoleAssigned=="ObserverArchive" || 
      $userRoleAssigned=="WeatherAnalyst" || $userRoleAssigned=="ObserverDataEntrant" || $userRoleAssigned=="WeatherForecaster"){

                  $updateUserData=array(
                    'station' => $stationid,'FirstName' => $firstname, 'SurName' => $surname,
                    'UserEmail' => $useremail, 'UserPhone' => $userphone,'UserRole' => $userRoleAssigned);
       }
       elseif($userRoleAssigned=="ZonalOfficer" ||$userRoleAssigned=="SeniorZonalOfficer" ){

        $updateUserData=array(
            'region_zone' => $stationRegion,'station' => 0,'FirstName' => $firstname, 'SurName' => $surname,
            'UserEmail' => $useremail, 'UserPhone' => $userphone,'UserRole' => $userRoleAssigned);

        }else{
          
        $updateUserData=array(
            'FirstName' => $firstname, 'SurName' => $surname,
            'UserEmail' => $useremail, 'UserPhone' => $userphone,'UserRole' => $userRoleAssigned);  
        }

            $session_data = $this->session->userdata('logged_in');
            $userrole=$session_data['UserRole'];
            $userstation=$session_data['UserStation'];
            $userstationNo=$session_data['StationNumber'];
            $StationRegion=$session_data['StationRegion'];
            $userstationId=$session_data['StationId'];
            $name=$session_data['FirstName'].' '.$session_data['SurName'];

            $userlogs = array('User' => $name,
            'UserRole' => $userrole,'Action' => 'Updated User Details',
            'Details' => $name . ' updated user details in the system ',
            'station' => $userstationId ,
            'IP' => $this->input->ip_address());
        
        $updatesuccess=$this->DbHandler->updateUser($updateUserData, $updateUserData2,'systemusers',$id,$stationId,$userlogs);

        //Redirect the user back with  message
        if($updatesuccess){
            //Store User logs.
            //Create user Logs
           /* $session_data = $this->session->userdata('logged_in');
            $userrole=$session_data['UserRole'];
            $userstation=$session_data['UserStation'];
            $userstationNo=$session_data['StationNumber'];
            $StationRegion=$session_data['StationRegion'];
            $userstationId=$session_data['StationId'];
            $name=$session_data['FirstName'].' '.$session_data['SurName'];

           /* $userlogs = array('User' => $name,
                'UserRole' => $userrole,'Action' => 'Updated user details',
                'Details' => $name . ' updated user details in the system ',
                'station' => $userstationId ,
                'IP' => $this->input->ip_address());
            //  save user logs
            $this->DbHandler->saveUserLogs($userlogs);*/



            $this->session->set_flashdata('success', 'User Information has been updated successfully!');
            $this->index();

        }
        else{
            $this->session->set_flashdata('error', 'Sorry, we encountered an issue!');
            $this->index();

        }



    }
    public function deleteUser() {
        $this->unsetflashdatainfo();

        $id = $this->uri->segment(3); // URL Segment Three.
        //$id = $this->uri->segment(3); // URL Segment Three.

        $rowsaffected = $this->DbHandler->deleteUser('systemusers',$id);  //$rowsaffected > 0  //$tablename,id of the row

        if ($rowsaffected) {

            //Store User logs.
            //Create user Logs
            $session_data = $this->session->userdata('logged_in');
            $userrole=$session_data['UserRole'];
            $userstation=$session_data['UserStation'];
            $userstationNo=$session_data['StationNumber'];
            $userstationId=$session_data['StationId'];
            $name=$session_data['FirstName'].' '.$session_data['SurName'];

            $userlogs = array('User' => $name,
                'UserRole' => $userrole,'Action' => 'Deleted user details',
                'Details' => $name . ' deleted user details in the system ',
                'station' => $userstationId ,
                'IP' => $this->input->ip_address());
            //  save user logs
            // $this->DbHandler->saveUserLogs($userlogs);

            $this->session->set_flashdata('success', 'User info was deleted successfully!');
            $this->index();

            //redirect('/element', 'refresh');
        }
        else {

            $this->session->set_flashdata('error', '"Sorry, we encountered an issue! ');
            $this->index();

        }

    }

    function getPopuplogs(){
        $date = rawurldecode($this->uri->segment(4));
        $userid = rawurldecode($this->uri->segment(3));
        $result=$this->DbHandler->getPopuplogs($date,$userid);

        if($result){
            $data = array(
                'result' => $result
                );
        }else{
            $data = array(
                'result' => 'none'
                );
        }
       
        echo json_encode($data);
    }

    public function activateUser() {
        $this->unsetflashdatainfo();

        $id = $this->uri->segment(3); // URL Segment Three.
        //$id = $this->uri->segment(3); // URL Segment Three.

        $rowsaffected = $this->DbHandler->activateUser('systemusers',$id);  //$rowsaffected > 0  //$tablename,id of the row

        if ($rowsaffected) {

            //Store User logs.
            //Create user Logs
            $session_data = $this->session->userdata('logged_in');
            $userrole=$session_data['UserRole'];
            $userstation=$session_data['UserStation'];
            $userstationNo=$session_data['StationNumber'];
            $userstationId=$session_data['StationId'];
            $name=$session_data['FirstName'].' '.$session_data['SurName'];

            $userlogs = array('User' => $name,
                'UserRole' => $userrole,'Action' => 'Updated User Details',
                'Details' => $name . ' Activated user details in the system ',
                'station' => $userstationId ,
                'IP' => $this->input->ip_address());
            //  save user logs
            // $this->DbHandler->saveUserLogs($userlogs);

            $this->session->set_flashdata('success', 'User info was Activated successfully!');
            $this->index();

            //redirect('/element', 'refresh');
        }
        else {

            $this->session->set_flashdata('error', '"Sorry, we encountered an issue! ');
            $this->index();

        }

    }
    
    public function GetUserLogs(){
        $region=$this->input->post('region');
        $station=$this->input->post('station');
        $action=$this->input->post('action');
        $typeofform=$this->input->post('typeofform');
        $startdate=$this->input->post('startdate');
        $enddate=$this->input->post('enddate');
        $data['datedisplay1'] = $startdate;
        $data['datedisplay2'] = $enddate;
        $result=$this->DbHandler->GetUserLogs($station,$action,$typeofform,$startdate,$enddate);
        if ($result) {
            
            $data['userlogsdata'] = $result;
            
        } else {
            $data['userlogsdata'] = array();
        }
        $this->load->view('userlogs', $data);
       // print_r($result);
        //exit($startdate.' - '.$enddate);
    }

    public function userlogs() {
        $this->unsetflashdatainfo();
        $session_data = $this->session->userdata('logged_in');
        $userrole=$session_data['UserRole'];
        $userstation=$session_data['UserStation'];
        $userregion=$session_data['ZonalRegion'];
        //exit('hey...'.$userregion);


        $query1 = $this->DbHandler->SelectZonalStations($userregion);
        //  var_dump($query);
        if ($query1) {
            $data['zonalstations'] = $query1;
        } else {
            $data['zonalstations'] = array();
        }

        $this->load->view('userlogs', $data);

    }

    public function deleteUserLogs() {
        $this->unsetflashdatainfo();

        $id = $this->uri->segment(3); // URL Segment Three.

        $query = $this->DbHandler->deleteUserLogs($id);

        if ($this->db->affected_rows() > 0) {
            $StationElementlogs = array('user' => $this->session->userdata('username'),
                'userid' => $this->session->userdata('id'), 'action' => 'Deleted User Logs info',
                'details' => $this->session->userdata('username') . ' Deleted User Logs info into the system ',
                 'ip' => $this->input->ip_address());
            //  save user logs
            $this->DbHandler->saveUserLogs($StationElementlogs);

            redirect('/element', 'refresh');
        } else {

            redirect('/element', 'refresh');
        }

    }
    ///Check DB against the DATE,STATIONName,StationNumber,TIME,METAR/SPECI OPTION
    function checkInDBIfUserDetailsRecordExistsAlready($firstname,$surname,$email,$stationName,$stationNumber,$stationRegion,$userRole) {  //Pass the StationName to get the Station Number.
        $this->load->helper(array('form', 'url'));

        $stationName = ($stationName == "") ? $this->input->post('stationName') : $stationName;
        $firstname = ($firstname == "") ? $this->input->post('firstname') : $firstname;
        $stationNumber = ($stationNumber == "") ? $this->input->post('stationNumber') : $stationNumber;
        $stationRegion = ($stationRegion == "") ? $this->input->post('stationRegion') : $stationRegion;
        $userRole = ($userRole == "") ? $this->input->post('userRole') : $userRole;
        $surname = ($surname == "") ? $this->input->post('surname') : $surname;
        //$phone = ($phone == "") ? $this->input->post('phone') : $phone;
        $email = ($email == "") ? $this->input->post('email') : $email;
        //check($value,$field,$table)
        if ($this->input->post('stationName') == "") {
            echo '<span style="color:#f00">Please Input Name. </span>';
        }
        else {
            $stationId= $this->DbHandler->identifyStationById($stationName, $stationNumber);
            $get_result = $this->DbHandler->checkInDBIfUserDetailsRecordExistsAlready($firstname,$surname,$email,$stationId,$userRole,'systemusers');   // $value, $field, $table

            if( $get_result){
                echo json_encode($get_result);

            }
            else{

                echo json_encode($get_result);
            }
        }


    }

    function checkInDBIfUserDetailsRecordExistsAlreadyWithSameStationRegion($firstname,$surname,$email,$stationRegion) {  //Pass the StationName to get the Station Number.
        $this->load->helper(array('form', 'url'));

        $stationRegion = ($stationRegion == "") ? $this->input->post('stationRegion') : $stationRegion;
        $firstname = ($firstname == "") ? $this->input->post('firstname') : $firstname;
       // $stationNumber = ($stationNumber == "") ? $this->input->post('stationNumber') : $stationNumber;
        $surname = ($surname == "") ? $this->input->post('surname') : $surname;
        //$phone = ($phone == "") ? $this->input->post('phone') : $phone;
        $email = ($email == "") ? $this->input->post('email') : $email;
        //check($value,$field,$table)
        if ($this->input->post('stationRegion') == "") {
            echo '<span style="color:#f00">Please Input Name. </span>';
        }
        else {


            $get_result = $this->DbHandler->checkInDBIfUserDetailsRecordExistsAlreadyWithSameStationRegion($firstname,$surname,$email,$stationRegion,'systemusers');   // $value, $field, $table

            if( $get_result){
                echo json_encode($get_result);

            }
            else{

                echo json_encode($get_result);
            }
        }


    }
    public function checkifemailexistsInDB() {
        $this->load->helper(array('form', 'url'));

        $email = $this->input->post('useremail');
        if ($email == "") {
            echo '<span style="color:#f00">Please Input E-mail Address. </span>';
        } else {
                    //check($value,$field,$table)
            $get_result = $this->DbHandler->check($email, 'UserEmail', 'systemusers');    // $value, $field, $table

            if ($get_result)
                echo '<span style="color:#f00">Email already in use. </span>';
            else
                echo '<span style="color:#0c0">Email not in use</span>';
        }
    }

    public function base64url_encode($data) {
        return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
    }
    public function base64url_decode($data) {
        return base64_decode(str_pad(strtr($data, '-_', '+/'), strlen($data) % 4, '=', STR_PAD_RIGHT));
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
