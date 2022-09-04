package net.lab1024.smartadmin.module.oil.scjt.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.StationQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.entity.StationEntity;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.StationVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/**
 * @author Jackie
 */
@Mapper
@Component
public interface StationDao extends BaseMapper<StationEntity> {

    /**
     * 分页查询
     * @param queryDTO
     * @return StationVO
     */
    IPage<StationVO> queryByPage(Page page, @Param("queryDTO") StationQueryDTO queryDTO);
}
