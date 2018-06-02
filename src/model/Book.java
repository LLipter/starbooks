package model;

import java.io.*;
import java.util.Random;

import listener.DatabaseUtility;

public class Book {

	private int book_id;
	private String book_name;
	private String author;
	private String publisher;
	private double price;
	private String res_url;
	private int book_status;
	private String description;
	private String information;
	private String reviews;

	public Book() {
		book_id = -1;
		// do nothing
	}

	public Book(int book_id, String book_name, String author, String publisher, double price, String res_url,
			int book_status) {
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
		BufferedReader input;
		String line = null;
		String ret = "";
		try {
			FileInputStream fis = new FileInputStream(url);
			InputStreamReader isr = new InputStreamReader(fis,"UTF-8");//这里略做改动 处理乱码问题
			input = new BufferedReader(isr);
			while ((line = input.readLine()) != null)
				ret += line;
			input.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ret;
	}

	private void initText() {
		String desc_url = String.format("%sresource/book/description/%s.txt", DatabaseUtility.basePath,
				this.getRes_url());
		String info_url = String.format("%sresource/book/information/%s.txt", DatabaseUtility.basePath,
				this.getRes_url());
		String review_url = String.format("%sresource/book/reviews/%s.txt", DatabaseUtility.basePath,
				this.getRes_url());

		this.setDescription(getText(desc_url));
		this.setInformation(getText(info_url));
		this.setReviews(getText(review_url));

	}
	
	private void setText(String url,String text) throws IOException{
		File writename = new File(url); // 相对路径，如果没有则要建立一个新的output。txt文件
		OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream(writename),"UTF-8");
		writename.createNewFile(); // 创建新文件
		BufferedWriter out = new BufferedWriter(osw);
		out.write(text); // \r\n即为换行
		out.flush(); // 把缓存区内容压入文件
		out.close(); // 最后记得关闭文件
	}
	
	public void updateText() {
		String desc_url = String.format("%sresource/book/description/%s.txt", DatabaseUtility.basePath,
				this.getRes_url());
		String info_url = String.format("%sresource/book/information/%s.txt", DatabaseUtility.basePath,
				this.getRes_url());
		String review_url = String.format("%sresource/book/reviews/%s.txt", DatabaseUtility.basePath,
				this.getRes_url());
		try {
			this.setText(desc_url, this.getDescription());
			this.setText(info_url, this.getInformation());
			this.setText(review_url, this.getReviews());
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	public void generateRes_url() {
		char[] randomChar = new char[20];
		Random rd = new Random(System.currentTimeMillis());
		for(int i=0;i<20;i++) {
			int res = rd.nextInt(36);
			if(res < 26)
				randomChar[i] = (char) (res + 'a');
			else
				randomChar[i] = (char) (res - 26 + '0');
		}
		this.setRes_url(String.valueOf(randomChar));
	}
	
	
	

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public void setRes_url(String res_url) {
		this.res_url = res_url;
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
