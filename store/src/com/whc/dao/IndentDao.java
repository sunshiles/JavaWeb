package com.whc.dao;

import com.whc.entity.Indent;

import java.util.ArrayList;

public interface IndentDao {
    boolean add(Indent indent);

    ArrayList<Indent> getIndentByRealUserId(int realUserId);
}
