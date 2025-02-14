package net.lab1024.smartadmin.module.oil.scjt.domain.vo;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

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
public class StationExcelVO {
    @Excel(name = "站点名称")
    private String stationName;
    @Excel(name = "站点编码")
    private String stationCode;
    @Excel(name = "站点状态")
    private String stationStatus;
    @Excel(name = "IP")
    private String stationIp;
    @Excel(name = "片区")
    private String stationAreaName;
    @Excel(name = "高速路")
    private String stationExpName;
    @Excel(name = "服务器")
    private String stationExpServiceArea;
}
