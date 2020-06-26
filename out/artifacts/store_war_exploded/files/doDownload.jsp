<%@ page import="com.jspsmart.upload.SmartUpload" %>
<%@ page import="com.jspsmart.upload.SmartUploadException" %><%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/5/26
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
// 新建一个SmartUpload对象
SmartUpload su = new SmartUpload();
// 初始化
su.initialize(pageContext);
    su.setContentDisposition(null);
// 设定contentDisposition为null以禁止浏览器自动打开文件，
//保证点击链接后是下载文件。若不设定，则下载的文件扩展名为
//doc时，浏览器将自动用word打开它。扩展名为pdf时，
//浏览器将用acrobat打开。
su.setContentDisposition(null);
// 下载文件
    try {
        su.downloadFile("/upload/IMG_05121590832382138.PNG");
    } catch (SmartUploadException e) {
        e.printStackTrace();
    }
%>

</body>
</html>
