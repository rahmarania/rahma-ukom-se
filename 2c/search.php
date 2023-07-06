<!DOCTYPE html>
<html>
<head>
    <title>Cari Divisi</title>
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
        <label for="dvs">Pilih Divisi : </label>
        <input type="text" name="dvs" id="dvs" required>
        <button type="submit">OK</button>
    </form>
    <br>

    <h1>Data Pegawai</h1>
    
    <?php
    if (isset($_GET['dvs'])) {
            include "conn.php"; 

            // Get the value of Tanggal Presensi from the form
            $divisi = $_GET['dvs'];

            $query = "SELECT p.NIP, p.nama, p.alamat, p.tanggal_lahir, d.nama_divisi
                              FROM tblpegawai p
                              INNER JOIN tbldivisi d ON p.kode_divisi = d.kode_divisi
                              WHERE d.nama_divisi = '$divisi'";
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
                    echo "</tr>";

                    $no = 1;
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<tr>";
                        echo "<td>" . $no++ . "</td>";
                        echo "<td>" . $row['NIP'] . "</td>";
                        echo "<td>" . $row['nama'] . "</td>";
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
