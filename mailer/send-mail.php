<?php

    require("mailer/src/PHPMailer.php");
    require("mailer/src/SMTP.php");
    require("mailer/src/Exception.php");


    function sendEmail($recipientEmail, $title, $content)
    {
        $mail = new PHPMailer\PHPMailer\PHPMailer();
        $mail->IsSMTP();
        $mail->CharSet = 'UTF-8';
        $mail->SMTPDebug = 0;
        $mail->SMTPAuth = true;
        $mail->SMTPSecure = 'ssl';
        $mail->Host = 'smtp.gmail.com';
        $mail->Port = 465;
        $mail->IsHTML(true);
        $mail->Username = 'thaoyenmobile@gmail.com';
        $mail->Password = 'fkndszzngpjvnyvc';
        // $mail->SetFrom('Admin');
        // Thay đổi tên người gửi và địa chỉ email người gửi
        $mail->SetFrom('chamsockhachhang.contact@gmail.com', 'Cửa hàng Thao Yến Mobile');
        $mail->Subject = $title;
        $mail->Body = $content;
        $mail->AddAddress($recipientEmail);

        if (!$mail->Send()) {
            return "Mailer Error: " . $mail->ErrorInfo;
        } else {
            return "Gửi thành công";
        }
    }


    ?>