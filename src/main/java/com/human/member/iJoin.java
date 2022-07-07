package com.human.member;

import java.util.ArrayList;

public interface iJoin {
	ArrayList<logininfo> listMember();
	void insert(String id,String pwd,String name,String mobile);
	int count(String id, String pwd);
	void add(String title, String content, String writer);
	ArrayList<boardDTO> postlist();
	void delete(int seqbb);
	void update(String title, String content, int seqbb);
	boardDTO selectpost(int seqbb);
	boardDTO selectview(int seqbb);
}
