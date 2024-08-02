package green.myT.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.sql.DataSource;
import green.myT.dto.TravPl;
import green.myT.dto.Planner;
import green.myT.db.JdbcUtil;

public class MainPlanner {
    DataSource ds;
    Connection con;

    private MainPlanner() {
    }

    public static MainPlanner getInstance() {
        return new MainPlanner();
    }

    public void setConnection(Connection con) {
        this.con = con;
    }

    public int getListCount() {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int listCount = 0;

        try {
            // trv_log 테이블의 행의 개수를 가져옵니다.
            String sql = "SELECT COUNT(*) FROM trv_log";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            // 결과셋의 첫 번째 행의 값을 가져옵니다.
            if (rs.next()) {
                listCount = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }

        return listCount;
    }

    // 플래너 리스트를 가져오는 메소드
    public ArrayList<Planner> getAllPlans() {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Planner> plans = new ArrayList<>();
    
        try {
            String sql = "SELECT * FROM plan";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
    
            while (rs.next()) {
                Planner plan = new Planner();
                plan.setPlan_no(rs.getInt("plan_no"));
                plan.setUser_id(rs.getString("user_id"));
                plan.setPlan_name(rs.getString("plan_name"));
                plan.setPlan_public(rs.getInt("plan_public"));
                plans.add(plan);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    
        return plans;
    }

    
    // 가져온 플래너 리스트를 기준으로 플랜 번호에 해당하는 데이터를 가져오는 메소드
    public ArrayList<TravPl> getAllListByPlanNo(int planNo) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<TravPl> pMainList = new ArrayList<>();
    
        try {
            // trv_log와 trv_photo 테이블을 trv_no를 기준으로 INNER JOIN하여 데이터를 가져옵니다.
            // 추가로 plan_no를 조건으로 지정하여 해당 플랜 번호와 일치하는 데이터만 가져옵니다.
            String sql = "SELECT tl.trv_no, tl.plan_no, tl.trv_time, tl.is_public, tp.ex_no, tp.in_detail, tp.in_image " +
                         "FROM trv_log tl " +
                         "INNER JOIN trv_photo tp ON tl.trv_no = tp.trv_no " +
                         "WHERE tl.plan_no = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, planNo);
            rs = pstmt.executeQuery();
    
            // 결과셋을 순회하며 pList 객체를 생성하고 리스트에 추가합니다.
            while (rs.next()) {
                TravPl pList = new TravPl();
                pList.setTrv_no(rs.getInt("trv_no"));
                pList.setPlan_no(rs.getInt("plan_no"));
                pList.setTrv_time(rs.getTimestamp("trv_time").toLocalDateTime());
                pList.setIs_public(rs.getString("is_public").charAt(0));
                pList.setEx_no(rs.getInt("ex_no"));
                pList.setIn_image(rs.getString("in_image"));
                pMainList.add(pList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    
        return pMainList;
    }

    
}
