package model;

public class Book {

    private final int book_id;

    private final String book_name;

    private final String author;

    private final String publisher;

    private final double price;

    private final String res_url;

    private int book_status;

    public Book(){}

    public Book(int book_id, String book_name, String author, String publisher, double price, String res_url, int book_status){
        this.book_id = book_id;
        this.book_name = book_name;
        this.author = author;
        this.publisher = publisher;
        this.price = price;
        this.res_url = res_url;
        this.book_status = book_status;
    }

    public int getBook_id() {
        return book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public String getAuthor() {
        return author;
    }

    public String getPublisher() {
        return publisher;
    }

    public double getPrice() {
        return price;
    }

    public String getRes_url() {
        return res_url;
    }

    public int getBook_status() {
        return book_status;
    }

    public void setBook_status(int book_status) {
        this.book_status = book_status;
    }

}
