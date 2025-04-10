package ip;

import db.DBManager;

public class IpDAO extends DBManager{
	
	public void insert(IpVO vo) {
		String ip = vo.getIp();
		String menuid = vo.getMenu_id();
		
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "insert into log(ip, menu_id) values('"+ip+"', '"+menuid+"')";
		
		executeUpdate(sql);
	}
}
