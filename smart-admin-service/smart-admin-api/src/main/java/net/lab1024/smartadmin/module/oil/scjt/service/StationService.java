package net.lab1024.smartadmin.module.oil.scjt.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.oil.scjt.dao.StationDao;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.StationQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.entity.StationEntity;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.StationVO;
import net.lab1024.smartadmin.util.SmartPageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class StationService {

    @Resource
    private StationDao stationDao;

    public StationEntity getById(StationQueryDTO queryDTO){
        return stationDao.selectById(queryDTO.getId());
    }

    public ResponseDTO<PageResultDTO<StationVO>> queryByPage(StationQueryDTO queryDTO) {
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<StationVO> voList = stationDao.queryByPage(page, queryDTO);
        PageResultDTO<StationVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }
}
