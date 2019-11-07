package beans;
import model.Dots;
import java.util.ArrayList;
import java.util.List;

public class History {
    private List<Dots> list;

    public History(){
        list = new ArrayList<Dots>();
    }

    public void addDot(Dots dot){
        list.add(dot);
    }

    public List<Dots> getList(){
        return list;
    }
}
