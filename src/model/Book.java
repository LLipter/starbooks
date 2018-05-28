package model;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;

public class Book {

    private final int book_id;

    private final String book_name;

    private final String author;

    private final String publisher;

    private final double price;

    private final String res_url;

    private int book_status;
    
	private String description;
    
    private String information;
    
    private String reviews;
    
 

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
	
	private String getText(String url) {
    	BufferedReader input;
		String line = null;
		String ret = "";
		try {
			input = new BufferedReader(new FileReader(url));
			while((line = input.readLine()) != null)
				ret += line;
			input.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ret;
	}
   
    private void initText()  {
    	String desc_url = String.format("/starbooks/resource/book/description/%s.txt",this.getRes_url());
    	String info_url = String.format("/starbooks/resource/book/information/%s.txt",this.getRes_url());
    	String review_url = String.format("/starbooks/resource/book/reviews/%s.txt",this.getRes_url());

    	this.setDescription(getText(desc_url));
    	this.setInformation(getText(info_url));
    	this.setReviews(getText(review_url));
		
    }
    
    
    public void setBook_status(int book_status) {
        this.book_status = book_status;
    }

}
