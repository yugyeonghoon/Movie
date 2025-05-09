package ad;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;
import movie.AdMovieVO;

public class AdDAO extends DBManager {
	
	//1.광고추가
	public void addAd(AdVO vo) {
		String title = vo.getAdTitle();
		String img = vo.getAdImg();
		String link = vo.getAdLink();
		String category = vo.getAdCat();
		String startDate = vo.getStartDate();
		String endDate = vo.getEndDate();
		driverLoad();
		DBConnect();
		
		String sql = "insert into advertisement(advertisement_title, advertisement_img, advertisement_cat, advertisement_link, start_date ,end_date)";
		sql += " values('"+title+"', '"+img+"', '"+link+"', '"+category+"', '"+startDate+"' ,'"+endDate+"')";
		executeUpdate(sql);
		DBConnect();
	}

	//2.광고 수정
	public void adModify(AdVO vo) {
		String title = vo.getAdTitle();
		String img = vo.getAdImg();
		String link = vo.getAdLink();
		String category = vo.getAdCat();
		int adnum = vo.getAdnum();
		String endDate = vo.getEndDate();
		driverLoad();
		DBConnect();
		
		String sql = "update advertisement set advertisement_title = '"+title+"', advertisement_img = '"+img+"', advertisement_cat = '"+category+"', advertisement_link = '"+link+"', end_date = '"+endDate+"'";
		sql += " where advertisement_num = "+ adnum;
		executeUpdate(sql);
		DBConnect();
	}
	
	//3.광고 삭제
	
	public void adDelete(int adnum) {
		driverLoad();
		DBConnect();
		
		String sql = "delete from advertisement where advertisement_num = "+adnum;
		executeUpdate(sql);
		DBConnect();
	}
	
	//4. 광고 리스트 조회
	public List<AdVO> adList(String searchType, String keyword, int startNum, int limitSize){
		driverLoad();
		DBConnect();
		
		String sql = "select * from advertisement";
		
		if(searchType != null && keyword != null){
	        sql += " where "+searchType+ " like '%"+keyword+"%'"; 
	    }
		sql += " limit " + startNum + ", " + limitSize;
	    executeQuery(sql);
		
		executeQuery(sql);
		List<AdVO> list = new ArrayList<>();
		while(next()) {
			int adnum = getInt("advertisement_num");
			String title = getString("advertisement_title");
			String img = getString("advertisement_img");
			String link = getString("advertisement_link");
			String category = getString("advertisement_cat");
			String startDate = getString("start_date");
			String endDate = getString("end_date");
			
			AdVO vo = new AdVO();
			
			vo.setAdnum(adnum);
			vo.setAdTitle(title);
			vo.setAdImg(img);
			vo.setAdLink(link);
			vo.setAdCat(category);
			vo.setStartDate(startDate);
			vo.setEndDate(endDate);
			
			list.add(vo);
					
		}
		DBDisConnect();
		return list;
	}
	
	//5. 광고 단건 조회
	public AdVO adView(int adnum) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from advertisement where advertisement_num = "+ adnum;
		executeQuery(sql);
		
