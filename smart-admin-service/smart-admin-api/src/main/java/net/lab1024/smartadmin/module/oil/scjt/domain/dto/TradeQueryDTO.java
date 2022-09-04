package net.lab1024.smartadmin.module.oil.scjt.domain.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import net.lab1024.smartadmin.common.domain.PageParamDTO;

import java.util.Date;

@Data
public class TradeQueryDTO extends PageParamDTO {
    private Long id;
    private String stationCode;
    private String stationName;
    private String stationAreaName;
    private String stationExpName;
    private String stationExpServiceArea;
    private String oilName;
    private String oilCode;
    private String oilClass;
    private String carNumber;
    private String billNo;
    private Integer nozzleNo;
    private Date startTime;
    private Date endTime;

    @ApiModelProperty(value = "出入频次")
    private Integer minFrequency;
    private Integer maxFrequency;
}
