package green.myT.dto;

import java.time.*; 

public class TravPl {
    // trv_log ( 기행문 )
    // +-----------+----------+------+-----+---------+----------------+
    // | Field     | Type     | Null | Key | Default | Extra          |
    // +-----------+----------+------+-----+---------+----------------+
    // | trv_no    | int(11)  | NO   | PRI | NULL    | auto_increment |
    // | plan_no   | int(11)  | NO   | MUL | NULL    |                |
    // | trv_time  | datetime | NO   |     | NULL    |                |
    // | is_public | char(1)  | NO   |     | NULL    |                |
    // +-----------+----------+------+-----+---------+----------------+

    // trv_photo ( 사진 )
    // +----------+--------------+------+-----+---------+----------------+
    // | Field    | Type         | Null | Key | Default | Extra          |
    // +----------+--------------+------+-----+---------+----------------+
    // | ex_no    | int(11)      | NO   | PRI | NULL    | auto_increment |
    // | trv_no   | int(11)      | NO   |     | NULL    |                |
    // | in_image | varchar(255) | YES  |     | NULL    |                |
    // +----------+--------------+------+-----+---------+----------------+

    // heart ( 하트 )
    // +----------+-------------+------+-----+---------+----------------+
    // | Field    | Type        | Null | Key | Default | Extra          |
    // +----------+-------------+------+-----+---------+----------------+
    // | heart_no | int(11)     | NO   | PRI | NULL    | auto_increment |
    // | trv_no   | int(11)     | NO   |     | NULL    |                |
    // | user_id  | varchar(15) | NO   |     | NULL    |                |
    // +----------+-------------+------+-----+---------+----------------+

    // share ( 공유 )
    // +----------+-------------+------+-----+---------+----------------+
    // | Field    | Type        | Null | Key | Default | Extra          |
    // +----------+-------------+------+-----+---------+----------------+
    // | share_no | int(11)     | NO   | PRI | NULL    | auto_increment |
    // | trv_no   | int(11)     | NO   |     | NULL    |                |
    // | user_id  | varchar(15) | NO   |     | NULL    |                |
    // +----------+-------------+------+-----+---------+----------------+

    // script ( 스크립트 )
    // +-----------+-------------+------+-----+---------+----------------+
    // | Field     | Type        | Null | Key | Default | Extra          |
    // +-----------+-------------+------+-----+---------+----------------+
    // | script_no | int(11)     | NO   | PRI | NULL    | auto_increment |
    // | trv_no    | int(11)     | NO   |     | NULL    |                |
    // | user_id   | varchar(15) | NO   |     | NULL    |                |
    // +-----------+-------------+------+-----+---------+----------------+

    private int trv_no;
    private int plan_no;
    private LocalDateTime trv_time;
    private char is_public;
    private int ex_no;
    private String in_image;
    private int heart_no;
    private int share_no;
    private int script_no;
    private String user_id;

    public int getTrv_no() {
        return trv_no;
    }

    public void setTrv_no(int trv_no) {
        this.trv_no = trv_no;
    }

    public int getPlan_no() {
        return plan_no;
    }

    public void setPlan_no(int plan_no) {
        this.plan_no = plan_no;
    }

    public LocalDateTime getTrv_time() {
        return trv_time;
    }

    public void setTrv_time(LocalDateTime trv_time) {
        this.trv_time = trv_time;
    }

    public char getIs_public() {
        return is_public;
    }

    public void setIs_public(char is_public) {
        this.is_public = is_public;
    }

    public int getEx_no() {
        return ex_no;
    }

    public void setEx_no(int ex_no) {
        this.ex_no = ex_no;
    }

    public String getIn_image() {
        return in_image;
    }

    public void setIn_image(String in_image) {
        this.in_image = in_image;
    }

    public int getHeart_no() {
        return heart_no;
    }

    public void setHeart_no(int heart_no) {
        this.heart_no = heart_no;
    }

    public int getShare_no() {
        return share_no;
    }

    public void setShare_no(int share_no) {
        this.share_no = share_no;
    }

    public int getScript_no() {
        return script_no;
    }

    public void setScript_no(int script_no) {
        this.script_no = script_no;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
}
