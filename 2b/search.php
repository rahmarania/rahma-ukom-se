<!DOCTYPE html>
<html>
<head>
    <title>Cari Tanggal</title>
    <style>
        table {
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
        }
    </style>
</head>
<body>
    <form action="search.php" method="GET">
        <label for="tgl">Pilih Tanggal : </label>
        <input type="date" name="tgl" id="tgl" required>
        <button type="submit">OK</button>
    </form>
    <br>

    <h1>Data Presensi Pegawai </h1>
    
    <?php
    if (isset($_GET['tgl'])) {
            include "conn.php"; 

            // Get the value of Tanggal Presensi from the form
            $tanggal_presensi = $_GET['tgl'];

            // Search data based on Tanggal Presensi
            $query = "SELECT * FROM tblpresensi WHERE tanggal_presensi = '$tanggal_presensi'";
            $result = mysqli_query($con, $query);

            // Check if the query was successful
            if ($result) {
                // Check the search results
                if (mysqli_num_rows($result) > 0) {
                    // Display the search results in a table
                    echo "<table>";
                    echo "<tr>";
                    echo "<th>NO</th>";
                    echo "<th>NIP</th>";
                    echo "<th>Nama</th>";
                    echo "<th>Jam Masuk</th>";
                    echo "<th>Jam Pulang</th>";
                    echo "</tr>";

                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<tr>";
                        echo "<td>" . $row['id_presensi'] . "</td>";
                        echo "<td>" . $row['NIP'] . "</td>";
                        echo "<td>" . $row['Nama'] . "</td>";
                        echo "<td>" . $row['jam_masuk'] . "</td>";
                        echo "<td>" . $row['jam_pulang'] . "</td>";
                        echo "</tr>";
                    }

                    echo "</table>";
                } else {
                    echo "Data not found.";
                }
            } else {
                echo "Error: " . mysqli_error($con);
            }

        }
    ?>
</body>
</html>
