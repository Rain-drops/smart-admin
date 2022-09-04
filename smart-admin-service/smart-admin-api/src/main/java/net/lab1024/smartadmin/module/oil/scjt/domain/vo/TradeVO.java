package net.lab1024.smartadmin.module.oil.scjt.domain.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author Jackie
 */
@Data
public class TradeVO {

    private Integer id;
    private String stationAreaName;
    private String stationExpName;
    private String stationExpServiceArea;
    private String stationCode;
    private String stationName;
    private String carnumber;
    private String nozzleno;
    private String billno;
    private String oilclass;
    private String oilcode;
    private String oilname;
    private String meterialcode;
    private String volume;
    private String price;
    private String realamount;
    private String startread;
    private String endread;
    private String carbrand;
    private String subbrand;
    private String cartype;
    private String carcolor;
    private String carnumcolor;
    private String realcarbrand;
    private String realsubbrand;
    private String carnumberLoc;
    private String logId;
    private String picpath;
    private String starttime;
    private String endtime;
    private String updateTime;
}
