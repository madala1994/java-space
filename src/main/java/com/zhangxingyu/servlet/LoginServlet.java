package com.zhangxingyu.servlet;

import com.zhangxingyu.test.AesTest;
import com.zhangxingyu.utils.Aes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("username");
        String pwd = req.getParameter("password");
        String ti = req.getParameter("time");
        String nuser = Aes.aesDecrypt(user);
        String npwd = Aes.aesDecrypt(pwd);
//        String aa = Aes.aesDecrypt(ti);
//        System.out.println(aa);
        long ntime = Long.parseLong(Aes.aesDecrypt(ti));
        long time = new Date().getTime();
        long c = time - ntime;
        if (!nuser.equals("zhangsan") || !npwd.equals("123") || c > 10000) {
            resp.getWriter().print("fail");
        } else {
            resp.getWriter().print("success");
        }
    }
}
