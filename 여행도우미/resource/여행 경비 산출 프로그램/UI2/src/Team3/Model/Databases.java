package Team3.Model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;


@SuppressWarnings("unused")
public class Databases {

	private Connection conn;
	private Vector<String> station_v = new Vector<String>(1, 1);
	private Vector<String> station_key = new Vector<String>(1, 1);	

	
	private Vector<String> travel_v = new Vector<String>(1, 1);
	private Vector<String> travel_key = new Vector<String>(1, 1);

	
	private Vector<String> enter_v = new Vector<String>(1, 1);
	private Vector<String> enter_key = new Vector<String>(1, 1);	
	private Vector<Integer> enter_fee = new Vector<Integer>(1, 1);
	
	private Vector<String> food_v = new Vector<String>(1, 1);
	private Vector<String> food_key = new Vector<String>(1, 1);
	private Vector<Integer> food_fee = new Vector<Integer>(1, 1);
	
	private Vector<String> rest_v = new Vector<String>(1, 1);
	private Vector<String> rest_key = new Vector<String>(1, 1);
	
	private Vector<String> stay_v = new Vector<String>(1, 1);
	private Vector<String> stay_key = new Vector<String>(1, 1);
	
	private Vector<String> room_v = new Vector<String>(1, 1);
	private Vector<String> room_key = new Vector<String>(1, 1);
	private Vector<String> roomType_v = new Vector<String>(1, 1);
	private Vector<String> roomType_key = new Vector<String>(1, 1);
	private Vector<Integer> room_fee = new Vector<Integer>(1, 1);
	
	
	private Vector<Integer> travelp_v = new Vector<Integer>(1, 1);

	private Statement stmt;

	public Databases(Connection conn) {
		this.conn = conn;
		try {
			this.stmt = this.conn.createStatement();
		} catch (SQLException e) {
			System.out.println("STMT에러");
		}
	}

	public Vector<String> getStation(){
		station_key.clear();
		station_v.clear();
		String sql = "SELECT station_id,station_name FROM station";
		try {
			this.stmt.executeUpdate(sql);
			ResultSet rs = stmt.executeQuery(sql);
			station_v.addElement("역을 선택하세요");
			station_key.addElement("Start");			
			while(rs.next()){  
				//System.out.printf("%s %n", rs.getString(1)); //역이 잘 호출되는지 확인
				station_key.addElement(rs.getString(1));
				station_v.addElement(rs.getString(2));
			}
		} catch (SQLException e) {
			System.out.println("역찾기 에러");
		}		
		return  station_v;
	}
	
	public Vector<String> getSight(String station){
		travel_key.clear();
		travel_v.clear();
		System.out.println(station);
		String sql = ("SELECT sight_id,sight_name FROM SIGHT WHERE Station_id =" + "'"+station+ "'" );
		try {
			this.stmt.executeUpdate(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){  
				//System.out.printf("%s", rs.getString(1)); //관광지가 잘 호출되는지 확인
				travel_key.addElement(rs.getString(1));
				travel_v.addElement(rs.getString(2));
			}
		} catch (SQLException e) {
			System.out.println("관광지 찾기 에러");
		}		
		return  travel_v;
	}	
	
	public Vector<String> getEnter(String sight){
		enter_key.clear();
		enter_v.clear();
		enter_fee.clear();
		System.out.println(sight);
		String sql = ("SELECT e.enter_id,e.enter_type,c.enter_fee FROM enter e,charge c WHERE e.enter_id = c.enter_id  AND e.sight_id =" + "'"+sight+ "'" );
		System.out.println(sql);
		try {
			this.stmt.executeUpdate(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){  
				System.out.printf("%s", rs.getString(1)); //입장료가 잘 호출되는지 확인
				enter_key.addElement(rs.getString(1));
				enter_v.addElement(rs.getString(2));
				enter_fee.addElement(rs.getInt(3));
			}
		} catch (SQLException e) {
			System.out.println("입장료 찾기 에러");
		}		
		return  enter_v;
	}	
	
