/**==================================
 * 작성자 : qbnyp
 * 작성명 : 2023. 6. 20.
 * 파일명 : ReplyDto.java
 * 프로그램 설명 : 
*=====================================*/
package project;

/**
 * @author qbnyp
 *
 */
public class ReplyDto {

	private int b_num;
	private String writer;
	private String content;
	
	public ReplyDto(int b_num, String writer, String content) {
		this.b_num = b_num;
		this.writer = writer;
		this.content = content;
	}

	/**
	 * @return the b_num
	 */
	public int getB_num() {
		return b_num;
	}

	/**
	 * @param b_num the b_num to set
	 */
	public void setB_num(int b_num) {
		this.b_num = b_num;
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
	
	
}
