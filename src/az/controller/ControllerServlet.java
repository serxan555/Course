package az.controller;


import az.config.StudentRepository;
import az.config.UserRepository;
import az.model.*;
import az.util.Algoritms;
import az.util.SendMail;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "ControllerServlet")
public class ControllerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = "";
        String addressJSP = "";
        StudentRepository studentRepository = new StudentRepository();
        UserRepository userRepository = new UserRepository();
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        try {
            if (action.equalsIgnoreCase("studentRegister")) {
                String name = request.getParameter("name");
                String surname = request.getParameter("surname");
                String parent = request.getParameter("parent");
                String birthdate = request.getParameter("birthdate");
                String phone = request.getParameter("phone");
                String gmail = request.getParameter("gmail");
                String gmailCode = request.getParameter("gmailCode");
                String sector = request.getParameter("sector");
                String gender = request.getParameter("genderAddStudent");
//                String[] langs = request.getParameterValues("langs");
                UUID uuid= UUID.randomUUID();
                String password = uuid.toString();
                password = password.substring(password.length()-10);

                Student student = new Student();
                student.setName(name);
                student.setSurname(surname);
                student.setParent(parent);
                student.setBirthdate(dateFormat.parse(birthdate));
                student.setPhone(phone);
                student.setGmail(gmail);
                student.setGmailCode(gmailCode);
                student.setGender(gender);
                student.setSectorId(Integer.parseInt(sector));
//                student.setUsername();
                student.setPassword(password);

                studentRepository.save(student);
                SendMail.sendMail(gmail,"Your account was successfully creater", "Your account code: " + password );
            } else if (action.equalsIgnoreCase("teacherRegister")) {
                String name = request.getParameter("name");
                String surname = request.getParameter("surname");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String birthdate = request.getParameter("datepickerForTeacher");
                String typeUserId = request.getParameter("typeUser");

                User user = new User();
                user.setName(name);
                user.setSurname(surname);
                user.setUsername(username);
                user.setPassword(Algoritms.Sha256(password));
                user.setEmail(email);
                user.setBirthdate(dateFormat.parse(birthdate));
                user.setTypeId(Integer.parseInt(typeUserId));

                userRepository.save(user);
            } else if (action.equalsIgnoreCase("getStudentList")) {
                List<Student> students = studentRepository.findAll();
                request.setAttribute("students", students);
                addressJSP = "WEB-INF/parts/part-student-table.jsp";
            } else if (action.equalsIgnoreCase("getTeacherList")) {
                List<User> users = userRepository.findAll();
                request.setAttribute("users", users);
                addressJSP = "WEB-INF/parts/part-teacher-table.jsp";
            } else if (action.equalsIgnoreCase("getSectorComboList")) {
                List<Sector> sectors = studentRepository.getSectorComboList();
                request.setAttribute("sectors", sectors);
                addressJSP = "WEB-INF/combo/part-sector-combo.jsp";
            } else if (action.equalsIgnoreCase("getGrupNameComboList")) {
                List<GroupName> groupNames = studentRepository.getGroupNameComboList();
                request.setAttribute("groupNames", groupNames);
                addressJSP = "WEB-INF/combo/part-groupName-combo.jsp";
            } else if (action.equalsIgnoreCase("getStudent")) {
                Student studentForId = new Student();
                studentForId.setId(Integer.parseInt(request.getParameter("studentId")));
                Student student = studentRepository.find(studentForId);
                request.setAttribute("student", student);
                addressJSP = "WEB-INF/parts/part-edit-student.jsp";
            } else if (action.equalsIgnoreCase("updateStudent")) {
                String studentId = request.getParameter("studentId");
                String name = request.getParameter("nameforUpdate");
                String surname = request.getParameter("surnameforUpdate");
                System.out.println(surname);
                String parent = request.getParameter("parentforUpdate");
                String birthdate = request.getParameter("birthdate");
                String phone = request.getParameter("phoneforUpdate");
                String gmail = request.getParameter("gmailforUpdate");
                String gmailCode = request.getParameter("gmailCodeforUpdate");
                String sector = request.getParameter("sector");
                String groupName = request.getParameter("groupname");
                String gender = request.getParameter("gender");

                Student student = new Student();
                student.setId(Integer.parseInt(studentId));
                student.setName(name);
                student.setSurname(surname);
                student.setParent(parent);
                student.setBirthdate(dateFormat.parse(birthdate));
                student.setPhone(phone);
                student.setGmail(gmail);
                student.setGmailCode(gmailCode);
                student.setGender(gender);
                student.setGroupNameId(Integer.parseInt(groupName));
                student.setSectorId(Integer.parseInt(sector));

                studentRepository.update(student);
            } else if (action.equalsIgnoreCase("deleteStudent")) {
                String studentId = request.getParameter("studentId");

                Student student = new Student();
                student.setId(Integer.parseInt(studentId));

                studentRepository.delete(student);
            } else if (action.equalsIgnoreCase("getStudentSearchComboList")) {
                int groupNameId = Integer.parseInt(request.getParameter("groupNameId"));
                List<Student> students = null;
                if (groupNameId == -1) {
                    students = studentRepository.findAll();
                } else {
                    students = studentRepository.findAllByGroupName(groupNameId);
                }
                request.setAttribute("studentCombo", students);
                addressJSP = "WEB-INF/combo/part-student-combo.jsp";
            } else if (action.equalsIgnoreCase("getStudentByAdvancedSearch")){
                int groupNameId = Integer.parseInt(request.getParameter("groupNameId"));
                int studentId = Integer.parseInt(request.getParameter("studentId"));
                List<Student> students = studentRepository.getStudentByAdvancedSearch(groupNameId, studentId);
                request.setAttribute("students", students);
                addressJSP = "WEB-INF/parts/part-student-table.jsp";
            } else if (action.equalsIgnoreCase("getTypeUser")){
                List<Type> types = userRepository.getUserTypes();
                request.setAttribute("type",types);
                addressJSP = "WEB-INF/combo/part-type-teacherCombo.jsp";
            } else if (action.equalsIgnoreCase("checkExistUser")){
                String username = request.getParameter("username");
                boolean exists = userRepository.checkExistUser(username);
                System.out.println(exists);
                request.setAttribute("exists",exists);
                addressJSP = "WEB-INF/parts/part-exists-username.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }


        RequestDispatcher dispatcher = request.getRequestDispatcher(addressJSP);
        dispatcher.forward(request, response);
    }

    @Override
    public void init() throws ServletException {
        System.out.println("Init");
    }

    @Override
    public void destroy() {
        System.out.println("Destroy");
    }
}
