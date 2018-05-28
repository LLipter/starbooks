package model;

import java.util.List;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;

public class Order implements Iterable<Item>{

    private ArrayList<Item> items;
    private Timestamp created_time;
    private int order_status;
    private double totalPrice;
    
    public Order() {
    	// do nothing
    }

    public Order(Timestamp created_time, int order_status) {
    	items = new ArrayList<Item>();
		this.created_time = created_time;
		this.order_status = order_status;
		totalPrice = 0;
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
		return totalPrice;
	}

	public void AddItems(Item item) {
        this.items.add(item);
        this.totalPrice += item.getBook().getPrice();
    }
	
	public void removeItem(Item item) {
		items.remove(item);
	}

	@Override
	public Iterator<Item> iterator() {
		return items.iterator();
	}

}
