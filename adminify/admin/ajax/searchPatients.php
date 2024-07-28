<?php
include '../config/connection.php';

if (isset($_POST['searchTerm'])) {
    $searchTerm = $_POST['searchTerm'];

    // Modify your SQL query to fetch filtered patient data based on the search term
    $query = "SELECT *, DATE_FORMAT(date_of_birth, '%b %d %Y') AS formatted_birth_date
          FROM patients 
          WHERE patient_name LIKE :searchTerm OR last_name LIKE :searchTerm OR middle_name LIKE :searchTerm";
    $stmt = $con->prepare($query);
    $stmt->bindValue(':searchTerm', "%$searchTerm%", PDO::PARAM_STR);
    $stmt->execute();

    // Output HTML for the filtered rows
    $count = 0;
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $count++;
        echo "<tr>";
        echo "<td>" . $count . "</td>";
        echo "<td>" . $row['patient_name'] . " " . $row['middle_name'] . ". " . $row['last_name'] . " " . $row['suffix'] . "</td>";
        echo "<td>" . "Brgy. " . $row['address'] . ", Purok " . " " . $row['purok'] . ", Tantangan " . ", South Cotabato " . "</td>";
        echo "<td>" . $row['formatted_birth_date'] . "</td>";
        echo "<td>" . $row['age'] . "</td>";
        echo "<td>" . $row['status'] . "</td>";
        echo "<td>" . $row['phone_number'] . "</td>";
        echo "<td>" . $row['gender'] . "</td>";
        echo "<td>" . $row['weight'] . "</td>";
        echo "<td>" . $row['blood_type'] . "</td>";
        echo "<td>" . $row['phil_mem'] . "</td>";
        echo "<td>" . $row['ps_mem'] . "</td>";
        echo "<td class='text-center'>";
        echo "<a href='update_patient.php?id=" . $row['id'] . "' class='btn btn-primary btn-sm btn-flat'>";
        echo "<i class='fa fa-edit'></i>";
        echo "</a>";
        echo "<form action='delete_patient.php' method='post' style='display: inline;' onsubmit='return confirmDelete();'>";
        echo "<button type='submit' name='delete_patient' value='" . $row['id'] . "' class='btn btn-danger btn-sm btn-flat'>";
        echo "<i class='fa fa-trash'></i>";
        echo "</button>";
        echo "</form>";
        echo "</td>";
        echo "</tr>";
    }
    
    echo "</tbody>";
    echo "</table>";
    echo "</div>";
    
    }
