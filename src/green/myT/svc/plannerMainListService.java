package green.myT.svc;

import static green.myT.db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import green.myT.dto.TravPl;
import green.myT.dto.Planner;
import green.myT.dao.MainPlanner;

public class plannerMainListService {

    public int getListCount() throws Exception{
        int listCount = 0;
        Connection con = getConnection();
        MainPlanner mainPlanner = MainPlanner.getInstance();
        mainPlanner.setConnection(con);
        listCount = mainPlanner.getListCount();
        close(con);
        return listCount;
    }
    
    public ArrayList<PlannerMainList> getPlannerMainList(int page, int limit) throws Exception {
        ArrayList<PlannerMainList> plannerMainList = new ArrayList<PlannerMainList>();
        Connection con = getConnection();
        MainPlanner mainPlanner = MainPlanner.getInstance();
        mainPlanner.setConnection(con);
        plannerMainList = mainPlanner.getAllList();
        close(con);
        return plannerMainList;
    }
}