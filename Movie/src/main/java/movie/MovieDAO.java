package movie;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class MovieDAO extends DBManager {
	//영화 한 건 조회
	//select * from movie where no = ?;
	public MovieVO view(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from movie where no = " + id;
		executeQuery(sql);
		
		if(next()) {
			String movieid = getString("id");
			String releaseDate = getString("releaseDate");
			String nation = getString("nation");
			String genre = getString("genre");
			String mtitle = getString("mtitle");
			String director = getString("director");
			String actor = getString("actor");
			String mcontent = getString("mcontent");
			int rating = getInt("rating");
			
			MovieVO vo = new MovieVO();
			vo.setId(movieid);
			vo.setReleaseDate(releaseDate);
			vo.setNation(nation);
			vo.setGenre(genre);
			vo.setMtitle(mtitle);
			vo.setDirector(director);
			vo.setActor(actor);
			vo.setMcontent(mcontent);
			vo.setRating(rating);
			
			DBDisConnect();
			return vo;
			
		}else {
			DBDisConnect();
			return null;
		}
	}
	
	//영화 여러 건 조회
	//select * from movie where moviekeyword = ?;
	public List<MovieVO> listView(String mkeyword) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from movie";
		if(mkeyword != null) {
			sql += " and '%"+mkeyword+"%'";
		}
		executeQuery(sql);
		
		List<MovieVO> list = new ArrayList<>();
		while(next()) {
			String mid = getString("id");
			String mtitle = getString("mtitle");
			
			MovieVO vo = new MovieVO();
			vo.setId(mid);
			vo.setMtitle(mtitle);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
}
