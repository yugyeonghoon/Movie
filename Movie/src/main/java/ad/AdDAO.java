package ad;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class AdDAO extends DBManager {
	
	//1.광고추가
	public void addAd(AdVO vo) {
		String title = vo.getAdTitle();
		String img = vo.getAdImg();
		String link = vo.getAdLink();
		String category = vo.getAdCat();
		driverLoad();
		DBConnect();
		
		String sql = "insert into advertisement(advertisement_title, advertisement_img, advertisement_cat, advertisement_link)";
		sql += " values('"+title+"', '"+img+"', '"+link+"', '"+category+"')";
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
		driverLoad();
		DBConnect();
		
		String sql = "update advertisement set advertisement_title = '"+title+"', advertisement_img = '"+img+"', advertisement_cat = '"+category+"', advertisement_link = '"+link+"'";
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
	public List<AdVO> adList(){
		driverLoad();
		DBConnect();
		
		String sql = "select * from advertisement";
		
		executeQuery(sql);
		List<AdVO> list = new ArrayList<>();
		while(next()) {
			int adnum = getInt("advertisement_num");
			String title = getString("advertisement_title");
			String img = getString("advertisement_img");
			String link = getString("advertisement_link");
			String category = getString("advertisement_cat");
			
			AdVO vo = new AdVO();
			vo.setAdnum(adnum);
			vo.setAdTitle(title);
			vo.setAdImg(img);
			vo.setAdLink(link);
			vo.setAdCat(category);
			
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
			
			AdVO vo = new AdVO();
			vo.setAdnum(adnum);
			vo.setAdTitle(title);
			vo.setAdImg(img);
			vo.setAdLink(link);
			vo.setAdCat(category);
			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}
	}
}
