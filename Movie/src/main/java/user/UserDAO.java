package user;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class UserDAO extends DBManager{
	//회원가입
	public void join (UserVO vo) {
		String id = vo.getId();
		String pw = vo.getPw();
		String email = vo.getEmail();
		String nick = vo.getNick();
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "insert into user(id, password, email, nickname)";
		sql += " value ('"+id+"', '"+pw+"', '"+email+"', '"+nick+"')";
		executeUpdate(sql);
		
		DBDisConnect();
	}
	//로그인
	public UserVO login(UserVO vo) {
		String id = vo.getId();
		String pw = vo.getPw();
		
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select * from user where id = '"+id+"' and password = '"+pw+"' and user_type not in(98, 99)";
		executeQuery(sql);
		
		if(next()) {
			String uid = getString("id");
			String nick = getString("nick");
			int userType = getInt("user_type");
			String email = getString("email");
			
			UserVO uvo = new UserVO();
			uvo.setId(uid);
			uvo.setNick(nick);
			uvo.setEmail(email);
			uvo.setUserType(userType);
			
			DBDisConnect();
			return uvo;
		}else {
			DBDisConnect();
			return null;
		}
	}
	//회원정보수정
	public void update(UserVO vo) {
		String id = vo.getId();
		String pw = vo.getPw();
		String email = vo.getEmail();
		String nick = vo.getNick();
		
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "update user set password = '"+pw+"', nickname = '"+nick+"',";
		sql += " update_date = now() where id = '"+id+"'";
		executeUpdate(sql);
		DBDisConnect();
	}
	//회원 타입변경
	public void changeType(UserVO vo) {
		String id = vo.getId();
		int userType = vo.getUserType();
		
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "update user set delete_date = now(), user_type = "+userType+"";
		sql += " where id = '"+id+"'";
		
		executeUpdate(sql);
		DBDisConnect();
	}
	//회원탈퇴
	public void delete(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "update user set delete_date = now(), user_type = 99 where id = '"+id+"'";
		executeUpdate(sql);
		DBDisConnect();
		
	}
	//아이디중복검사
	public int idCheck(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select count(*) as cnt from user where id = '"+id+"'";
		executeQuery(sql);
		if(next()) {
			int cnt = getInt("cnt");
			DBDisConnect();
			return cnt;
		}else {
			DBDisConnect();
			return 0;
		}
	}
	//닉네임 중복검사
	public int nickCheck(String nick) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select count(*) as cnt from user where nickname = '"+nick+"'";
		executeQuery(sql);
		if(next()) {
			int cnt = getInt("cnt");
			DBDisConnect();
			return cnt;
		}else {
			DBDisConnect();
			return 0;
		}
	}
	//회원목록조회
	public List<UserVO> getAllUser(){
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select * from user where user_type != 0";
		executeQuery(sql);
		List<UserVO> list = new ArrayList<>();
		while(next()) {
			String id = getString("id");
			String nick = getString("nick");
			String email = getString("email");
			int userType = getInt("user_type");
			
			UserVO vo = new UserVO();
			vo.setId(id);
			vo.setNick(nick);
			vo.setEmail(email);
			vo.setUserType(userType);
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	//아이디 찾기
	public List<String> findId(String email) {
		
		driverLoad();
		DBConnect();
		
		String sql = "select id from user where email = '"+email+"'";
		executeQuery(sql);
		List<String> list = new ArrayList<>();
		while(next()) {
			String id = getString("id");
			list.add(id);
		}
		DBDisConnect();
		return list;
	}
	//비밀번호변경
	public void changePw(UserVO vo) {
		String id = vo.getId();
		String pw = vo.getPw();
		
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "update user set password = '"+pw+"', update_date = now() where id = '"+id+"'";
		executeUpdate(sql);
		DBDisConnect();
	}
	//회원조회 한명
	public UserVO getOneUser(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select * from user where id = '"+id+"'";
		executeQuery(sql);
		
		if(next()) {
			String uid = getString("id");
			String nick = getString("nick");
			String email = getString("email");
			int userType = getInt("user_type");
			
			UserVO vo = new UserVO();
			vo.setId(uid);
			vo.setNick(nick);
			vo.setEmail(email);
			vo.setUserType(userType);
			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}
	}
	//비밀번호 찾기
	public int idemail(String id, String email) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select count(*) as cnt from user where id = '"+id+"' and email = '"+email+"'";
		executeQuery(sql);
		
		System.out.println(sql);
		
		if(next()) {
			int cnt = getInt("cnt");
			DBDisConnect();
			return cnt;
		}else {
			DBDisConnect();
			return 0;
		}
	}
	
}
