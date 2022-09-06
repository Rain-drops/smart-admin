package net.lab1024.smartadmin.module.oil.scjt.domain.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import net.lab1024.smartadmin.common.domain.PageParamDTO;

import java.util.Date;
import java.util.List;

@Data
public class TradeQueryDTO extends PageParamDTO {
    private Long id;
    private String stationCode;
    private List<String> stationCodes;
    private String stationName;
    private List<String> stationNames;
    private String stationAreaName;
    private List<String> stationAreaNames;
    private String stationExpName;
    private List<String> stationExpNames;
    private String stationExpServiceArea;
    private List<String> stationExpServiceAreas;
    private String oilName;
    private List<String> oilNames;
    private String oilCode;
    private List<String> oilCodes;
    private String oilClass;
    private List<String> oilClasses;
    private String carNumber;
    private String billNo;
    private Integer nozzleNo;
    private Date startTime;
    private Date endTime;

    @ApiModelProperty(value = "出入频次")
    private Integer minFrequency;
    private Integer maxFrequency;
}
