<?php
session_start();
require 'dbconfig.php';


function validate($inputData)
{
    global $con;
    $validateData = mysqli_real_escape_string($con, $inputData);
    return trim($validateData);
}

function redirect($url, $status)
{
    $_SESSION['status'] = $status;
    header('Location: ' . $url);
    exit(0);
}
function alertmessage(){
    if (isset($_SESSION['status'])) {
        echo '<div class="alert alert-success">
        <h4>' . $_SESSION['status'] . '</h4>
        </div>';
        unset($_SESSION['status']);
    }
}

function insert($tablename,$data){
    global $con;

    $table = validate($tablename);

    $columns = array_keys($data);
    $values = array_values($data);
    $finalColumn = implode(', ',$columns);
    $finalValues = "'".implode("', '",$values)."'";

    $query = "INSERT INTO  $table($finalColumn) VALUES ($finalValues)";
    $result = mysqli_query($con,$query);
    return $result;



}

function update($tablename,$id,$data){
    global $con;

    $table = validate($tablename);
    $id = validate($id);

    $updateDataString = "";
    foreach( $data as $column => $value ){
        $updateDataString .= $column.'='."'$value',";

    }
    $finalUpdateData  = substr($updateDataString,0,-1);
    $query = "UPDATE $table SET $finalUpdateData WHERE id='$id'";
    $result = mysqli_query($con, $query);
    return $result;

}

function checkParamId($paramType)
{
    if (isset($_GET[$paramType])) {
        if ($_GET[$paramType] != null) {
            return $_GET[$paramType];
        } else {
            return 'No id found';
        }
    } else {
        return 'No id given';
    }
}

function getall($tablename)
{
    global $con;
    $tablename = validate($tablename);
    $query = "SELECT * FROM $tablename";
    $result = mysqli_query($con, $query);
    return $result;
}

function getByID($tablename, $id)
{
    global $con;
    $table = validate($tablename);
    $id = validate($id);

    $query = "SELECT * FROM $table WHERE id='$id' LIMIT 1";
    $result = mysqli_query($con, $query);

    if ($result) {
        if (mysqli_num_rows($result) == 1) {

            $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
            $response = [
                'status' => 200,
                'message' => 'Fetch data',
                'data' => $row
            ];
            return $response;
        } else {
            $response = [
                'status' => 404,
                'message' => 'No record found'
            ];
            return $response;
        }
    } else {
        $response = [
            'status' => 500,
            'message' => 'something went wrong'
        ];
        return $response;
    }
}
function deleteQuery($tablename, $id)
{
    global $con;

    $table = validate($tablename);
    $id = validate($id);

    $query = "DELETE FROM $tablename WHERE id='$id' LIMIT 1";
    $result = mysqli_query($con, $query);
    return $result;
}

function logoutSession()
{
    unset($_SESSION['loggedIn']);
    unset($_SESSION['loggedInuserRole']);
    unset($_SESSION['loggedInUser']);
}

function getCount($tablename)
{
    global $con;

    $table = validate($tablename);
    $query = "SELECT * FROM $table";
    $result = mysqli_query($con, $query);
    $totalCount = mysqli_num_rows($result);
    return $totalCount;
}



?>

