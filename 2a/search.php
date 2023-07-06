<!DOCTYPE html>
<html>
<head>
    <title>Cari NIP</title>
</head>
<body>
    <form action="search.php" method="GET">
        <label for="nip">NIP:</label>
        <input type="text" name="nip" id="nip" required>
        <button type="submit">Cari</button>
    </form>
    <br>

    <h1>Hasil Pencarian Data Pegawai</h1>
    
    <?php
    if (isset($_GET['nip'])) {
        include "conn.php"; 

        // Mendapatkan nilai NIP dari form
        $nip = $_GET['nip'];

        // Pencarian data berdasarkan NIP
        $query = "SELECT * FROM tblpegawai WHERE NIP = $nip";
        $result = mysqli_query($con, $query);

        // Memeriksa apakah query berhasil
        if ($result) {
            // Memeriksa hasil pencarian
            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo 'Nama : ' . $row['nama'] . "</br>";
                    echo "<br>";
                    
                    echo 'Alamat : ' . $row['alamat'] . "</br>";
                    echo "<br>";
                    
                    echo 'Tanggal Lahir : ' . $row['tanggal_lahir'] . "</br>";
                    echo "<br>";
                    
                    echo 'Kode Divisi : ' . $row['kode_divisi'] . "</td>";
                }
            } else {
                echo "Data tidak ditemukan.";
            }
        } else {
            echo "Error: " . mysqli_error($con);
        }

    }
    ?>
</body>
</html>
