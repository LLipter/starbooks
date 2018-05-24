package model;

public class Item {

    private int item_id;

    private int book_id;

    private int order_id;

    private int quantity;

    public Item(){}

    public Item(int item_id, int book_id, int order_id, int quantity){
        this.item_id = item_id;
        this.book_id = book_id;
        this.order_id = order_id;
        this.quantity = quantity;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
