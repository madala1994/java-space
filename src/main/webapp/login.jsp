<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="aes.js"></script>
</head>
<body>
    <input type="hidden" id="key">
    <form>
        <input type="text" name="username" value="zhangsan" id="username">
        <input type="password" name="password" value="123" id="password">
        <a href="" onclick="login()" id="secret">登录</a>
    </form>
    <script type="text/javascript">
        $(function () {
            $.get("key.do",function (data) {
                $("#key").val(data);
            })
        })
        function login() {
            var user = $("#username").val();
            var pwd = $("#password").val();
            var nuser = encrypt(user);
            var npwd = encrypt(pwd);
            var time = new Date().getTime();
            var ntime = encrypt(time);
            $("#secret").attr("href","login.do?username="+ nuser +"&password=" + npwd + "&time=" + ntime);
            return true;
        }
        function encrypt(word){
            var k = $("#key").val();
            var key = CryptoJS.enc.Utf8.parse(k);
            var srcs = CryptoJS.enc.Utf8.parse(word);
            var encrypted = CryptoJS.AES.encrypt(srcs, key, {mode:CryptoJS.mode.ECB,padding: CryptoJS.pad.Pkcs7});
            return encrypted.toString();
        }

        function decrypt(word){
            var k = $("#key").val();
            var key = CryptoJS.enc.Utf8.parse(k);
            var key = CryptoJS.enc.Utf8.parse("abcdefgabcdefg12");
            var decrypt = CryptoJS.AES.decrypt(word, key, {mode:CryptoJS.mode.ECB,padding: CryptoJS.pad.Pkcs7});
            return CryptoJS.enc.Utf8.stringify(decrypt).toString();
        }
    </script>
</body>
</html>
