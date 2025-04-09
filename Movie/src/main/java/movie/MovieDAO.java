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
		
		String sql = "select * from movie_db where repRlsDate > 20250320 and repRlsDate < 20250411 and poster != 'aa.jpg'";
		
		executeQuery(sql);
		
		List<MovieVO> list = new ArrayList<>();
		while(next()) {
			String docid = getString("docid");
			String title = getString("title");
			String poster = getString("poster");
			String genre = getString("genre");
			
			MovieVO vo = new MovieVO();
			vo.setDocid(docid);
			vo.setTitle(title);
			vo.setPoster(poster);
			vo.setGenre(genre);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
	//평점 7.0 이상 영화 목록
	public List<MovieVO> popularView(String genre) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		if(genre != null) {
			sql = "select * from movie_db where genre like '%"+genre+"%' and movie_type = 1 order by rating desc";
		}else {
			sql = "select * from movie_db order by rating desc";
		}
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
		        vo.setMovie_type(getInt("movie_type"));
		        
		        list.add(vo);
		    }
		    DBDisConnect();
		    return list;
		
	}
	
	//개봉 예정 영화
	public List<MovieVO> soonView() {
		driverLoad();
		DBConnect();
		
		String sql = "select * from movie_db where repRlsDate > 20250411 and poster != 'aa.jpg'";
		
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
	    
	    String sql = "select * from movie_db where poster != 'aa.jpg' and genre like '%"+genre+"%' and rating >= 7 and rating_people > 500 order by rating desc";
	    
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
	
	//영화 검색
	public List<MovieVO> searchMovies(String title, String actors) {
	    driverLoad();
	    DBConnect();
	    
	    String sql = "select * from movie_db where poster != 'aa.jpg' and rating > 8 and rating_people > 2000 ";
	    sql += "and (title like '%"+title+"%' or actors like '%"+actors+"%')";
	    		 
	    executeQuery(sql);
	    
	    List<MovieVO> list = new ArrayList<>();
	    while (next()) {
	    	String docid = getString("docid");
	        String poster = getString("poster");
	    	
	        MovieVO vo = new MovieVO();
	        vo.setDocid(docid);
	        vo.setPoster(poster);
	        
	        list.add(vo);
	    }
	    DBDisConnect();
	    return list;
	}
	
	//상세 정보 영화 추천작
	public List<MovieVO> similarityMovie(String id){
		driverLoad();
		DBConnect();
		
		String sql = "select * from movie_similarity ms";
		sql += " left join movie_db md on ms.target_movie_docid = md.docid ";
		sql += " where similarity != 0 and similarity != 1 and base_movie_docid = '"+id+"' limit 5";
		
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
	
	//관리자 추천작
	public List<MovieVO> recommenMovie(String searchType, String keyword, int startNum, int limitSize) {
	    driverLoad();
	    DBConnect();

	    String sql = "select * from movie_db";

	    if (searchType != null && keyword != null && !searchType.isEmpty() && !keyword.isEmpty()) {
	        sql += " where " + searchType + " like '%" + keyword + "%'";
	    }

	    sql += " order by movie_type = 1 desc";
	    sql += " limit " + startNum + ", " + limitSize;

	    executeQuery(sql);

	    List<MovieVO> list = new ArrayList<>();
	    while (next()) {
	        MovieVO vo = new MovieVO();
	        vo.setDocid(getString("docid"));
	        vo.setTitle(getString("title"));
	        vo.setGenre(getString("genre"));
	        vo.setRating(getInt("rating"));
	        vo.setMovie_type(getInt("movie_type"));

	        list.add(vo);
	    }

	    return list;
	}
	
	public int getCount(String searchType, String keyword) {
	    driverLoad();
	    DBConnect();

	    String sql = "select count(*) as cnt from movie_db";
	    if (searchType != null && keyword != null && !searchType.isEmpty() && !keyword.isEmpty()) {
	        sql += " and " + searchType + " like '%" + keyword + "%'";
	    }

	    executeQuery(sql);

	    if (next()) {
	        int count = getInt("cnt");
	        DBDisConnect();
	        return count;
	    } else {
	        DBDisConnect();
	        return 0;
	    }
	}
	
	
	//추천 영화 등록
	public void updateMovieType(String docid, int no) {
		driverLoad();
		DBConnect();
		
		String sql = "update movie_recommendation set movie_type = "+no+" where docid = '"+docid+"'";
		
		executeUpdate(sql);
		DBDisConnect();
	}
	
}
