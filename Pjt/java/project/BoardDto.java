/**==================================
 * 작성자 : qbnyp
 * 작성명 : 2023. 6. 17.
 * 파일명 : BoardDto.java
 * 프로그램 설명 : 
*=====================================*/
package project;

import java.util.Date;

public class BoardDto {
	 private int number;
	 private String title;
	 private int reply_cnt;
	 private String writer;
	 private String content;
	 private int view_cnt;
	 private int like;
	 private Date regdate;
	 
	 public BoardDto(String title, int reply_cnt, String writer, String content, String view_cnt, int like, java.sql.Date date) {
		    this.title = title;
		    this.reply_cnt = reply_cnt;
		    this.writer = writer;
		    this.content = content;
		    this.view_cnt = Integer.parseInt(view_cnt);
		    this.like = like;
		    this.regdate = date;
		}
	 
	 public BoardDto(String title, int reply_cnt, String writer, String content, int view_cnt, int like, Date regdate) {
		 this.title = title;
		 this.reply_cnt = reply_cnt;
		 this.writer = writer;
		 this.content = content;
		 this.view_cnt = view_cnt;
		 this.like = like;
		 this.regdate = regdate;
	 }
	 
	 //게시판 글 작성 
	 public BoardDto(String title, String content) {
		 this.title = title;
		 this.content = content;
	 }

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the reply_cnt
	 */
	public int getReply_cnt() {
		return reply_cnt;
	}

	/**
	 * @param reply_cnt the reply_cnt to set
	 */
	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}

	/**
	 * @return the writer
	 */
	public String getWriter() {
		return writer;
	}

	/**
	 * @param writer the writer to set
	 */
	public void setWriter(String writer) {
		this.writer = writer;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the view_cnt
	 */
	public int getView_cnt() {
		return view_cnt;
	}

	/**
	 * @param view_cnt the view_cnt to set
	 */
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	/**
	 * @return the like
	 */
	public int getLike() {
		return like;
	}

	/**
	 * @param like the like to set
	 */
	public void setLike(int like) {
		this.like = like;
	}

	/**
	 * @return the regdate
	 */
	public Date getRegdate() {
		return regdate;
	}

	/**
	 * @param regdate the regdate to set
	 */
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	/**
	 * @return the number
	 */
	public int getNumber() {
		return number;
	}

	/**
	 * @param number the number to set
	 */
	public void setNumber(int number) {
		this.number = number;
	}

	/**
	 * @return
	 */
		
	 
}
