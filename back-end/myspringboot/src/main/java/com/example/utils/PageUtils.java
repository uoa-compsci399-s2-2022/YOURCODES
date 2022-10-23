package com.example.utils;


import com.baomidou.mybatisplus.core.metadata.IPage;

import java.io.Serializable;
import java.util.List;


public class PageUtils implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * The total number of records
     */
    private int totalCount;
    /**
     * Records per page
     */
    private int pageSize;
    /**
     * number of total pages
     */
    private int totalPage;
    /**
     * The current number of pages
     */
    private int currPage;
    /**
     * table data
     */
    private List<?> list;

    /**
     * @param list        table data
     * @param totalCount  The total number of records
     * @param pageSize    Records per page
     * @param currPage    current
     */
    public PageUtils(List<?> list, int totalCount, int pageSize, int currPage) {
        this.list = list;
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.currPage = currPage;
        this.totalPage = (int)Math.ceil((double)totalCount/pageSize);
    }

    /**
     * paging
     */
    public PageUtils(IPage<?> page) {
        this.list = page.getRecords();
        this.totalCount = (int)page.getTotal();
        this.pageSize = (int)page.getSize();
        this.currPage = (int)page.getCurrent();
        this.totalPage = (int)page.getPages();
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    public List<?> getList() {
        return list;
    }

    public void setList(List<?> list) {
        this.list = list;
    }

}

