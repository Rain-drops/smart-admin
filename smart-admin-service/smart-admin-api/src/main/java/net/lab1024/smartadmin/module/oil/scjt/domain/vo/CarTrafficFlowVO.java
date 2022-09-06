package net.lab1024.smartadmin.module.oil.scjt.domain.vo;

import lombok.Data;

/**
 * @author Jackie
 */
@Data
public class CarTrafficFlowVO {

    private Integer id;
    private String province;
    private String city;
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
    private String starttime;
    private String endtime;
    private String paytime;
}
