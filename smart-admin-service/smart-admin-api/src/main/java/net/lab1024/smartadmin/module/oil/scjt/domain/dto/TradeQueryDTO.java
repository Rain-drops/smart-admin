package net.lab1024.smartadmin.module.oil.scjt.domain.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import net.lab1024.smartadmin.common.domain.PageParamDTO;

import java.beans.Transient;
import java.util.Date;
import java.util.List;

@Data
public class TradeQueryDTO extends PageParamDTO {
    private Long id;

    private transient String tableName;
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
    private String chartRadioType;
    private String timeRadioType;
    private String carAttributionType;
    private String carNumber;
    private String billNo;
    private Integer nozzleNo;
    private Date startTime;
    private Date endTime;
    /** 0 同比，1 环比 */
    private String growthAnalyseDataType;
    /** 0 片区-站组 分组，1 片区-站点 分组 */
    private String growthAnalyseStationType;
    /** 1 跳过停业站， 0 不跳过 */
    private String skipStopStation;


    @ApiModelProperty(value = "出入频次")
    private Integer minFrequency;
    private Integer maxFrequency;
}
