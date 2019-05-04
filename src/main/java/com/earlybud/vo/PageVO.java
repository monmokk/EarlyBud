package com.earlybud.vo;

public class PageVO {

	private int countPage;//한번 클릭할 때 나올 페이지 수
	private int totalPage;//전체 product 갯수
	private int first;//예를 들어 7부터
	private int last;//12까지

	{
		first = 1;
		countPage = 3;
	}
	public PageVO() {}
	public PageVO(int countPage, int totalPage, int first, int last) {
		super();
		this.countPage = countPage;
		this.totalPage = totalPage;
		this.first = first;
		this.last = last;
	}
	
	public void cal(int first, int totalPage) {
		this.totalPage = totalPage;
		if(first>=totalPage) {
			first = totalPage;
		}
		last = first+countPage;
		if(last>=totalPage) {
			last = totalPage;
		}
	}
	public int getCountPage() {
		return countPage;
	}
	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		last = first+totalPage;
	}
}

