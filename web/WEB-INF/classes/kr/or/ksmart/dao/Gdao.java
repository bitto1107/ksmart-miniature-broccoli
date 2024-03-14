package kr.or.ksmart.dao;

import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.Goods;
import kr.or.ksmart.dto.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;

public class Gdao extends Mdao {
    PreparedStatement preparedStatement = null;
    Connection connection = null;
    ResultSet resultSet = null;

    /**
     * 상품 입력을 위한 Gdao 메서드
     * @param goods
     * @throws SQLException
     * @throws ClassNotFoundException
     * @return void
     */
    public void gInsert(Goods goods) throws SQLException, ClassNotFoundException {
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        PreparedStatement preparedStatementGetMax = connection.prepareStatement(
                "SELECT MAX(CAST(SUBSTRING(g_code, 7) AS DECIMAL)) FROM tb_goods");
        ResultSet resultSetGetMax = preparedStatementGetMax.executeQuery();
        out.printf("%s <= Gdao.gInsert called \n", goods);
        int max;
        String tempCode = "goods_";
        String gCode = "goods_00001";
        String maxToString;
        if (resultSetGetMax.next()) {
            max = resultSetGetMax.getInt(1);
            out.printf("%s <= max \n", max);
            max = max + 1;
            maxToString = String.format("%05d", max);
            gCode = tempCode + maxToString;
        }
        out.printf("%s <= gCode \n", gCode);
        goods.setgCode(gCode);
        preparedStatement = connection.prepareStatement(
                "INSERT INTO tb_goods VALUES (?,?,?,?,?,?,?,NOW(),?)");
        out.printf("%s <= preparedStatement \n", preparedStatement);
        preparedStatement.setString(1, goods.getgCode());
        preparedStatement.setString(2, goods.getuId());
        preparedStatement.setString(3, goods.getgName());
        preparedStatement.setString(4, goods.getgCategory());
        preparedStatement.setString(5, goods.getgPrice());
        preparedStatement.setString(6, goods.getgColor());
        preparedStatement.setString(7, goods.getgSize());
        preparedStatement.setString(8, goods.getgDescription());
        out.printf("%s <= preparedStatement \n", preparedStatement);


        int goodsInsertResult = preparedStatement.executeUpdate();
        out.printf("%s <== goodsInsertResult \n", goodsInsertResult);
        preparedStatement.close();
        connection.close();
    }

    /**
     * 상품코드와 일치하는 상품을 삭제하는 메서드
     * @param gCode
     * @throws SQLException
     * @throws ClassNotFoundException
     * @return void
     */
    public void gDelete(String gCode) throws SQLException, ClassNotFoundException {
        out.println("1-1 Gdao.gDelete called");
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        preparedStatement = connection.prepareStatement(
                "DELETE FROM tb_goods WHERE g_code =?");
        preparedStatement.setString(1, gCode);
        preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
    }

