package com.myweb.service;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.myweb.command.NoticeVO;
import com.myweb.mapper.NoticeMapper;
import com.myweb.util.Criteria;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeMapper noticeMapper;

	@Override // 등록하기
	public boolean regist(NoticeVO vo) { return noticeMapper.regist(vo); }


	@Override // 목록보기
	public ArrayList<NoticeVO> getList(Criteria cri) { 
		return noticeMapper.getList(cri); 
	}

	@Override
	public int getTotal(Criteria cri) { return noticeMapper.getTotal(cri); }

	@Override // 상세보기
	public NoticeVO getContent(int bno) { return noticeMapper.getContent(bno); }

	@Override // 수정하기
	public boolean Update(NoticeVO vo) { return noticeMapper.Update(vo); }

	@Override // 삭제하기
	public void noticeDelete(int bno) { noticeMapper.noticeDelete(bno); }

}