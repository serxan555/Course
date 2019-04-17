package az.config;

import az.model.Type;
import az.model.User;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository extends DB implements Repository<User> {

    @Override
    public User find(User o) {
        return null;
    }

    @Override
    public List<User> findAll() {
        String query = "SELECT  DISTINCT user_name, userId,user_surname,username,password,birthDate, user_email , status, typeId  FROM `555`.users where not typeId = 6";
        List<User> users = new ArrayList<>();
        try {
            connect();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getLong("userId"));
                user.setName(resultSet.getString("user_name"));
                user.setSurname(resultSet.getString("user_surname"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setBirthdate(resultSet.getDate("birthdate"));
                user.setEmail(resultSet.getString("user_email"));
                user.setStatus(resultSet.getInt("status"));
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            try {
                disconnect();
            } catch (SQLException ex) {
                ex.printStackTrace(System.err);
            }
        }
        return users;
    }

    @Override
    public void save(User o) throws SQLException {
        String query = "insert into users (user_name, user_surname, username, password, birthdate, user_email, typeId, status) " +
                "values (?,?,?,?,?,?,?,1)";
        try {
            connect();
            statement = connection.prepareStatement(query);
            statement.setString(1, o.getName());
            statement.setString(2, o.getSurname());
            statement.setString(3, o.getUsername());
            statement.setString(4, o.getPassword());
            statement.setDate(5, new Date(o.getBirthdate().getTime()));
            statement.setString(6,o.getEmail());
            statement.setInt(7, o.getTypeId());
            statement.execute();
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            disconnect();
        }
    }

    @Override
    public void update(User o) {

    }

    @Override
    public void delete(User o) {

    }

    public User doLogin(String username, String password) throws SQLException {
        User user = null;
        String query = "select * from users left join `555`.types on users.typeId = types.id where username=? and password=? and status=1";
        try {
            connect();
            statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("userId"));
                user.setName(resultSet.getString("user_name"));
                user.setSurname(resultSet.getString("user_surname"));
                user.setUsername(resultSet.getString("username"));
                user.setBirthdate(resultSet.getDate("birthdate"));
                user.setEmail(resultSet.getString("user_email"));;
                user.setStatus(resultSet.getInt("status"));
                user.setTypeId(resultSet.getInt("typeId"));
                user.setTypeName(resultSet.getString("type"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }

        return user;
    }

    public List<Type> getUserTypes() throws SQLException {
        String query = "select * from types";
        List<Type> types = new ArrayList<>();
        try {
            connect();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                types.add(new Type(resultSet.getInt("id"), resultSet.getString("type")));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            disconnect();
        }
        return types;
    }

    public boolean checkExistUser(String u) throws SQLException {
        String query = "select count(*) count from users where status = 1 and username = '"+u+"'";
        try {
            connect();
            statement = connection.prepareStatement(query);
//            statement.setString(1, u);
            resultSet = statement.executeQuery();
            if (resultSet.next()){
                int c = resultSet.getInt("count");
                if (c == 0){
                    return true;
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            disconnect();
        }
        return false;
    }
}
