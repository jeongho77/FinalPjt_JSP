package project;

public class LoginDto {

	// Property
	private int number;
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

	private String email;
	private String name;
	private String pwd;
	private String nickname;
	private String a;

	// 기본 생성자
	public LoginDto() {
	}

	// 필드가 있는 생성자
	public LoginDto(String email, String name, String pwd, String nickname) {
		this.email = email;
		this.name = name;
		this.pwd = pwd;
		this.nickname = nickname;
	}

	public LoginDto(int number) {
		this.number = number;
	}

	/**
	 * @return the a
	 */
	
	public LoginDto(String name, String pwd, String email, int number) {
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.number = number;
	}

//로그인 생성자
	public LoginDto(String email, String pwd) {
		this.email = email;
		this.pwd = pwd;
	}

	public LoginDto(String email, String pwd, String nickname) {
		this.email = email;
		this.pwd = pwd;
		this.nickname = nickname;
	}

	/**
	 * @param a the a to set
	 */
	public String getA() {
		return a;
	}

	
	public void setA(String a) {
		this.a = a;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
