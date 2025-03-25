<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2 align="center">EMP 테이블 조회</h2>
    <table border="1" align="center">
        <tr>
 			<td>사원번호</td>
			<td>사원명</td>
			<td>직급</td>
			<td>상관번호</td>
			<td>입사일자</td>
			<td>급여</td>
			<td>커미션</td>
			<td>부서번호</td>           
        </tr>
<%
    String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
    String user = "scott"; 
    String pwd = "tiger"; 

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, user, pwd);
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM emp");

        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("empno") %></td>
            <td><%= rs.getString("ename") %></td>
            <td><%= rs.getString("job") %></td>
            <td><%= rs.getString("mgr") %></td>
            <td><%= rs.getString("hiredate") %></td>
            <td><%= rs.getString("sal") %></td>
            <td><%= rs.getString("comm") %></td>
            <td><%= rs.getString("deptno") %></td>
        </tr>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(stmt != null) try { stmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>
    </table>
</body>
</html>