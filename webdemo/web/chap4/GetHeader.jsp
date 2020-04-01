<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<html>
<BODY >
<BR>客户使用的协议是:
   <% String protocol=request.getProtocol();
      out.println(protocol);
   %>
<BR>获取接受客户提交信息的页面：
   <% String path=request.getServletPath();
      out.println(path);
   %>
<BR>接受客户提交信息的长度：
   <% int length=request.getContentLength();
      out.println(length);
   %>
<BR>客户提交信息的方式：
   <% String method=request.getMethod();
      out.println(method);
   %>
<BR>获取HTTP头文件中User-Agent的值：：
   <% String header1=request.getHeader("User-Agent");
      out.println(header1);
   %>
<BR>获取HTTP头文件中accept的值：
   <% String header2=request.getHeader("accept");
      out.println(header2);
   %>
<BR>获取HTTP头文件中Host的值：
   <% String header3=request.getHeader("Host");
      out.println(header3);
   %>
<BR>获取HTTP头文件中accept-encoding的值：
   <% String header4=request.getHeader("accept-encoding");
      out.println(header4);
   %>
<BR>获取客户的IP地址：
   <% String  IP=request.getRemoteAddr();
      out.println(IP);
   %>
<BR>获取客户机的名称：
   <% String clientName=request.getRemoteHost();
      out.println(clientName);
   %> 
<BR>获取服务器的名称：
   <% String serverName=request.getServerName();
      out.println(serverName);
   %> 
<BR>获取服务器的端口号：
   <% int serverPort=request.getServerPort();
      out.println(serverPort);
   %> 

<a href="../index.jsp">返回主页</a>
</BODY>
</HTML>