		if(next()) {
			int adnum1 = getInt("advertisement_num");
			String title = getString("advertisement_title");
			String img = getString("advertisement_img");
			String link = getString("advertisement_link");
			String category = getString("advertisement_cat");
			String startDate = getString("start_date");
			String endDate = getString("end_date");
			
			AdVO vo = new AdVO();
			vo.setAdnum(adnum1);
			vo.setAdTitle(title);
			vo.setAdImg(img);
			vo.setAdLink(link);
			vo.setAdCat(category);
			vo.setStartDate(startDate);
			vo.setEndDate(endDate);
			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}
	}
	
	//광고 개수 조회
	public int getCount(String searchType, String keyword){
		driverLoad();
		DBConnect();
		
		String sql = "select count(*) as cnt from advertisement ";
		if(searchType != null && keyword != null) {
			sql += "where " + searchType + " like '%" + keyword + "%'";
		}
		executeQuery(sql);
		if(next()) {
			int count = getInt("cnt");
			DBConnect();
			return count;
		}else {
			DBDisConnect();
			return 0;
		}
	};
	
	public List<AdBoardVO> ad(String no) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from ad_board_similarity where board_no = " + no;
		sql += " order by advertisement_board_similarity desc limit 2";
		executeQuery(sql);
		
		List<AdBoardVO> list = new ArrayList<>();
			while (next()) {
				AdBoardVO vo = new AdBoardVO();
				vo.setNo(getInt("no"));
				vo.setBoard_no(getInt("board_no"));
				vo.setAdvertisement_title(getString("advertisement_title"));
				vo.setBoard_title(getString("board_title"));
				vo.setAdvertisement_link(getString("advertisement_link"));
				vo.setAdvertisement_img(getString("advertisement_img"));
				vo.setAdvertisement_board_similarity(getString("advertisement_board_similarity"));
				
				list.add(vo);
			}
			DBDisConnect();
			return list;
		
	}
	//게시물 광고 유사도
	public List<AdBoardVO> adSim(String no) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from ad_board_similarity where board_no = " + no;
		sql += " order by advertisement_board_similarity desc limit 3";
		executeQuery(sql);
		
		List<AdBoardVO> list = new ArrayList<>();
			while (next()) {
				AdBoardVO vo = new AdBoardVO();
				vo.setNo(getInt("no"));
				vo.setBoard_no(getInt("board_no"));
				vo.setAdvertisement_title(getString("advertisement_title"));
				vo.setBoard_title(getString("board_title"));
				vo.setAdvertisement_link(getString("advertisement_link"));
				vo.setAdvertisement_img(getString("advertisement_img"));
				vo.setAdvertisement_board_similarity(getString("advertisement_board_similarity"));
				
				list.add(vo);
			}
			DBDisConnect();
			return list;
		
	}
	//영화 광고 출력
		public List<AdMovieVO> movieAdvertisement(String no) {
			driverLoad();
			DBConnect();
			
			String sql = "select * from movie_ad where docid = '"+no+"' ";
			sql += " order by movie_advertisement_similarity desc limit 2";
			executeQuery(sql);
			
			List<AdMovieVO> list = new ArrayList<>();
				while (next()) {
					AdMovieVO vo = new AdMovieVO();
					vo.setNo(getInt("no"));
					vo.setDocid(getString("docid")); 
					vo.setAdvertisement_title(getString("advertisement_title"));
					vo.setAdvertisement_img(getString("advertisement_img"));
					vo.setAdvertisement_link(getString("advertisement_link"));
					vo.setMovie_advertisement_similarity(getString("movie_advertisement_similarity"));
					
					list.add(vo);
				}
				DBDisConnect();
				return list;
		}

		
	//영화 광고 유사도 
	public List<MovieAdVO> AdMovieSim(String docid){
		driverLoad();
		DBConnect();
		
		String sql = "SELECT \r\n"
				+ "    ma.no,\r\n"
				+ "    ma.movie_advertisement_similarity,\r\n"
				+ "    ma.DOCID,\r\n"
				+ "    ma.advertisement_title,\r\n"
				+ "    movie_db.title AS base_movie_title\r\n"
				+ "FROM \r\n"
				+ "    movie_ad ma\r\n"
				+ "JOIN \r\n"
				+ "    movie_db ON ma.DOCID = movie_db.docid\r\n"
				+ "WHERE \r\n"
				+ "    ma.DOCID = '"+docid+"' limit 3;";
		executeQuery(sql);
		
		List<MovieAdVO> list = new ArrayList<>();
		
			while(next()) {
				
				MovieAdVO vo = new MovieAdVO();
				vo.setAdvertisement_title(getString("advertisement_title"));
				vo.setBase_movie_title(getString("base_movie_title"));
				vo.setMovie_advertisement_similarity(getString("movie_advertisement_similarity"));
				vo.setDocid(getString("docid"));
				list.add(vo);
			}
			DBDisConnect();
			return list;
	}
}
