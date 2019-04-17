package az.config;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB {
    public Connection connection;
    public PreparedStatement statement;
    public ResultSet resultSet;

    public  Connection connect() throws NamingException, SQLException {
        Context context = new InitialContext();
        DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/course");
        connection = dataSource.getConnection();
        if (connection!=null){
            System.out.println("***Conncetion Success***");
        }
        return connection;
    }

    public void disconnect() throws SQLException {
        if (connection!=null){
            connection.close();
        }
        if (statement!=null){
            statement.close();
        }
        if (resultSet!=null){
            resultSet.close();
        }
    }
}
