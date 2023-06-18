package project;

public class LoginDto {

   //Property
   private String email;
   private String name;
   private String pwd;
   private String nickname;
   
   //기본 생성자
   public LoginDto() {}
   
   //필드가 있는 생성자
   public LoginDto(String email, String name, String pwd, String nickname) {
      this.email = email;
      this.name = name;
      this.pwd = pwd;
      this.nickname = nickname;
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
