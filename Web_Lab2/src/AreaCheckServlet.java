import beans.History;
import model.Dots;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "checkservlet", urlPatterns = "/checkservlet")
public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        History history = (History) req.getSession().getAttribute("history");
        double X = Double.parseDouble(req.getParameter("X"));
        double Y = Double.parseDouble(req.getParameter("Y"));
        double R = Double.parseDouble(req.getParameter("R"));
        int OFFSET = Integer.parseInt(req.getParameter("offset"));

        Dots dot = new Dots(X, Y, R, OFFSET);
        history.addDot(dot);

            req.setAttribute("X", dot.getX());
            req.setAttribute("Y", dot.getY());
            req.setAttribute("R", dot.getR());
            req.setAttribute("RESULT", dot.isInArea());
            req.setAttribute("OFFSET", dot.getTime());
            req.getRequestDispatcher("/result.jsp").forward(req, resp);

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
