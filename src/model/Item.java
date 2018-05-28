package model;

public class Item {
    

	private int quantity;
    private Book book;
    
    public Item() {
    	// do nothing
    }
    
    public Item(int quantity, Book book) {
		this.quantity = quantity;
		this.book = book;
	}
    
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}


}
