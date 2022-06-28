package com.study.member.vo;

import com.study.common.vo.PagingVO;

public class MemberSearchVO extends PagingVO{
	
	private String searchType;
	private String searchWord;
	private String searchHobby;
	private String searchJob;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchHobby() {
		return searchHobby;
	}
	public void setSearchHobby(String searchHobby) {
		this.searchHobby = searchHobby;
	}
	public String getSearchJob() {
		return searchJob;
	}
	public void setSearchJob(String searchJob) {
		this.searchJob = searchJob;
	}
	
}
