<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/17
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    public class qiuyuan{
        public double zhouchang(int a){
            double s = Math.PI;
            return 2*s*a;
        }

        public double mianji(int b) {
            double s = Math.PI;
            return s*b*b;
        }
    }
%>
<form name="tijiao" onsubmit="return check()">
    输入值：<input type="text" name="number">
    <input type="submit" value="提交">
</form>
<%
    qiuyuan q= new qiuyuan();
%>
<%
    double x = 0;
    double z= 0;
    String   t = request.getParameter("number");
    int y = 0;
    if (t!=null && !"".equals(t)){
        y = Integer.parseInt(t);
    }
    x = q.zhouchang(y);
    z = q.mianji(y);
%>
<%=y%>的周长为：<%=x%><br>
<%=y%>的面积为：<%=z%><br>
<a href="../index.jsp">返回首页</a>
</body>
</html>
