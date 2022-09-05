package net.lab1024.smartadmin.module.oil.scjt.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.lab1024.smartadmin.common.controller.BaseController;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.TradeQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.CarInOutNumVO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.MatchRatioVO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.MatchTrackVO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.TradeVO;
import net.lab1024.smartadmin.module.oil.scjt.service.TradeService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author Jackie
 */
@RestController
@Api(tags = {"四川交投"})
@RequestMapping("/oil/trade")
public class OilTradeController extends BaseController {

    @Resource
    private TradeService tradeService;

    @ApiOperation(value = "交易明细",notes = "@author 卓大")
    @PostMapping("/page/query")
    public ResponseDTO<PageResultDTO<TradeVO>> queryByPage(@RequestBody TradeQueryDTO queryDTO) {
        return tradeService.queryByPage(queryDTO);
    }

    @ApiOperation(value = "匹配率",notes = "@author 卓大")
    @PostMapping("/matchratio/query")
    public ResponseDTO<MatchRatioVO> queryMatchRatio(@RequestBody TradeQueryDTO queryDTO) {
        return tradeService.queryMatchRatio(queryDTO);
    }

    @ApiOperation(value = "进出站频率",notes = "@author 卓大")
    @PostMapping("/inoutnum/page/query")
    public ResponseDTO<PageResultDTO<CarInOutNumVO>> getInOutNumByPage(@RequestBody TradeQueryDTO queryDTO) {
        return tradeService.getCarInOutNum(queryDTO);
    }

    @ApiOperation(value = "加油站车辆识别情况跟踪",notes = "@author 卓大")
    @PostMapping("/matchtrack/page/query")
    public ResponseDTO<PageResultDTO<MatchTrackVO>> getMatchTrackByPage(@RequestBody TradeQueryDTO queryDTO) {
        return tradeService.queryMatchTrack(queryDTO);
    }
}
