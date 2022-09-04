package net.lab1024.smartadmin.module.oil.scjt.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.StationQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.TradeQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.entity.StationEntity;
import net.lab1024.smartadmin.module.oil.scjt.domain.entity.TradeEntity;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.CarInOutNumVO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.MatchRatioVO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.StationVO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.TradeVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/**
 * @author Jackie
 */
@Mapper
@Component
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

}
