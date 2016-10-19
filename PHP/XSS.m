//
//  XSS.m
//  Note
//
//  Created by Loulou on 16/8/3.
//
//

#import <Foundation/Foundation.h>

在用户提交该表单时，我们还要做两件事：
（通过 PHP trim() 函数）去除用户输入数据中不必要的字符（多余的空格、制表符、换行）
（通过 PHP stripslashes() 函数）删除用户输入数据中的反斜杠（\）
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
/test_form.php/%22%3E%3Cscript%3Ealert('hacked')%3C/script%3E

<?php
// 定义变量并设置为空值
$name = $email = $gender = $comment = $website = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = test_input($_POST["name"]);
    $email = test_input($_POST["email"]);
    $website = test_input($_POST["website"]);
    $comment = test_input($_POST["comment"]);
    $gender = test_input($_POST["gender"]);
}

function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
?>