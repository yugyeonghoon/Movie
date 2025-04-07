package movie;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class MovieDAO extends DBManager {
	//영화 한 건 조회
	//select * from movie where id = ?;
	public MovieVO view(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from movie_db where docid ='"+id+"'";
		executeQuery(sql);
		
		if(next()) {
			String docid = getString("docid");
			String title = getString("title");
			String director = getString("directors");
			String actor = getString("actors");
			String nation = getString("nation");
			String genre = getString("genre");
			String plots = getString("plots");
			String repRlsDate = getString("repRlsDate");
			String poster = getString("poster");
			int runtime = getInt("runtime");
			String ratingGrade = getString("rating_grade");
			int rating = getInt("rating");
			int ratingPeople = getInt("rating_people");
			
			MovieVO vo = new MovieVO();
			vo.setDocid(docid);
			vo.setRepRlsDate(repRlsDate);
			vo.setNation(nation);
			vo.setGenre(genre);
			vo.setTitle(title);
			vo.setDirectors(director);
			vo.setActors(actor);
			vo.setPlots(plots);
			vo.setPoster(poster);
			vo.setRating(rating);
			vo.setRuntime(runtime);
			vo.setRating_grade(ratingGrade);
			vo.setRating_people(ratingPeople);

			DBDisConnect();
			return vo;
			
		}else {
			DBDisConnect();
			return null;
		}
	}
	
	//현재 상영작
	//select * from movie = ?;
	public List<MovieVO> listView() {
		driverLoad();
		DBConnect();
		
		String sql = "select * from movie_db where repRlsDate > 20250320 and repRlsDate < 20250414 and poster != 'aa.jpg'";
		
		executeQuery(sql);
		
		List<MovieVO> list = new ArrayList<>();
		while(next()) {
			String docid = getString("docid");
			String title = getString("title");
			String poster = getString("poster");
			
			MovieVO vo = new MovieVO();
			vo.setDocid(docid);
			vo.setTitle(title);
			vo.setPoster(poster);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
	//평점 7.0 이상 영화 목록
	public List<MovieVO> popularView() {
		driverLoad();
		DBConnect();
		
		String sql = "select * from movie_db where rating >= 7.0 and repRlsDate > 20100101 and poster != 'aa.jpg'";
		
		executeQuery(sql);
		
		List<MovieVO> list = new ArrayList<>();
		while(next()) {
			String docid = getString("docid");
			String title = getString("title");
			String poster = getString("poster");
			
			MovieVO vo = new MovieVO();
			vo.setDocid(docid);
			vo.setTitle(title);
			vo.setPoster(poster);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
	//개봉 예정 영화
	public List<MovieVO> soonView() {
		driverLoad();
		DBConnect();
		
		String sql = "select * from movie_db where repRlsDate > 20250414 and poster != 'aa.jpg'";
		
		executeQuery(sql);
		
		List<MovieVO> list = new ArrayList<>();
		while(next()) {
			String docid = getString("docid");
			String title = getString("title");
			String poster = getString("poster");
			
			MovieVO vo = new MovieVO();
			vo.setDocid(docid);
			vo.setTitle(title);
			vo.setPoster(poster);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
	//장르별 영화 선택
	public List<MovieVO> selectByGenre(String genre) {
	    driverLoad();
	    DBConnect();
	    
	    String sql = "select * from movie_db where poster != 'aa.jpg' and genre like '%"+genre+"%'";
	    
	    executeQuery(sql);
	    
	    List<MovieVO> list = new ArrayList<>();
	    while (next()) {
	        String docid = getString("docid");
	        String title = getString("title");
	        String poster = getString("poster");
	        
	        MovieVO vo = new MovieVO();
	        vo.setDocid(docid);
	        vo.setTitle(title);
	        vo.setPoster(poster);
	        
	        list.add(vo);
	    }
	    DBDisConnect();
	    return list;
	}
	
	//장르별 인기 영화 선택
	public List<MovieVO> popularGenre(String genre) {
	    driverLoad();
	    DBConnect();
	    
	    String sql = "select * from movie_db where poster != 'aa.jpg' and genre like '%"+genre+"%' and rating >= 7";
	    
	    executeQuery(sql);
	    
	    List<MovieVO> list = new ArrayList<>();
	    while (next()) {
	        String docid = getString("docid");
	        String title = getString("title");
	        String poster = getString("poster");
	        
	        MovieVO vo = new MovieVO();
	        vo.setDocid(docid);
	        vo.setTitle(title);
	        vo.setPoster(poster);
	        
	        list.add(vo);
	    }
	    DBDisConnect();
	    return list;
	}
	
	//영화 검색?
	public List<MovieVO> searchMovies(String keyword) {
	    driverLoad();
	    DBConnect();
	    
	    String sql = "select * from movie_db where poster != 'aa.jpg' and title like '%" + keyword + "%'";
	    executeQuery(sql);
	    
	    List<MovieVO> list = new ArrayList<>();
	    while (next()) {
	        MovieVO vo = new MovieVO();
	        vo.setDocid(getString("docid"));
	        vo.setTitle(getString("title"));
	        vo.setPoster(getString("poster"));
	        vo.setGenre(getString("genre"));
	        vo.setDirectors(getString("directors"));
	        vo.setActors(getString("actors"));
	        vo.setRepRlsDate(getString("repRlsDate"));
	        vo.setRating(getInt("rating"));
	        
	        list.add(vo);
	    }
	    DBDisConnect();
	    return list;
	}

}
