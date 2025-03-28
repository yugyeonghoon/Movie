package board;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class BoardDAO extends DBManager{
	//글 작성
	public int write(BoardVO vo) {
		String author = vo.getAuthor();
		String title = vo.getTitle();
		String content = vo.getContent();
		int boardType = vo.getBoardType();
		
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "insert into board(author, title, content, board_type)";
		sql += " values('"+author+"', '"+title+"', '"+content+"', "+boardType+")";	
		executeUpdate(sql);

		if(next()) {
			int no = getInt("no");
			DBDisConnect();
			return no;
		}else {
			DBDisConnect();
			return 0;
		}
	}
	
	//글 조회(여러건)
	public List<BoardVO> listView(String bno){
		driverLoad();
		DBConnect();
		
		String sql = "select * from board where board_type = 0 or board_type = + "+bno+" order by board_type ASC";
		executeQuery(sql);
		
		List<BoardVO> list = new ArrayList<>();
		while(next()) {
			int no = getInt("no");
			String title = getString("title");
			String author = getString("author");
			String createDate = getString("create_date");
			int boardType = getInt("board_type");
			
			BoardVO vo = new BoardVO();
			vo.setNo(no);
			vo.setTitle(title);
			vo.setAuthor(author);
			vo.setCreateDate(createDate);
			vo.setBoardType(boardType);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
	//글 조회(단건)
	public BoardVO view(String bno) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select * from board where board_type != 99 ";
		sql += "and no = " + bno;
		executeQuery(sql);
		
		if(next()) {
			int no = getInt("no");
			String title = getString("title");
			String content = getString("content");
			String author = getString("author");
			String createDate = getString("create_date");
			String updateDate = getString("update_date");
			
			BoardVO vo = new BoardVO();
			vo.setNo(no);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setAuthor(author);
			vo.setCreateDate(createDate);
			vo.setUpdateDate(updateDate);

			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}
	}
}