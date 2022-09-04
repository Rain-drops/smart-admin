package net.lab1024.smartadmin.module.oil.scjt.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import net.lab1024.smartadmin.common.domain.BaseEntity;

/**
 * @author Jackie
 */
@Data
@TableName("station_list")
public class StationEntity {

    @TableId(type = IdType.AUTO)
    private Long id;
    private String stationName;
    private String stationCode;
    private String stationStatus;
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