	public Vector<String> getFood(String sight){
		food_key.clear();
		food_v.clear();
		System.out.println(sight);
		String sql = ("SELECT food_id,food_name FROM food WHERE sight_id =" + "'"+sight+ "'" );
		System.out.println(sql);
		try {
			this.stmt.executeUpdate(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){  
				System.out.printf("%s", rs.getString(2)); //음식타입이 잘 호출되는지 확인
				food_key.addElement(rs.getString(1));
				food_v.addElement(rs.getString(2));
			}
		} catch (SQLException e) {
			System.out.println("음식타입 찾기 에러");
		}		
		return  food_v;
	}	
	
	public Vector<String> getRest(String food,String sight){
		rest_key.clear();
		rest_v.clear();
		food_fee.clear();
		System.out.println(sight);
		String sql = ("SELECT RESTAURANT_ID,RESTAURANT_NAME,FOOD_FEE FROM FOOD f , RESTAURANT r WHERE  f.FOOD_ID = r.FOOD_ID  AND f.food_id ="+ "'"+food+ "'AND" + " f.sight_id='"+sight+ "'" );
		System.out.println("식당선택!@!@!@!!@"+sql);
		try {
			this.stmt.executeUpdate(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){  
				System.out.printf("%s", rs.getString(2)); //식당이 잘 호출되는지 확인
				rest_key.addElement(rs.getString(1));
				rest_v.addElement(rs.getString(2));
				food_fee.addElement(rs.getInt(3));
			}
		} catch (SQLException e) {
			System.out.println("식당 찾기 에러");
		}		
		return  rest_v;
	}
	
	public Vector<String> getStay(String sight){
		stay_key.clear();
		stay_v.clear();
		System.out.println(sight);
		
		//SELECT STAY_ID,STAY_NAME FROM STAY WHERE SIGHT_ID = 'B1';
		String sql = ("SELECT STAY_ID,STAY_NAME FROM STAY WHERE SIGHT_ID =" + "'"+sight+ "'" );
		System.out.println(sql);
		try {
			this.stmt.executeUpdate(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){  
				System.out.printf("%s", rs.getString(2)); //숙소타입이 잘 호출되는지 확인
				stay_key.addElement(rs.getString(1));
				stay_v.addElement(rs.getString(2));
			}
		} catch (SQLException e) {
			System.out.println("숙소타입 찾기 에러");
		}		
		return  stay_v;
	}	
	
	//SELECT DISTINCT ROOM_NAME FROM ROOM WHERE STAY_ID = 'E1' AND SIGHT_ID = 'B1'; //호텔명찾기
	
	public Vector<String> getRoom(String stay){
		room_v.clear();
		String sql = ("SELECT DISTINCT ROOM_NAME FROM ROOM WHERE STAY_ID ="+ "'"+stay+ "'");
		System.out.println("방선택!@!@!@!!@"+sql);
		try {
			this.stmt.executeUpdate(sql);
			ResultSet rs = stmt.executeQuery(sql);			
			while(rs.next()){  
				System.out.printf("%s", rs.getString(1)); //식당이 잘 호출되는지 확인
				room_v.addElement(rs.getString(1));
			}
		} catch (SQLException e) {
			System.out.println("식당 찾기 에러");
		}		
		return  room_v;
	}
	
	
	
	//SELECT ROOM_ID,ROOM_TYPE FROM ROOM WHERE ROOM_NAME = '호텔썬비'; // 숙소 아이디, 타입별 가격찾기
	
	public Vector<String> getRoomType(String room){
		roomType_key.clear();
		roomType_v.clear();
		room_fee.clear();
		String sql = ("SELECT ROOM_ID,ROOM_TYPE,ROOM_FEE FROM ROOM WHERE ROOM_NAME ="+ "'"+ room+ "'");
		System.out.println("방선택!@!@!@!!@"+sql);
		try {
			this.stmt.executeUpdate(sql);
			ResultSet rs = stmt.executeQuery(sql);			
			while(rs.next()){  
				System.out.printf("%s", rs.getString(2)); //방이 잘 호출되는지 확인
				roomType_key.addElement(rs.getString(1));
				roomType_v.addElement(rs.getString(2));
				room_fee.addElement(rs.getInt(3));
			}
		} catch (SQLException e) {
			System.out.println("방 타입 찾기 에러");
		}		
		return  roomType_v;
	}

	

