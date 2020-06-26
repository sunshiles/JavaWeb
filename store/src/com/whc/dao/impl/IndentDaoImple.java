package com.whc.dao.impl;

import com.whc.conn.DBConn;
import com.whc.dao.IndentDao;
import com.whc.entity.Indent;
import com.whc.entity.IndentDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class IndentDaoImple implements IndentDao {
    private Connection con = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    @Override
    public boolean add(Indent indent) {
        con = DBConn.getConnection();
        try {
            con.setAutoCommit(false);
            String sql = "insert into order_info(userId,status,ordertime) values(?,?,?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, indent.getUserId());
            preparedStatement.setString(2, indent.getStatus());
            preparedStatement.setString(3, indent.getOrdertime());
            int row = preparedStatement.executeUpdate();
            //订单表修改成功，修改订单详细表
            if(row>0){
                //查询当前订单的订单号
                sql = "select id from order_info order by id desc limit 1";//mysql
//sqlserver		sql = "select top 1 id from order_info order by id desc";
                PreparedStatement ps1 = con.prepareStatement(sql);
                ResultSet rs = ps1.executeQuery();
                if(rs.next()){
                    indent.setId(rs.getInt("id"));
                }
                sql = "insert into order_detail(o_id,p_id,num) values(?,?,?)";
                PreparedStatement ps2 = con.prepareStatement(sql);
                ps2.setInt(1, indent.getId());
                for(IndentDetail od : indent.getDetailList()){
                    ps2.setInt(2, od.getPid());
                    ps2.setInt(3, od.getNum());
                    //向订单详细表添加一个商品的信息
                    row = ps2.executeUpdate();
                    //如果操作失败，事务回滚
                    if(row<=0){
                        //事务回滚
                        con.rollback();
                        break;
                    }
                }
            }
            //如果所有操作成功，事务提交
            if(row>0)con.commit();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return true;
    }

    @Override
    public ArrayList<Indent> getIndentByRealUserId(int realUserId) {
        con=DBConn.getConnection();
        //当前会员订单的集合
        ArrayList<Indent> orderList = new ArrayList();
        String sql = "select o.id,o.ordertime,o.status,o.userId,u.userName,u.address " +
                "from order_info o,user_info u " +
                "where o.userId = u.id and o.userId="+realUserId+" order by o.id desc";
        try {
            preparedStatement = con.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){//一条记录代表一个订单
                Indent indent = new Indent();
                indent.setId(rs.getInt("id"));
                indent.setOrdertime(rs.getString("ordertime"));
                indent.setUserName(rs.getString("userName"));
                indent.setAddress(rs.getString("address"));
                indent.setStatus(rs.getString("status"));
                indent.setUserId(rs.getInt("userId"));
                sql = "select od.o_id,od.p_id,od.num,p.name as pname,p.price,p.sale,p.pic " +
                        "from order_detail od,product_info p " +
                        "where p.id=od.p_id and o_id="+indent.getId();
                PreparedStatement ps1 = con.prepareStatement(sql);
                ResultSet rs1 = ps1.executeQuery();
                while(rs1.next()){//一条记录代表订单里的一个商品
                    IndentDetail od = new IndentDetail();
                    od.setPid(rs1.getInt("p_id"));
                    od.setPrice(rs1.getDouble("price"));
                    od.setSale(rs1.getDouble("sale"));
                    od.setPic(rs1.getString("pic"));
                    od.setpName(rs1.getString("pname"));
                    od.setNum(rs1.getInt("num"));
                    //把商品信息添加到订单详细
                    indent.getDetailList().add(od);
                }
                //把订单添加到订单集合
                orderList.add(indent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;

    }
}
