package com.whc.factory;

import com.whc.dao.*;
import com.whc.dao.impl.*;

public class DaoFactory {
    public static UserDao getUserDao() {
        return new UserDaoImpl();
    }

    public static ProductDao getProductDao() {
        return new ProductDaoImpl();
    }

    public static RealUserDao getRealUserDao() {
        return new RealUserDaoImpl();
    }

    public static OrderDao getOrderDao() {
        return new OrderDaoImpl();
    }

    public static CartDao getCartDao() {
        return new CartDaoImpl();
    }
}
