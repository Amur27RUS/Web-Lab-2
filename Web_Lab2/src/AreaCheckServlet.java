import beans.History;
import model.Dots;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;

@WebServlet(name = "checkservlet", urlPatterns = "/checkservlet")
public class AreaCheckServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        History history = (History) req.getSession().getAttribute("history");
        double X = Double.parseDouble(req.getParameter("X"));
        double y = Double.parseDouble(req.getParameter("Y"));
        double r = Double.parseDouble(req.getParameter("R"));
        int OFFSET = Integer.parseInt(req.getParameter("offset"));
        String Type = req.getParameter("Type");

        //Для запроса без AJAX
        if(Type.equalsIgnoreCase("noAjax")) {

            r = r*10000;
            r = (int) Math.round(r);
            double R = r /10000;

            y = y*10000;
            y = (int) Math.round(y);
            double Y = y /10000;


            Dots dot = new Dots(X, Y, R, OFFSET);
            history.addDot(dot);

            req.setAttribute("X", dot.getX());
            req.setAttribute("Y", dot.getY());
            req.setAttribute("R", dot.getR());
            req.setAttribute("RESULT", dot.isInArea());
            req.setAttribute("OFFSET", dot.getTime());
            req.getRequestDispatcher("/result.jsp").forward(req, resp);

        //Для AJAX запроса
        }else {
            Dots dot = new Dots(X, y, r, OFFSET);
            history.addDot(dot);
            resp.setContentType("text/json; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.write("{\"x\": " + dot.getX() + ", \"y\": " + dot.getY() + ", \"r\": " + dot.getR()
                    + ", \"inArea\": \"" + dot.isInArea() + "\", \"time\": \"" + dot.getTime() + "\"}");
        }




    }
}
