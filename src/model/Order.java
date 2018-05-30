package model;

import java.util.List;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;

public class Order implements Iterable<Item> {

	private ArrayList<Item> items;
	private int order_id;
	private Timestamp created_time;
	private int order_status;
	private String receiver_name;
	private String address;
	private String email;
	private String phone;
	private String post_code;

	public Order() {
		// do nothing
		items = new ArrayList<Item>();
	}

	public Order(int order_id, Timestamp created_time, int order_status, String receiver_name, String address,
			String email, String phone, String post_code) {
		items = new ArrayList<Item>();
		this.order_id = order_id;
		this.created_time = created_time;
		this.order_status = order_status;
		this.receiver_name = receiver_name;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.post_code = post_code;
	}

	public int getOrder_status() {
		return order_status;
	}

	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}

	public Timestamp getCreated_time() {
		return created_time;
	}

	public double getTotalPrice() {
		double ret = 0;
		for (Item item : this) {
			ret += item.getQuantity() * item.getBook().getPrice();
		}
		return ret;
	}

	public void AddItems(Item item) {
		items.add(item);
	}

	public void removeItem(Item item) {
		items.remove(item);
	}

	public void removeItem(int index) {
		items.remove(index);
	}

	@Override
	public Iterator<Item> iterator() {
		return items.iterator();
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int size() {
		return items.size();
	}

	public String getReceiver_name() {
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

}
