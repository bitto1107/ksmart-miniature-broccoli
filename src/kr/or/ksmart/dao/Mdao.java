package kr.or.ksmart.dao;

import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;

public class Mdao {
    PreparedStatement preparedStatement = null;
    Connection connection = null;
    ResultSet resultSet = null;

    /**
     * 사용자를 tb_user테이블에 입력하기 위한 메서드
     * @param member
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public void uInsert(Member member) throws SQLException, ClassNotFoundException {
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        out.printf("%s <= connection \n",  connection);
        out.println("1-1 Mdao.uInsert called");
        out.printf("%s <= member, %s <= connection \n", member, connection);
        preparedStatement = connection.prepareStatement(
                "INSERT INTO tb_user VALUES (?, ?, ?, ?, ?, ?, ?)");
        out.println(preparedStatement + "<-- preparedStatementTbUser Before setString");
        //insert into tb_member values('id001','pw001','관리자','홍01','email01');
        preparedStatement.setString(1, member.getuId());
        preparedStatement.setString(2, member.getuPw());
        preparedStatement.setInt(3, member.getuLevel());
        preparedStatement.setString(4, member.getuName());
        preparedStatement.setString(5, member.getuEmail());
        preparedStatement.setString(6, member.getuPhone());
        preparedStatement.setString(7, member.getuAddr());

        out.println(preparedStatement + "<-- preparedStatementTbUser After setString");

        //03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 끝
        //04단계 :Query실행 시작
        preparedStatement.executeUpdate();
        //04단계 :Query실행 끝
        //05단계 :Query실행결과 사용 (insert의 경우 생략 가능단계)
        preparedStatement.close();
        connection.close();
    }

    /**
     * tb_user의 사용자 정보를 수정하기 위해 아이디 1개를 받아오는 메서드
     * @param uId
     * @return member
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public Member uSelectForUpdate(String uId) throws SQLException, ClassNotFoundException {
        out.println("1-1 Mdao.uSelectforUpdate called");
        return getMember(uId);
    }

    /**
     * tb_user의 사용자 정보를 수정하기 위한 메서드
     * @param member Member클래스에서 setter를 통해 입력되었다
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public void uUpdate(Member member) throws SQLException, ClassNotFoundException {
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        out.printf("%s <= connection \n",  connection);
        out.println("1-1 Mdao.uUpdate called");
        out.printf("%s <= member, %s <= connection \n", member, connection);
        preparedStatement = connection.prepareStatement(
                "UPDATE tb_user SET u_pw=?, u_email=?, u_phone=?, u_addr=? WHERE u_id = ?");
        preparedStatement.setString(1, member.getuPw());
        preparedStatement.setString(2, member.getuEmail());
        preparedStatement.setString(3, member.getuPhone());
        preparedStatement.setString(4, member.getuAddr());
        preparedStatement.setString(5, member.getuId());

        int resultSetTbUser = preparedStatement.executeUpdate();
        out.printf("%s <= resultSetTbUser \n", resultSetTbUser);

        preparedStatement.close();
        connection.close();
    }

    /**
     * tb_user의 모든 리스트를 List<Member>형식으로 출력하는 메서드
     * @throws SQLException, ClassNotFoundException
     * @return List<Member>
     */
    public List<Member> uAllSelect() throws SQLException, ClassNotFoundException {
        out.println("uList() called");
        List<Member> userList = new ArrayList<>();
        Member member;
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        preparedStatement = connection.prepareStatement("select * from tb_user");
        resultSet = preparedStatement.executeQuery();


        while (resultSet.next()){
            member = setParams(resultSet);
            userList.add(member);
        }
        preparedStatement.close();
        resultSet.close();
        connection.close();
        return userList;
    }

