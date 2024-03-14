package kr.or.ksmart.dto;

public class Goods extends Member{
    private String gCode;
    private String uId;
    private String gName;

    private String gCategory;
    private String gPrice;
    private String gColor;
    private String gSize;
    private String gDate;
    private String gDescription;

    public String getgCode() {
        return gCode;
    }

    public void setgCode(String gCode) {
        this.gCode = gCode;
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId;
    }

    public String getgName() {
        return gName;
    }

    public void setgName(String gName) {
        this.gName = gName;
    }

    public String getgCategory() {
        return gCategory;
    }

    public void setgCategory(String gCategory) {
        this.gCategory = gCategory;
    }

    public String getgPrice() {
        return gPrice;
    }

    public void setgPrice(String gPrice) {
        this.gPrice = gPrice;
    }

    public String getgColor() {
        return gColor;
    }

    public void setgColor(String gColor) {
        this.gColor = gColor;
    }

    public String getgSize() {
        return gSize;
    }

    public void setgSize(String gSize) {
        this.gSize = gSize;
    }

    public String getgDate() {
        return gDate;
    }

    public void setgDate(String gDate) {
        this.gDate = gDate;
    }

    public String getgDescription() {
        return gDescription;
    }

    public void setgDescription(String gDescription) {
        this.gDescription = gDescription;
    }


    @Override
    public String toString() {
        return "Goods{" +
                "gCode='" + gCode + '\'' +
                ", uId='" + uId + '\'' +
                ", gName='" + gName + '\'' +
                ", gCategory='" + gCategory + '\'' +
                ", gPrice='" + gPrice + '\'' +
                ", gColor='" + gColor + '\'' +
                ", gSize='" + gSize + '\'' +
                ", gDate='" + gDate + '\'' +
                ", gDescription='" + gDescription + '\'' +
                '}';
    }
}
