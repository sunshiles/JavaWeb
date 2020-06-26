<%@ page import="com.jspsmart.upload.SmartUpload" %>
<%@ page import="com.jspsmart.upload.File" %>
<%@ page import="com.jspsmart.upload.Files" %>
<%@ page import="com.jspsmart.upload.SmartUploadException" %><%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/5/26
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    SmartUpload su = new SmartUpload();
    su.initialize(pageContext);
    su.setAllowedFilesList("png,JPG,jpg,PNG");
    su.upload();
    Files files = su.getFiles();
    if (files.getCount() > 0) {
        for (int i = 0; i < files.getCount(); i++) {
            File file = files.getFile(i);
            String ext = file.getFileExt();
            String name = file.getFileName().substring(0,file.getFileName().indexOf(ext)-1);
            if (!file.isMissing()) {
                try {
                    file.saveAs("/upload1/"+name+System.currentTimeMillis()+"."+ext, File.SAVEAS_VIRTUAL);
                    System.out.println(file.getFileName());
                } catch (SmartUploadException e) {
                    e.printStackTrace();
                }
            }
        }
    }
%>
</body>
</html>