	public Vector<String> getStation_v() {
		return station_v;
	}

	public void setStation_v(Vector<String> station_v) {
		this.station_v = station_v;
	}

	public String getStation_key(int key) {
		return station_key.elementAt(key);
	}

	public void setStation_key(Vector<String> station_key) {
		this.station_key = station_key;
	}

	public Vector<String> getTravel_v() {
		return travel_v;
	}

	public void setTravel_v(Vector<String> travel_v) {
		this.travel_v = travel_v;
	}

	public String getTravel_key(int key) {
		return travel_key.elementAt(key);
	}
	public Vector <String> getTravel_key() {
		return travel_key;
	}
	

	public void setTravel_key(Vector<String> travel_key) {
		this.travel_key = travel_key;
	}

	public Vector<Integer> getTravelp_v() {
		return travelp_v;
	}

	public void setTravelp_v(Vector<Integer> travelp_v) {
		this.travelp_v = travelp_v;
	}

	public Vector<String> getFood_v() {
		return food_v;
	}
	
	public Vector<String> getRest_v() {
		return rest_v;
	}

	public void setRest_v(Vector<String> rest_v) {
		this.rest_v = rest_v;
	}

	public String getRest_key(int key) {
		return rest_key.elementAt(key);
	}

	public void setRest_key(Vector<String> rest_key) {
		this.rest_key = rest_key;
	}

	public String getFood_key(int key) {
		return food_key.elementAt(key);
	}
	
	public Vector<String> getStay_v() {
		return stay_v;
	}

	public void setStay_v(Vector<String> stay_v) {
		this.stay_v = stay_v;
	}

	public Vector<String> getStay_key() {
		return stay_key;
	}

	public String getStay_key(int key) {
		return stay_key.elementAt(key);
	}
	
	

	public Statement getStmt() {
		return stmt;
	}

	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}

	public Vector<Integer> getEnter_fee() {
		return enter_fee;
	}

	public void setEnter_fee(Vector<Integer> enter_fee) {
		this.enter_fee = enter_fee;
	}

	public Vector<Integer> getFood_fee() {
		return food_fee;
	}

	public void setFood_fee(Vector<Integer> food_fee) {
		this.food_fee = food_fee;
	}

	public Vector<Integer> getRoom_fee() {
		return room_fee;
	}

	public void setRoom_fee(Vector<Integer> room_fee) {
		this.room_fee = room_fee;
	}

	public Vector<String> getEnter_v() {
		return enter_v;
	}

	public void setEnter_v(Vector<String> enter_v) {
		this.enter_v = enter_v;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public Vector<String> getEnter_key() {
		return enter_key;
	}

	public void setEnter_key(Vector<String> enter_key) {
		this.enter_key = enter_key;
	}

	public Vector<String> getFood_key() {
		return food_key;
	}

	public void setFood_key(Vector<String> food_key) {
		this.food_key = food_key;
	}

	public Vector<String> getRoom_v() {
		return room_v;
	}

	public void setRoom_v(Vector<String> room_v) {
		this.room_v = room_v;
	}

	public Vector<String> getRoom_key() {
		return room_key;
	}

	public void setRoom_key(Vector<String> room_key) {
		this.room_key = room_key;
	}

	public Vector<String> getRoomType_v() {
		return roomType_v;
	}

	public void setRoomType_v(Vector<String> roomType_v) {
		this.roomType_v = roomType_v;
	}

	public Vector<String> getStation_key() {
		return station_key;
	}

	public Vector<String> getRest_key() {
		return rest_key;
	}

	public void setFood_v(Vector<String> food_v) {
		this.food_v = food_v;
	}

	public void setStay_key(Vector<String> stay_key) {
		this.stay_key = stay_key;
	}

	public Vector<String> getRoomType_key() {
		return roomType_key;
	}

	public void setRoomType_key(Vector<String> roomType_key) {
		this.roomType_key = roomType_key;
	}
	
	
	

}
