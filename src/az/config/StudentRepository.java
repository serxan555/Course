package az.config;

import az.model.GroupName;
import az.model.Sector;
import az.model.Student;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository extends DB implements Repository<Student>{

    @Override
    public Student find(Student o) {
        String query = "SELECT * FROM `555`.students left join sectors on sectorId = sectors.id left join groups on groupNameId = groups.id where students.id=? and status=1";
        Student student= new Student();
        try {
            connect();
            statement = connection.prepareStatement(query);
            statement.setLong(1, o.getId());
            resultSet = statement.executeQuery();
            if (resultSet.next()){
                student.setId(resultSet.getLong("id"));
                student.setName(resultSet.getString("name"));
                student.setSurname(resultSet.getString("surname"));
                student.setParent(resultSet.getString("parent"));
                student.setBirthdate(resultSet.getDate("birthDate"));
                student.setPhone(resultSet.getString("phone"));
                student.setGmail(resultSet.getString("gmail"));
                student.setGmailCode(resultSet.getString("gmailCode"));
                student.setGroupName(resultSet.getString("groupName"));
                student.setGroupNameId(resultSet.getInt("groupNameId"));
                student.setGender(resultSet.getString("gender"));
                student.setSectorName(resultSet.getString("sector"));
                student.setSectorId(resultSet.getLong("sectorId"));
            }
        }catch (Exception e){
            e.printStackTrace(System.err);
        }finally {
            try {
                disconnect();
            } catch (SQLException ex){
                ex.printStackTrace(System.err);
            }

        }
        return student;
    }

    @Override
    public List<Student> findAll()  {
        String query = "SELECT * FROM `555`.students left join sectors on students.sectorId = sectors.id left join groups on groupNameId = groups.id where status=1";
        List<Student> students = new ArrayList<Student>();
        try {
            connect();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                Student student= new Student();
                student.setId(resultSet.getLong("id"));
                student.setName(resultSet.getString("name"));
                student.setSurname(resultSet.getString("surname"));
                student.setParent(resultSet.getString("parent"));
                student.setBirthdate(resultSet.getDate("birthDate"));
                student.setPhone(resultSet.getString("phone"));
                student.setGmail(resultSet.getString("gmail"));
                student.setGmailCode(resultSet.getString("gmailCode"));
                student.setGroupName(resultSet.getString("groupName"));
                student.setSectorName(resultSet.getString("sector"));
                student.setGender(resultSet.getString("gender"));
                students.add(student);
            }
        }catch (Exception e){
            e.printStackTrace(System.err);
        }finally {
            try {
                disconnect();
            } catch (SQLException ex){
                ex.printStackTrace(System.err);
            }

        }
        return students;
    }

    @Override
    public void save(Student o) {
        String query = "insert into students (name,surname,parent,birthDate,phone,gmail,gmailCode,sectorId,gender,status) " +
                "values (?,?,?,?,?,?,?,?,?,1)";
        try {
            connect();
            statement = connection.prepareStatement(query);
            statement.setString(1, o.getName());
            statement.setString(2, o.getSurname());
            statement.setString(3, o.getParent());
            statement.setDate(4, new Date(o.getBirthdate().getTime()));
            statement.setString(5, o.getPhone());
            statement.setString(6, o.getGmail());
            statement.setString(7, o.getGmailCode());
            statement.setInt(8, (int) o.getSectorId());
            statement.setString(9, o.getGender());
            statement.execute();
        }catch (Exception e){
            e.printStackTrace(System.err);
        }finally {
            try {
                disconnect();
            }catch (Exception ex){
                ex.printStackTrace(System.err);
            }
        }
    }

    @Override
    public void update(Student o) {
        String query = "update students set name=?, surname=?, parent=?,birthDate=?,phone=?,gmail=?,gmailCode=?,gender=?,groupNameId=?,sectorId=? where id=?";
        try {
            connect();
            statement = connection.prepareStatement(query);
            statement.setString(1,o.getName());
            statement.setString(2,o.getSurname());
            statement.setString(3,o.getParent());
            statement.setDate(4,new Date(o.getBirthdate().getTime()));
            statement.setString(5, o.getPhone());
            statement.setString(6, o.getGmail());
            statement.setString(7, o.getGmailCode());
            statement.setString(8, o.getGender());
            statement.setLong(9, o.getGroupNameId());
            statement.setLong(10, o.getSectorId());
            statement.setLong(11, o.getId());
            statement.execute();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                disconnect();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    @Override
    public void delete(Student o) {
        String query = "update students set status=0 where id=?";
        try {
            connect();
            statement = connection.prepareStatement(query);
            statement.setLong(1, o.getId());
            statement.execute();
        }catch (Exception e){
            e.printStackTrace(System.err);
        } finally {
            try {
                disconnect();
            } catch (Exception ex){
                ex.printStackTrace(System.err);
            }
        }
    }

    public List<Sector> getSectorComboList() throws SQLException {
        String query = "select * from sectors";
        List<Sector> sectors = new ArrayList<>();
        try {
            connect();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                sectors.add(new Sector(resultSet.getLong("id"), resultSet.getString("sector")));
            }
        }catch (Exception e){
            e.printStackTrace(System.err);
        }finally {
            disconnect();
        }
        return sectors;
    }

    public List<GroupName> getGroupNameComboList() throws SQLException {
        String query = "select * from groups";
        List<GroupName> groupNames = new ArrayList<>();
        try {
            connect();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                groupNames.add(new GroupName(resultSet.getInt("id"), resultSet.getString("groupName")));
            }
        }catch (Exception e){
            e.printStackTrace(System.err);
        }finally {
            disconnect();
        }
        return groupNames;
    }

    public List<Student> findAllByGroupName(int groupNameId) throws SQLException {
        String query = "SELECT * FROM `555`.students inner join sectors on sectorId = sectors.id left join groups on groupNameId = groups.id where students.groupNameId=? and status=1";
        List<Student> students = new ArrayList<>();
        try {
            connect();
            statement = connection.prepareStatement(query);
            statement.setInt(1, groupNameId);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                Student student = new Student();
                student.setId(resultSet.getLong("id"));
                student.setName(resultSet.getString("name"));
                student.setSurname(resultSet.getString("surname"));
                student.setParent(resultSet.getString("parent"));
                student.setBirthdate(resultSet.getDate("birthDate"));
                student.setPhone(resultSet.getString("phone"));
                student.setGmail(resultSet.getString("gmail"));
                student.setGmailCode(resultSet.getString("gmailCode"));
                student.setGroupName(resultSet.getString("groupName"));
                student.setSectorName(resultSet.getString("sector"));
                student.setGender(resultSet.getString("gender"));
                students.add(student);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            disconnect();
        }
        return students;
    }

    public List<Student> getStudentByAdvancedSearch(int groupNameId, int studentId) throws SQLException {
        String query = "SELECT * FROM `555`.students inner join sectors on students.sectorId = sectors.id left join groups on groupNameId = groups.id where status=1";
        if (groupNameId != -1){
            query += " and groupNameId="+groupNameId;
        }
        if (studentId != -1){
            query += " and students.id="+studentId;
        }
        List<Student> students = new ArrayList<>();
        try {
            connect();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                Student student = new Student();
                student.setId(resultSet.getLong("id"));
                student.setName(resultSet.getString("name"));
                student.setSurname(resultSet.getString("surname"));
                student.setParent(resultSet.getString("parent"));
                student.setBirthdate(resultSet.getDate("birthDate"));
                student.setPhone(resultSet.getString("phone"));
                student.setGmail(resultSet.getString("gmail"));
                student.setGmailCode(resultSet.getString("gmailCode"));
                student.setGroupName(resultSet.getString("groupName"));
                student.setSectorName(resultSet.getString("sector"));
                student.setGender(resultSet.getString("gender"));
                students.add(student);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            disconnect();
        }
        return students;
    }
}
