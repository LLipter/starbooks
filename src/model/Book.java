package model;

import java.io.*;

public class Book {

	private final int book_id;
    private String book_name;
    private String author;
    private String publisher;
    private double price;
    private final String res_url;
    private int book_status;
	private String description;
    private String information;
    private String reviews;
    private String ret;
    public Book() {
    	book_id = -1;
    	res_url = "no such url";
    	// do nothing
    }

    public Book(int book_id, String book_name, String author, String publisher,
    		double price, String res_url, int book_status){
        this.book_id = book_id;
        this.book_name = book_name;
        this.author = author;
        this.publisher = publisher;
        this.price = price;
        this.res_url = res_url;
        this.book_status = book_status;
        initText();
    }
	
	private String getText(String url) {
		File file=new File(url);
		
    	BufferedReader input=null;
		String line = null;
		ret=null;
		
		try {
		try {
			input = new BufferedReader(new FileReader(file));
			while((line = input.readLine()) != null)
				ret += line;
			input.close();
}catch(FileNotFoundException a) {
		a.printStackTrace();	
		}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return ret;
	}
   
    private void initText()  {
    	String desc_url = String.format("/Users/Haoyu/Desktop/Tomcat/webapps/starbooks/resource/book/description/%s.txt",this.getRes_url());
    	String info_url = String.format("/Users/Haoyu/Desktop/Tomcat/webapps/starbooks/resource/book/information/%s.txt",this.getRes_url());
    	String review_url = String.format("/Users/Haoyu/Desktop/Tomcat/webapps/starbooks/resource/book/reviews/%s.txt",this.getRes_url());

    	this.setDescription(getText(desc_url));
    	this.setInformation(getText(info_url));
    	this.setReviews(getText(review_url));
		
    }
    
	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getBook_status() {
		return book_status;
	}

	public void setBook_status(int book_status) {
		this.book_status = book_status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public String getReviews() {
		return reviews;
	}

	public void setReviews(String reviews) {
		this.reviews = reviews;
	}

	public int getBook_id() {
		return book_id;
	}

	public String getRes_url() {
		return res_url;
	}
    

}
