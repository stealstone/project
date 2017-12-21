package Team3.Model;
import java.util.Vector;


public class Total {

	private Vector <String> station_v;
	
	private Vector <String> travel_v; // 여행지이름
	private Vector <String> stay_v; // 숙박타입이름
	private Vector <String> room_v; //숙소이름
	private Vector <String> food_v; // 음식이름
	
	
	private Vector <String> traveltype_v; // 입장권 종류 이름
	private Vector <String> traveltype_key; // 입장권 종류 기본 키
	private Vector <String> roomtype_v; // 방종류 이름
	private Vector <String> roomtype_key; // 방종류 기본 키
	private Vector <String> foodtype_v; // 음식점 이름
	private Vector <String> foodtype_key; // 음식점 이름 기본 키
	
	private Vector <Integer> travelp_nv; // 입장권 가격
	private Vector <Integer> roomp_nv; // 방가격
	private Vector <Integer> foodp_nv; // 음식 가격
	
	private Vector <Integer> travelp_v; // 원하는 입장권 갯수
	private Vector <Integer> roomp_v; // 원하는 방 갯수
	private Vector <Integer> foodp_v; //원하는 음식 갯수
	
	private Vector <Integer> travelp_rv; // 입장권 최종 가격
	private Vector <Integer> roomp_rv; // 방 최종 가격
	private Vector <Integer> foodp_rv; // 음식 최종가격
	
	public Total() {
		
		this.station_v = new Vector<String>(1,1);
		
		this.travel_v =new Vector<String>(1,1);
		this.stay_v =new Vector<String>(1,1);
		this.room_v = new Vector<String>(1,1);
		this.food_v = new Vector<String>(1,1);
		this.foodtype_key = new Vector<String>(1,1);
		
		this.traveltype_v =new Vector<String>(1,1);
		this.roomtype_v = new Vector<String>(1,1);
		this.traveltype_key =new Vector<String>(1,1);
		this.roomtype_key = new Vector<String>(1,1);
		this.foodtype_v = new Vector<String>(1,1);
		
		this.travelp_nv = new Vector<Integer>(1,1);
		this.roomp_nv = new Vector<Integer>(1,1);
		this.foodp_nv =  new Vector<Integer>(1,1);
		
		this.travelp_v = new Vector<Integer>(1,1);
		this.roomp_v = new Vector<Integer>(1,1);
		this.foodp_v =  new Vector<Integer>(1,1);
		
		this.travelp_rv = new Vector<Integer>(1,1);
		this.roomp_rv = new Vector<Integer>(1,1);
		this.foodp_rv =  new Vector<Integer>(1,1);
	}
	
	public Vector<String> getStation_v(){
		return station_v;
	}
	
	public void setStation_v(Vector<String> station, Vector<String> station_v){
		this.station_v = station_v;
	}

	public Vector<String> getTravel_v() {
		return travel_v;
	}

	public void setTravel_v(Vector<String> travel_v) {
		this.travel_v = travel_v;
	}

	public Vector<String> getRoom_v() {
		return room_v;
	}

	public void setRoom_v(Vector<String> room_v) {
		this.room_v = room_v;
	}

	public Vector<String> getFood_v() {
		return food_v;
	}

	public void setFood_v(Vector<String> food_v) {
		this.food_v = food_v;
	}

	public Vector<String> getTraveltype_v() {
		return traveltype_v;
	}

	public void setTraveltype_v(Vector<String> traveltype_v) {
		this.traveltype_v = traveltype_v;
	}

	public Vector<String> getRoomtype_v() {
		return roomtype_v;
	}

	public void setRoomtype_v(Vector<String> roomtype_v) {
		this.roomtype_v = roomtype_v;
	}

	public Vector<String> getFoodtype_v() {
		return foodtype_v;
	}

	public void setFoodtype_v(Vector<String> foodtype_v) {
		this.foodtype_v = foodtype_v;
	}

	public Vector<Integer> getTravelp_nv() {
		return travelp_nv;
	}

	public void setTravelp_nv(Vector<Integer> travelp_nv) {
		this.travelp_nv = travelp_nv;
	}

	public Vector<Integer> getRoomp_nv() {
		return roomp_nv;
	}

	public void setRoomp_nv(Vector<Integer> roomp_nv) {
		this.roomp_nv = roomp_nv;
	}

	public Vector<Integer> getFoodp_nv() {
		return foodp_nv;
	}

	public void setFoodp_nv(Vector<Integer> foodp_nv) {
		this.foodp_nv = foodp_nv;
	}

	public Vector<Integer> getTravelp_v() {
		return travelp_v;
	}

	public void setTravelp_v(Vector<Integer> travelp_v) {
		this.travelp_v = travelp_v;
	}

	public Vector<Integer> getRoomp_v() {
		return roomp_v;
	}

	public void setRoomp_v(Vector<Integer> roomp_v) {
		this.roomp_v = roomp_v;
	}

	public Vector<Integer> getFoodp_v() {
		return foodp_v;
	}

	public void setFoodp_v(Vector<Integer> foodp_v) {
		this.foodp_v = foodp_v;
	}

	public Vector<Integer> getTravelp_rv() {
		return travelp_rv;
	}

	public void setTravelp_rv(Vector<Integer> travelp_rv) {
		this.travelp_rv = travelp_rv;
	}

	public Vector<Integer> getRoomp_rv() {
		return roomp_rv;
	}

	public void setRoomp_rv(Vector<Integer> roomp_rv) {
		this.roomp_rv = roomp_rv;
	}

	public Vector<Integer> getFoodp_rv() {
		return foodp_rv;
	}

	public void setFoodp_rv(Vector<Integer> foodp_rv) {
		this.foodp_rv = foodp_rv;
	}

	public Vector<String> getStay_v() {
		return stay_v;
	}

	public void setStay_v(Vector<String> stay_v) {
		this.stay_v = stay_v;
	}

	public Vector<String> getFoodtype_key() {
		return foodtype_key;
	}

	public void setFoodtype_key(Vector<String> foodtype_key) {
		this.foodtype_key = foodtype_key;
	}

	public Vector<String> getTraveltype_key() {
		return traveltype_key;
	}

	public void setTraveltype_key(Vector<String> traveltype_key) {
		this.traveltype_key = traveltype_key;
	}

	public Vector<String> getRoomtype_key() {
		return roomtype_key;
	}

	public void setRoomtype_key(Vector<String> roomtype_key) {
		this.roomtype_key = roomtype_key;
	}

	



}