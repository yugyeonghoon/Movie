package ip;

import db.DBManager;

public class IpDAO extends DBManager{
	
	public void insert(IpVO vo) {
		String ip = vo.getIp();
		String menuid = vo.getMenu_id();
		String id = vo.getId();
		
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "insert into log(ip, menu_id, id) values('"+ip+"', '"+menuid+"', '"+id+"')";
		
		executeUpdate(sql);
	}
}
