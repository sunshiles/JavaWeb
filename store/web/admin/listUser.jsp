<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.whc.entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/4/27
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() +
            "://" + request.getServerName() +
            ":" + request.getServerPort() + path + "/admin/";
%>
<head>
    <base href="<%=basePath %>">
    <title></title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>
<%
    String username="";
    if (request.getAttribute("username")!=null) {
        username = (String) request.getAttribute("username");
    }
%>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href=""
                                                                               style="float:right; display:none;">添加字段</a>
        </div>
    </div>
<form method="post" action="../UserServlet?operate=queryByPage" id="listform">
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li><a class="button border-main icon-plus-square-o" href="addUser.jsp"> 添加内容</a></li>
                <li>搜索：</li>

                <if condition="$iscid eq 1">
                    <li>
                        <select name="cid" class="input" style="width:200px; line-height:17px;"
                                onchange="changesearch()">
                            <option value="">请选择分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                        </select>
                    </li>
                </if>
                <li>
                    <input type="text" placeholder="请输入搜索关键字" name="username" id="search" value="<%=username%>"
                           class="input" style="width:250px; line-height:17px;display:inline-block"/>
                    <button class="button border-main icon-search"> 搜索</button>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th width="100" style="text-align:left; padding-left:20px;">ID</th>
                <th width="10%">用户名</th>
                <th>密码</th>
                <th width="10%">更新时间</th>
                <th width="310">操作</th>
            </tr>
            <volist name="list" id="vo">
                    <%
                    int pageCount = (int) request.getAttribute("pageCount");
                    int currentPage = (int) request.getAttribute("currentPage");
                    ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
                    if (users != null) {
                         for (User user : users) {
%>
                <tr>
                    <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value=""/>
                        <%=user.getId()%>
                        <%--                        <input type="hidden" name="id" value="<%=user.getId()%>">--%>
                        <%--                        <input type="hidden" name="name" value="<%=user.getUserName()%>">--%>
                    </td>
                    <td><font><%=user.getUserName()%>

                    </font></td>
                    <td><%=user.getPassword()%>
                    </td>
                    <td>2016-07-01</td>
                    <td>
                        <div class="button-group">
                            <a class="button border-main"
                               href="../UserServlet?operate=queryById&id=<%=user.getId()%>"><span
                                    class="icon-edit"></span> 修改</a>
                            <a class="button border-red" href="javascript:void(0)"
                               onclick="return del(<%=user.getId()%>)"><span
                                    class="icon-trash-o"></span> 删除</a>
                        </div>
                    </td>
                </tr>
                    <%
            }
    }
%>
                <tr>
                    <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox"
                                                                                          id="checkall"/>
                        全选
                    </td>
                    <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)"
                                                                                  class="button border-red icon-trash-o"
                                                                                  style="padding:5px 15px;"
                                                                                  onclick="DelSelect()"> 删除</a> <a
                            href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;"
                            class="button border-blue icon-edit" onclick="sorts()"> 排序</a> 操作：
                        <select name="ishome" style="padding:5px 15px; border:1px solid #ddd;"
                                onchange="changeishome(this)">
                            <option value="">首页</option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                        <select name="isvouch" style="padding:5px 15px; border:1px solid #ddd;"
                                onchange="changeisvouch(this)">
                            <option value="">推荐</option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                        <select name="istop" style="padding:5px 15px; border:1px solid #ddd;"
                                onchange="changeistop(this)">
                            <option value="">置顶</option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                        &nbsp;&nbsp;&nbsp;

                        移动到：
                        <select name="movecid" style="padding:5px 15px; border:1px solid #ddd;"
                                onchange="changecate(this)">
                            <option value="">请选择分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                        </select>
                        <select name="copynum" style="padding:5px 15px; border:1px solid #ddd;"
                                onchange="changecopy(this)">
                            <option value="">请选择复制</option>
                            <option value="5">复制5条</option>
                            <option value="10">复制10条</option>
                            <option value="15">复制15条</option>
                            <option value="20">复制20条</option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="8">
                        <div class="pagelist">
                            <%
                                if (currentPage > 1) {
                            %>
                            <a href="../UserServlet?operate=queryByPage&currentPage=<%=currentPage-1%>&username=<%=username%>">上一页</a>
                            <%
                                }
                            %>
                            <%
                                for (int i = 1; i <= pageCount; i++) {
                            %>
                            <a href="../UserServlet?operate=queryByPage&currentPage=<%=i%>&username=<%=username%>"><%=i%>
                            </a>
                            <%
                                }
                                if (currentPage < pageCount) {
                            %>
                            <a href="../UserServlet?operate=queryByPage&currentPage=<%=currentPage+1%>&username=<%=username%>">下一页</a>
                            <%
                                }
                            %>
                            <a href="../UserServlet?operate=queryByPage&currentPage=<%=pageCount%>&username=<%=username%>">尾页</a></div>
                    </td>
                </tr>
        </table>
</form>
<script type="text/javascript">

    // //搜索
    // function changesearch() {
    //     var newUrl = "../UserServlet?operate=query";
    //     $("#listform").attr('action', newUrl);    //通过jquery为action属性赋值
    //     $("#listform").submit();    //提交ID为myform的表单
    // }

    //单个删除
    function del(idValues) {
        if (confirm("您确定要删除吗?")) {
            var newUrl = "../UserServlet?operate=del&id=" + idValues;
            $("#listform").attr('action', newUrl);    //通过jquery为action属性赋值
            $("#listform").submit();    //提交ID为myform的表单
        }
    }

    //全选
    $("#checkall").click(function () {
        $("input[name='id[]']").each(function () {
            if (this.checked) {
                this.checked = false;
            } else {
                this.checked = true;
            }
        });
    })

    //批量删除
    function DelSelect() {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var t = confirm("您确认要删除选中的内容吗？");
            if (t == false) return false;
            $("#listform").submit();
        } else {
            alert("请选择您要删除的内容!");
            return false;
        }
    }

    //批量排序
    function sorts() {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            $("#listform").submit();
        } else {
            alert("请选择要操作的内容!");
            return false;
        }
    }


    //批量首页显示
    function changeishome(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        } else {
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量推荐
    function changeisvouch(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {


            $("#listform").submit();
        } else {
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量置顶
    function changeistop(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        } else {
            alert("请选择要操作的内容!");

            return false;
        }
    }


    //批量移动
    function changecate(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        } else {
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量复制
    function changecopy(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var i = 0;
            $("input[name='id[]']").each(function () {
                if (this.checked == true) {
                    i++;
                }
            });
            if (i > 1) {
                alert("只能选择一条信息!");
                $(o).find("option:first").prop("selected", "selected");
            } else {

                $("#listform").submit();
            }
        } else {
            alert("请选择要复制的内容!");
            $(o).find("option:first").prop("selected", "selected");
            return false;
        }
    }

</script>
</body>

</html>
