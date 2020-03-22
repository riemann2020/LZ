package org.lz.demo;

import org.lz.entity.User;
import org.lz.service.UserDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletDemo
 */
public class ServletDemo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ServletDemo() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 设置中文编码
        request.setCharacterEncoding("utf-8");// 1
        response.setContentType("text/html;charset=utf-8");// 2
        response.setCharacterEncoding("utf-8"); // 3

        // 根据请求action类型进行分别处理
        String action = request.getParameter("action");
        System.out.println("action->" + action);
        if ("login_input".equals(action)) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if ("login".equals(action)) {// 响应登录页面
            // 进行数据库操作
            // 复杂的数据操作应进行转发,使用另外的DAO类来实现
            // PrintWriter out = response.getWriter();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            // String docType = "<!DOCTYPE html> \n";
            // String title = "使用 POST 方法读取表单数据";
            // out.println(docType + "<html>\n" + "<head><title>" + title +
            // "</title></head>\n"
            // + "<body bgcolor=\"#f0f0f0\">\n" + "<h1 align=\"center\">" + title +
            // "</h1>\n" + "<ul>\n"
            // + " <li><b>Username</b>：" + username + "</li>\n" + " <li><b>Password</b>：" +
            // password + "</li>\n"
            // + "</ul>\n" + "</body></html>");
            // out.close();
            User usera = new User();
            usera.setUsername(username);
            usera.setPassword(password);
            System.out.println("username->" + usera.getUsername() + ",password->" + usera.getPassword());
            // 连接数据库
            UserDAO userDAO = new UserDAO();
            boolean result = userDAO.addUser(usera);
            if (result) {
                System.out.println("注册成功");
            } else {
                System.out.println("用户已存在");
            }
            // 转发到新页面showuserlist.jsp，显示用户列表
            List<User> userlist = userDAO.getUserlist();
            // 创建HttpSessio对象
            HttpSession hs = request.getSession();
            // 将值绑定在session会话中
            hs.setAttribute("userlist", userlist);
            // 重定向
            response.sendRedirect(request.getContextPath() + "/showuserlist.jsp");
            // request.setAttribute("userlist", userlist);// 存值
            // request.getRequestDispatcher("showuserlist.jsp").forward(request, response);
            // response.sendRedirect(request.getContextPath()+"/showuserlist.jsp");
        }
    }
}