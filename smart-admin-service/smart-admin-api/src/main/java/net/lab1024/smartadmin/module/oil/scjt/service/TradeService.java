package net.lab1024.smartadmin.module.oil.scjt.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.oil.scjt.dao.StationDao;
import net.lab1024.smartadmin.module.oil.scjt.dao.TradeDao;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.StationQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.TradeQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.entity.StationEntity;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.CarInOutNumVO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.MatchRatioVO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.StationVO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.TradeVO;
import net.lab1024.smartadmin.util.SmartPageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class TradeService {

    @Resource
    private TradeDao tradeDao;

    /**
     * 出入站频次
     * @param queryDTO
     * @return
     */
    public ResponseDTO<PageResultDTO<CarInOutNumVO>> getCarInOutNum(TradeQueryDTO queryDTO) {
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<CarInOutNumVO> voList = tradeDao.getCarInOutNum(page, queryDTO);
        PageResultDTO<CarInOutNumVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    public ResponseDTO<PageResultDTO<TradeVO>> queryByPage(TradeQueryDTO queryDTO) {
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<TradeVO> voList = tradeDao.queryByPage(page, queryDTO);
        PageResultDTO<TradeVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    public ResponseDTO<MatchRatioVO> queryMatchRatio(TradeQueryDTO queryDTO) {
        MatchRatioVO vo = tradeDao.queryMatchRatio(queryDTO);
        if (vo.getTotalDeal() > 0){
            vo.setMatchRatio(String.format("%.2f", vo.getIsMatch()*1D / vo.getTotalDeal()*1D * 100));
        }
        return ResponseDTO.succData(vo);
    }
}
