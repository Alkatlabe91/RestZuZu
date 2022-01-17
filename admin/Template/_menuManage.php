<?php
    include '_dbconnect.php';

if($_SERVER["REQUEST_METHOD"] == "POST") {

    if(isset($_POST['createItem'])) {
        $name = $_POST["name"];
        $description = $_POST["description"];
        $categoryId = $_POST["categoryId"];
        $price = $_POST["price"];

        $sql = "INSERT INTO `sushi` (`sushiName`, `sushiPrice`, `sushiDesc`, `sushiCategorieId`, `sushiPubDate`) VALUES ('$name', '$price', '$description', '$categoryId', current_timestamp())";   
        $result = mysqli_query($conn, $sql);
        $sushiId = $conn->insert_id;
        if ($result){
            $check = getimagesize($_FILES["image"]["tmp_name"]);
            if($check !== false) {
                
                $newName = 'sushi-'.$sushiId;
                $newfilename=$newName .".jpg";

                $uploaddir = $_SERVER['DOCUMENT_ROOT'].'/rest/img/';
                $uploadfile = $uploaddir . $newfilename;

                if (move_uploaded_file($_FILES['image']['tmp_name'], $uploadfile)) {
                    echo "<script>alert('success');
                            window.location=document.referrer;
                        </script>";
                } else {
                    echo "<script>alert('failed');
                            window.location=document.referrer;
                        </script>";
                }

            }
            else{
                echo '<script>alert("Please select an image file to upload.");
                        window.location=document.referrer;
                    </script>';
            }
        }
        else {
            echo "<script>alert('failed');
                    window.location=document.referrer;
                </script>";
        }
    }
    if(isset($_POST['removeItem'])) {
        $sushiId = $_POST["sushiId"];
        $sql = "DELETE FROM `sushi` WHERE `sushiId`='$sushiId'";   
        $result = mysqli_query($conn, $sql);
        $filename = $_SERVER['DOCUMENT_ROOT']."/rest/img/sushi-".$sushiId.".jpg";
        if ($result){
            if (file_exists($filename)) {
                unlink($filename);
            }
            echo "<script>alert('Removed');
                window.location=document.referrer;
            </script>";
        }
        else {
            echo "<script>alert('failed');
            window.location=document.referrer;
            </script>";
        }
    }
    if(isset($_POST['updateItem'])) {
        $sushiId = $_POST["sushiId"];
        $sushiName = $_POST["name"];
        $sushiDesc = $_POST["desc"];
        $sushiPrice = $_POST["price"];
        $sushiCategorieId = $_POST["catId"];

        $sql = "UPDATE `sushi` SET `sushiName`='$sushiName', `sushiPrice`='$sushiPrice', `sushiDesc`='$sushiDesc', `sushiCategorieId`='$sushiCategorieId' WHERE `sushiId`='$sushiId'";   
        $result = mysqli_query($conn, $sql);
        if ($result){
            echo "<script>alert('update');
                window.location=document.referrer;
                </script>";
        }
        else {
            echo "<script>alert('failed');
                window.location=document.referrer;
                </script>";
        }
    }
    if(isset($_POST['updateItemPhoto'])) {
        $sushiId = $_POST["sushiId"];
        $check = getimagesize($_FILES["itemimage"]["tmp_name"]);
        if($check !== false) {
            $newName = 'sushi-'.$sushiId;
            $newfilename=$newName .".jpg";

            $uploaddir = $_SERVER['DOCUMENT_ROOT'].'/rest/img/';
            $uploadfile = $uploaddir . $newfilename;

            if (move_uploaded_file($_FILES['itemimage']['tmp_name'], $uploadfile)) {
                echo "<script>alert('success');
                        window.location=document.referrer;
                    </script>";
            } else {
                echo "<script>alert('failed');
                        window.location=document.referrer;
                    </script>";
            }
        }
        else{
            echo '<script>alert("Please select an image file to upload.");
            window.location=document.referrer;
                </script>';
        }
    }
}
?>