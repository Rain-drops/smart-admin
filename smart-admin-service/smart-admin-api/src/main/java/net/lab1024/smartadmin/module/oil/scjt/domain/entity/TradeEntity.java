package net.lab1024.smartadmin.module.oil.scjt.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author Jackie
 */
@Data
@TableName("bus_tradelog")
public class TradeEntity {

    @TableId(type = IdType.AUTO)
    private Integer id;
    private String nozzleno;
    private String meterialcode;
    private String volume;
    private String realamount;
    private String price;
    private String starttime;
    private String starttimesct;
    private String start_date;
    private String endtimesct;
    private String end_date;
    private String startread;
    private String endread;
    private String carnumber;
    private String carbrand;
    private String subbrand;
    private String cartype;
    private String carcolor;
    private String carnumcolor;
    private String realcarbrand;
    private String realsubbrand;
    private String oilname;
    private String oilcode;
    private String oilclass;
    private String station_code;
    private String station_name;
    private String update_time;
    private String upload;
    private String log_id;
    private String picpath;
    private String carnumber_loc;
    private String station_exp_name;
    private String station_exp_service_area;
    private String station_area_name;
    private String ismatch;
    private String billno;
}
