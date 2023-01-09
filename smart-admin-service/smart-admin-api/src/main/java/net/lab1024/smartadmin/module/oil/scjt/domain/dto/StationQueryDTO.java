package net.lab1024.smartadmin.module.oil.scjt.domain.dto;

import lombok.Data;
import net.lab1024.smartadmin.common.domain.PageParamDTO;

@Data
public class StationQueryDTO extends PageParamDTO {
    private Long id;
    private String stationCode;
    private String stationName;
}
