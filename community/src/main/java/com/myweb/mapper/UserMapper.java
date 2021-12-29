package com.myweb.mapper;
import com.myweb.command.UserVO;

public interface UserMapper {

	public UserVO login(UserVO vo);
	public UserVO findId(UserVO vo);
	
	// 비번변경 메서드 추가될 예정
	public UserVO findPw(UserVO vo);
	
	public int idCheck(UserVO vo);
	public boolean signUp(UserVO vo);
}
