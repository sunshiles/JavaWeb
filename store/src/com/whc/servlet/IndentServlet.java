package com.whc.servlet;

import com.whc.dao.IndentDao;
import com.whc.dao.impl.IndentDaoImple;
import com.whc.entity.Cart;
import com.whc.entity.Indent;
import com.whc.entity.IndentDetail;
import com.whc.entity.RealUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/buy/IndentServlet")
public class IndentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String operate = request.getParameter("operate");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        IndentDao indentDao = new IndentDaoImple();
        if ("add".equals(operate)) {
            RealUser realUser = (RealUser) session.getAttribute("realUser");
            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("carts");
            Indent indent = new Indent();
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            indent.setOrdertime(sdf.format(date));
            String status= String.valueOf(realUser.getStatus());
            indent.setStatus(status);
            indent.setUserId(realUser.getId());

            double sum = 0.0;
            ArrayList<IndentDetail> goodlist = indent.getDetailList();
            for (Cart c : cartList) {
                IndentDetail od = new IndentDetail();
                od.setPid(c.getId());
                od.setNum(c.getNumber());
                goodlist.add(od);
                //order.getDetailList().add(od);
                sum += c.getPrice() * c.getNumber();
            }
            //把订单信息写入数据库
            boolean t = indentDao.add(indent);
			/*if(orderdao.add(order)){
				//订单提交成功，修改会员的积分
					udi.updateScore(huiyuan.getId(), (int)(sum/100));
			}else{
				result = false;
				out.print("<h1>       ʧ ܣ </h1>");
			}*/
            if (t) {
                //移除购物车
                session.removeAttribute("carts");
                System.out.println("aaa" + realUser.getId());
                response.sendRedirect("IndentServlet?operate=queryByRealUserId&realUserId=" + realUser.getId());
            }

        }
        if ("queryByRealUserId".equals(operate)) {
            int realUserId = 0;
            String tempRealUserId = request.getParameter("realUserId");
            if (tempRealUserId != null && !tempRealUserId.isEmpty()) {
                realUserId = Integer.parseInt(tempRealUserId);
            }
            ArrayList<Indent> indents = indentDao.getIndentByRealUserId(realUserId);
            request.setAttribute("indents",indents);
            request.getRequestDispatcher("IndentList.jsp").forward(request,response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
