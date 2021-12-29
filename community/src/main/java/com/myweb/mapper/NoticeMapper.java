package com.myweb.mapper;
import java.util.ArrayList;
import com.myweb.command.NoticeVO;
import com.myweb.util.Criteria;

public interface NoticeMapper {
	public boolean regist(NoticeVO vo);  // 등록하기

	public ArrayList<NoticeVO> getList(Criteria cri); // 목록보기
	public int getTotal(Criteria cri); 

	public NoticeVO getContent(int bno); // 상세보기
	public boolean Update(NoticeVO vo);  // 수정하기
	public void noticeDelete(int bno);   // 삭제하기
}
