package model;

import java.util.List;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;

public class Order implements Iterable<Item>{

    private ArrayList<Item> items;
    private int order_id;
    private Timestamp created_time;
    private int order_status;
    
    public Order() {
    	// do nothing
    	items=new ArrayList<Item>() ;
    }

    public Order(int order_id,Timestamp created_time, int order_status) {
    	items = new ArrayList<Item>();
    	this.order_id = order_id;
		this.created_time = created_time;
		this.order_status = order_status;
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
		for(Item item : this) {
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

	
}
