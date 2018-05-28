package model;

import java.util.List;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Order {

    private List<Item> items;
//    private final Timestamp created_time;
//    private int order_status;

    public Order(){
        this.items = new ArrayList<Item>();
    }

    public List<Item> getItems() {
        return this.items;
    }

    public void AddItems(Item item) {
        this.items.add(item);
    }


    

}
