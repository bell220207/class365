package com.myweb.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.myweb.command.UserVO;
import com.myweb.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserVO login(UserVO vo) {
		return userMapper.login(vo);
	}

	@Override
	public UserVO findId(UserVO vo) {
		return userMapper.findId(vo);
	}
	
	@Override
	public UserVO findPw(UserVO vo) {
		return userMapper.findPw(vo);
	}


	@Override
	public boolean signUp(UserVO vo) {
		// 암호화 작업
//		Encoder encoder = Base64.getEncoder();
		// 암호화 시키고 싶은 데이터를 byte[]형태로 암호화 데이터를 전달
//		byte [] result = encoder.encode( vo.getPw().getBytes() );
		// 문자열로 바꿔서 저장
//		vo.setPw(new String(result) );
		
		return userMapper.signUp(vo);
	}

	@Override
	public int idCheck(UserVO vo) {
		return userMapper.idCheck(vo);
	}
}
