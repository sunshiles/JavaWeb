<%@ page import="com.whc.entity.Product" %><%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/5/23
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() +
            "://" + request.getServerName() +
            ":" + request.getServerPort() + path + "/admin/";
%>
<html>
<head>
    <title></title>
    <base href="<%=basePath %>">
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    Product product = (Product)request.getAttribute("product");
%>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>��������</strong></div>
    <div class="body-content">
        <form  enctype="multipart/form-data" method="post" class="form-x" action="../ProductServlet?operate=update&id=<%=product.getId()%>">
            <div class="form-group">
                <div class="label">
                    <label>��Ʒ���ƣ�</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getProductName()%>" name="productName" data-validate="required:��������Ʒ����" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>��Ʒ��ţ�</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getCode()%>" name="code" data-validate="required:��������Ʒ���" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>��Ʒ������</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getNumber()%>" name="number" data-validate="required:��������Ʒ����" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>��Ʒ���ۣ�</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getPrice()%>" name="price" data-validate="required:��������Ʒ����" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>�������ۣ�</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getSale()%>" name="sale" data-validate="required:�������������" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>��Ʒ״̬��</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getStatus()%>" name="status" data-validate="required:��������Ʒ״̬" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="forme-group">
                <div class="label">
                    <label>ͼƬ��</label>
                </div>
                <div class="field">
                    <input type="file"  name="img" value="<%=product.getPicture()%>" class="input tips " style="width:25%; float:left;" />
                    <%--                    <input type="button" class="button bg-blue margin-left" id="image1" value="+ ����ϴ�"  style="float:left;">--%>
                    <%--                    <div class="tipss">ͼƬ�ߴ磺500*500</div>--%>
                </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>

            <div class="form-group">
                <div class="label">
                    <label>��Ʒ���ͣ�</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=product.getType()%>" name="type" data-validate="required:��������Ʒ״̬" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>��ƷƷ�ƣ�</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="brand" data-validate="required:��������Ʒ״̬" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>��Ʒ���ܣ�</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="intro" data-validate="required:��������Ʒ״̬" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="clear"></div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> �ύ</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
