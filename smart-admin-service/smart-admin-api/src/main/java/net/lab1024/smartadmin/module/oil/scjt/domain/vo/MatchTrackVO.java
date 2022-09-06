package net.lab1024.smartadmin.module.oil.scjt.domain.vo;

import lombok.Data;

/**
 * @author Jackie
 */
@Data
public class MatchTrackVO {

    private Long id;
    private String stationCode;
    private String stationName;
    private String nozzleno;
    private Long totalDeal;
    private Long isMatch;
    private String matchRatio;
}