    /**
     * tb_user의 사용자를 검색하기 위한 메서드
     * @param sk 검색 분류
     * @param srValue 검색어
     * @return List<Member>
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public List<Member> uSearch(String sk, String srValue) throws SQLException, ClassNotFoundException {
        List<Member> memberList = new ArrayList<>();
        Member member;
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        preparedStatement = connection.prepareStatement("select * from tb_user");
        if (sk == null && srValue == null) {
            System.out.printf("1. sk, sr_value null 조건\n");
            preparedStatement = connection.prepareStatement("select * from tb_user");
            // select * from tb_user;
        } else if (sk != null && srValue.equals("")) {
            System.out.printf("2. sk null이 아니고 srValue 공백\n");
            preparedStatement = connection.prepareStatement("select * from tb_user");
            // select * from tb_user;
        } else if (sk != null && srValue != null) {
            System.out.printf("3. sk, sr_value null이 아닌 조건\n");
            preparedStatement = connection.prepareStatement("select * from tb_user where " + sk + " = ?");
            preparedStatement.setString(1, srValue);
        }
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            member = setParams(resultSet);
            memberList.add(member);
        }
        resultSet.close();
        preparedStatement.close();
        connection.close();
        return memberList;
    }

    /**
     * id를 입력받아 tb_user에서 데이터를 삭제하는 메서드
     * @param sendId
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public void uDelete(String sendId) throws SQLException, ClassNotFoundException {
        out.println("1-1 Mdao.uDelete called");
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        out.printf("%s <= connection \n",  connection);
        preparedStatement = connection.prepareStatement(
                "DELETE FROM tb_user WHERE u_id =?");
        preparedStatement.setString(1, sendId);

        int resultSetTbUser = preparedStatement.executeUpdate();
        out.printf("%s <= resultSetTbUser \n", resultSetTbUser);

        preparedStatement.close();
        connection.close();
    }
    /**
     * Member클래스에 setting된 값을 인수로 받아 삭제하는 오버로딩 메서드
     * @param member
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public void uDelete(Member member) throws SQLException, ClassNotFoundException {
        out.println("1-1 Mdao.uDelete called");
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        out.printf("%s <= connection \n",  connection);
        preparedStatement = connection.prepareStatement(
                "DELETE FROM tb_user WHERE u_id =?");
        preparedStatement.setString(1, member.getuId());

        int resultSetTbUser = preparedStatement.executeUpdate();
        out.printf("%s <= resultSetTbUser \n", resultSetTbUser);

        preparedStatement.close();
        connection.close();
    }

    public String uLoginCheck(String inputId, String inputPw) throws SQLException, ClassNotFoundException {
        String msg;
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        out.printf("%s <= connection \n",  connection);
        preparedStatement = connection.prepareStatement("select * from tb_user where u_id =? and u_pw =?");
        preparedStatement.setString(1, inputId);
        preparedStatement.setString(2, inputPw);
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            msg = "success";
        } else {
            msg =  "fail";
        }

        resultSet.close();
        preparedStatement.close();
        connection.close();

        return msg;
    }

    /**
     * 로그인된 정보를 받아 세션의 아이디를 출력하는 메서드
     * @param inputId
     * @return getMember(String inputId)
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public Member uGetForSession(String inputId) throws SQLException, ClassNotFoundException {
        out.println("1-1 Mdao.uGetForSession called");
        return getMember(inputId);
    }

    /**
     * Member클래스의 새로운 객체 member를 생성하고 JDBC연결 과정 후 member에 값을 세팅하는 메서드
     * @param uId
     * @return member
     * @throws ClassNotFoundException
     * @throws SQLException
     */

    public Member getMember(String uId) throws ClassNotFoundException, SQLException {
        Member member = new Member();
        DriverDB driverDB = new DriverDB();
        connection = driverDB.driverDbconnection();
        out.printf("%s <= connection \n",  connection);
        preparedStatement = connection.prepareStatement(
                "select * from tb_user where u_id =?");
        preparedStatement.setString(1, uId);
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            member = setParams(resultSet);
        }
        resultSet.close();
        preparedStatement.close();
        connection.close();
        return member;
    }

    /**
     * Member클래스의 새로운 객체 member를 생성하고 7개의 정보를 받아와 set메서드로 세팅하고 member를 리턴하는 메서드
     * @param resultSet
     * @return member
     * @throws SQLException
     */

    public Member setParams(ResultSet resultSet) throws SQLException {
        Member member = new Member();
        member.setuId(resultSet.getString("u_id"));
        member.setuPw(resultSet.getString("u_pw"));
        member.setuLevel(resultSet.getInt("u_level"));
        member.setuName(resultSet.getString("u_name"));
        member.setuEmail(resultSet.getString("u_email"));
        member.setuPhone(resultSet.getString("u_phone"));
        member.setuAddr(resultSet.getString("u_addr"));
        return member;
    }
}