    /**
     * tb_goods의 정보를 수정하기 위해 gCode를 특정하기 위한 메서드
     * @param gCode 상품코드
     * @return goods
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public Goods gSelectForUpdate(String gCode) throws SQLException, ClassNotFoundException {
        out.println("1-1 Gdao.gSelectForUpdate called");
        return getGoods(gCode);
    }

    /**
     * tb_goods의 정보를 수정하는 메서드
     * @param goods
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public void gUpdate(Goods goods) throws SQLException, ClassNotFoundException {
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        out.println("1-1 Gdao.gUpdate called");
        preparedStatement = connection.prepareStatement(
                "UPDATE tb_goods SET g_name =?, g_cate =?, g_price =?, g_color =?, g_size =?, g_desc =? WHERE g_code =?");
        preparedStatement.setString(1, goods.getgName());
        preparedStatement.setString(2, goods.getgCategory());
        preparedStatement.setString(3, goods.getgPrice());
        preparedStatement.setString(4, goods.getgColor());
        preparedStatement.setString(5, goods.getgSize());
        preparedStatement.setString(6, goods.getgDescription());
        preparedStatement.setString(7, goods.getgCode());

        preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
    }

    /**
     * tb_goods의 g_code와 일치하는 정보를 세팅하기 위한 메서드
     * @param gCode 상품코드
     * @return goods
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    private Goods getGoods(String gCode) throws SQLException, ClassNotFoundException {
        Goods goods = new Goods();
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        preparedStatement = connection.prepareStatement(
                "SELECT * FROM tb_goods WHERE g_code =? ");
        preparedStatement.setString(1, gCode);
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            goods = setParams(resultSet);
        }
        resultSet.close();
        preparedStatement.close();
        connection.close();
        return goods;
    }

    /**
     * ResultSet으로 불러온 값들을 Goods 클래스로 생성한 객체에 set하는 메서드
     * @param resultSet
     * @return
     * @throws SQLException
     */
    @Override
    public Goods setParams(ResultSet resultSet) throws SQLException {
        Goods goods = new Goods();
        goods.setgCode(resultSet.getString("g_code"));
        goods.setuId(resultSet.getString("u_id"));
        goods.setgName(resultSet.getString("g_name"));
        goods.setgCategory(resultSet.getString("g_cate"));
        goods.setgPrice(resultSet.getString("g_price"));
        goods.setgColor(resultSet.getString("g_color"));
        goods.setgSize(resultSet.getString("g_size"));
        goods.setgDate(resultSet.getString("g_date"));
        goods.setgDescription(resultSet.getString("g_desc"));
        return goods;
    }

    /**
     * tb_goods의 정보를 날짜를 기준으로 검색하는 메서드
     * @param startDate 시작 날짜 설정
     * @param endDate 끝 날짜 설정
     * @return List<Goods>
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public List<Goods> goodsSearchForDate(String startDate, String endDate) throws SQLException, ClassNotFoundException {
        List<Goods> goodsList = new ArrayList<>();
        String selectQuery1 = "select tb_user.*, tb_goods.* " +
                "from tb_user inner join tb_goods on tb_user.u_id = tb_goods.u_id  order by g_date";
        String selectQuery2="select tb_user.*, tb_goods.* " +
                "from tb_user inner join tb_goods on tb_user.u_id = tb_goods.u_id "+
                "and DATE_FORMAT(g_date,'%Y-%m-%d') between ? and ? " +
                "order by g_date";
        Goods goods;
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        if(startDate ==null && endDate ==null){
            preparedStatement = connection.prepareStatement(selectQuery1);
        } else if (startDate !=null && endDate !=null) {
            preparedStatement = connection.prepareStatement(selectQuery1);
        } else{
            preparedStatement = connection.prepareStatement(selectQuery2);
            preparedStatement.setString(1, startDate);
            preparedStatement.setString(2, endDate);
        }
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            goods = setParams(resultSet);
            goodsList.add(goods);
        }
        resultSet.close();
        preparedStatement.close();
        connection.close();
        return goodsList;
    }

    public List<Goods> goodsSearchForDateCategory(String startDate, String endDate, String category) throws SQLException, ClassNotFoundException {
        List<Goods> goodsList = new ArrayList<>();
        String selectQuery1 = "select tb_user.*, tb_goods.* " +
                "from tb_user inner join tb_goods on tb_user.u_id = tb_goods.u_id  order by g_date";
        String selectQuery2="select tb_user.*, tb_goods.* " +
                "from tb_user inner join tb_goods on tb_user.u_id = tb_goods.u_id "+
                "and DATE_FORMAT(g_date,'%Y-%m-%d') between ? and ? " +
                "WHERE tb_goods.g_cate =? " +
                "order by g_date";
        Goods goods;
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        if(startDate ==null && endDate ==null && category == null){
            preparedStatement = connection.prepareStatement(selectQuery1);
        } else if (startDate !=null && endDate !=null && category == "") {
            preparedStatement = connection.prepareStatement(selectQuery1);
        } else{
            preparedStatement = connection.prepareStatement(selectQuery2);
            preparedStatement.setString(1, startDate);
            preparedStatement.setString(2, endDate);
            preparedStatement.setString(3, category);
        }
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            goods = setParams(resultSet);
            goodsList.add(goods);
        }
        resultSet.close();
        preparedStatement.close();
        connection.close();
        return goodsList;
    }
}
