package kr.or.ksmart.dto;

public class Member {
    private String uId;
    private String uPw;
    private String uName;
    private int uLevel;
    private String uEmail;
    private String uPhone;
    private String uAddr;

    @Override
    public String toString() {
        return "Member{" +
                "uId='" + uId + '\'' +
                ", uPw='" + uPw + '\'' +
                ", uName='" + uName + '\'' +
                ", uLevel=" + uLevel +
                ", uEmail='" + uEmail + '\'' +
                ", uPhone='" + uPhone + '\'' +
                ", uAddr='" + uAddr + '\'' +
                '}';
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId;
    }

    public String getuPw() {
        return uPw;
    }

    public void setuPw(String uPw) {
        this.uPw = uPw;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public int getuLevel() {
        return uLevel;
    }

    public void setuLevel(int uLevel) {
        this.uLevel = uLevel;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone;
    }

    public String getuAddr() {
        return uAddr;
    }

    public void setuAddr(String uAddr) {
        this.uAddr = uAddr;
    }
}
