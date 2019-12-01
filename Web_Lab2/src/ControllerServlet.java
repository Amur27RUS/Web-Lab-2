import beans.History;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet ("/controller")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //Если истории нет, то мы создаём новую
        if(req.getSession().getAttribute("history")==null){
            req.getSession().setAttribute("history", new History());
        }

        //Принимаем значения X, Y, R
        Double Y = Double.parseDouble(req.getParameter("Y"));
        Double X = Double.parseDouble(req.getParameter("X"));
        Double R = Double.parseDouble(req.getParameter("R"));

        //Проверяем, чтобы значения не были пустыми
        if (X != null && Y != null && R !=null){

            //Перенаправляем на AreaCheckServlet
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/checkservlet");
            requestDispatcher.forward(req, resp);

            //Если значения пустые, то не перенаправляем, а остаёмся на той же странице
        }else{
            resp.sendRedirect("/Web_Lab2_war_exploded");
        }
    }
        @Override
        protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            doGet(req, resp);
        }

}
