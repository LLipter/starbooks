package model;

import java.util.List;
import java.util.ArrayList;

public class ShopCart {

    private List<Item> items;

    public ShopCart(){
        this.items = new ArrayList();
    }

    public List<Item> getItems() {
        return this.items;
    }

    public void AddItems(Item item) {
        this.items.add(item);
    }

}
