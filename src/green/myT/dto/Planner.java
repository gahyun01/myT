package green.myT.dto;

import java.time.*; 

public class Planner {
    // planner ( 플래너 )
    // +-------------+-------------+------+-----+---------+----------------+
    // | Field       | Type        | Null | Key | Default | Extra          |
    // +-------------+-------------+------+-----+---------+----------------+
    // | plan_no     | int(11)     | NO   | PRI | NULL    | auto_increment |
    // | user_id     | varchar(15) | NO   | MUL | NULL    |                |
    // | plan_name   | varchar(30) | NO   |     | NULL    |                |
    // | plan_public | int(11)     | NO   |     | NULL    |                |
    // +-------------+-------------+------+-----+---------+----------------+

    // plan_detail ( 요일별 플랜 )
    // +-----------+------------+------+-----+---------+----------------+
    // | Field     | Type       | Null | Key | Default | Extra          |
    // +-----------+------------+------+-----+---------+----------------+
    // | pdet_no   | int(11)    | NO   | PRI | NULL    | auto_increment |
    // | plan_no   | int(11)    | NO   | MUL | NULL    |                |
    // | pdet_day  | date       | NO   |     | NULL    |                |
    // | cl_no     | varchar(1) | YES  |     | NULL    |                |
    // | in_no     | int(11)    | YES  |     | NULL    |                |
    // | pdet_text | text       | YES  |     | NULL    |                |
    // +-----------+------------+------+-----+---------+----------------+

    private int plan_no;
    private String user_id;
    private String plan_name;
    private int plan_public;
    private int pdet_no;
    private LocalDate pdet_day;
    private char cl_no;
    private int in_no;
    private String pdet_text;

    public int getPlan_no() {
        return plan_no;
    }

    public void setPlan_no(int plan_no) {
        this.plan_no = plan_no;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getPlan_name() {
        return plan_name;
    }

    public void setPlan_name(String plan_name) {
        this.plan_name = plan_name;
    }

    public int getPlan_public() {
        return plan_public;
    }

    public void setPlan_public(int plan_public) {
        this.plan_public = plan_public;
    }

    public int getPdet_no() {
        return pdet_no;
    }

    public void setPdet_no(int pdet_no) {
        this.pdet_no = pdet_no;
    }

    public LocalDate getPdet_day() {
        return pdet_day;
    }

    public void setPdet_day(LocalDate pdet_day) {
        this.pdet_day = pdet_day;
    }

    public char getCl_no() {
        return cl_no;
    }

    public void setCl_no(char cl_no) {
        this.cl_no = cl_no;
    }

    public int getIn_no() {
        return in_no;
    }

    public void setIn_no(int in_no) {
        this.in_no = in_no;
    }

    public String getPdet_text() {
        return pdet_text;
    }

    public void setPdet_text(String pdet_text) {
        this.pdet_text = pdet_text;
    }
}
