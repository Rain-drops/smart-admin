package net.lab1024.smartadmin.module.oil.scjt.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 *  [ 牡丹花 ]
 *
 * @author 卓大
 * @version 1.0
 * @company 1024创新实验室( www.1024lab.net )
 * @copyright (c) 1024创新实验室( www.1024lab.net )Inc. All rights reserved.
 * @date  2020-04-06 18:17:56
 * @since JDK1.8
 */
@Data
public class StationVO {
    private Long id;
    private String stationName;
    private String stationStatus;
    private String stationCode;
    private String stationIp;
    private String splateIp;
    private String nvrIp;
    private String sysUser;
    private String sysPwd;
    private String content;
    private String longitude;
    private String latitude;
    private String stationAreaName;
    private String stationExpName;
    private String stationExpServiceArea;
}
