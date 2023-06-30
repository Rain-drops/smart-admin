package net.lab1024.smartadmin.module.oil.scjt.dao;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.module.oil.scjt.domain.bo.CarGrowthAnalyseBO;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.TradeQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.entity.TradeEntity;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author Jackie
 */
@Mapper
@Component
@DS("sharding-fullingdb")
public interface TradeDao extends BaseMapper<TradeEntity> {

    /**
     * 分页查询
     * @param page
     * @param queryDTO
     * @return StationVO
     */
    IPage<CarInOutNumVO> getCarInOutNum(Page page, @Param("queryDTO") TradeQueryDTO queryDTO);

    /**
     * 明细查询
     * @param page
     * @param queryDTO
     * @return
     */
    IPage<TradeVO> queryByPage(Page page, @Param("queryDTO") TradeQueryDTO queryDTO);

    /**
     * 匹配率
     * @param queryDTO
     * @return
     */
    MatchRatioVO queryMatchRatio(@Param("queryDTO") TradeQueryDTO queryDTO);

    /**
     * 加油站车辆识别情况跟踪
     * @param page
     * @param queryDTO
     * @return
     */
    IPage<MatchTrackVO> queryMatchTrackByPage(Page page, @Param("queryDTO") TradeQueryDTO queryDTO);

    /**
     * 加油站油枪车辆识别情况跟踪
     * @param page
     * @param queryDTO
     * @return
     */
    IPage<MatchTrackVO> queryNozzleNoMatchTrackByPage(Page page, @Param("queryDTO") TradeQueryDTO queryDTO);

    /**
     * 车牌跟踪
     * @param page
     * @param queryDTO
     * @return
     */
    IPage<CarTraceVO> queryCarTraceByPage(Page page, @Param("queryDTO") TradeQueryDTO queryDTO);

    /**
     * 车流走势
     * @param page
     * @param queryDTO
     * @return
     */
    IPage<CarTrafficFlowVO> queryCarTrafficFlowByPage(Page page, @Param("queryDTO") TradeQueryDTO queryDTO);

    List<CarTrafficFlowVO> queryCarTrafficFlowChart(@Param("queryDTO") TradeQueryDTO queryDTO);
    /**
     * 同环比
     * @param queryDTO
     * @return
     */
    List<CarGrowthAnalyseBO> queryGrowthAnalyse(@Param("queryDTO") TradeQueryDTO queryDTO);
    IPage<CarGrowthAnalyseBO> queryGrowthAnalyseByPage(Page page, @Param("queryDTO") TradeQueryDTO queryDTO);

}
