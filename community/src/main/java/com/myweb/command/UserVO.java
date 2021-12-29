package com.myweb.command;
import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
	
	private String id;
	private String pw;
	private String com;
	private String phone;

}
