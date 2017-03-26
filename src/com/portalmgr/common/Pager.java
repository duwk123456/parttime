package com.portalmgr.common;


public class Pager {
	private int isPage=1; //是否分页
    private int page=1;
    private int pageSize=10;
    private int beginRow=0;
    public int getPage() {
        return page;
    }
 
	public int getIsPage() {
		return isPage;
	}


	public void setIsPage(int isPage) {
		this.isPage = isPage;
	}




	public void setPage(int page) {
            this.page = page;
            this.beginRow=this.pageSize*(page-1);
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
        this.beginRow=pageSize*(this.page-1);
    }

    public int getBeginRow() {
        return beginRow;
    }

    public void setBeginRow(int beginRow) {
        this.beginRow = beginRow;
    }
}
