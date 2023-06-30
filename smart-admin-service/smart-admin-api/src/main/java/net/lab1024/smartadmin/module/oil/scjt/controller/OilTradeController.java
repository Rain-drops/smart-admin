package net.lab1024.smartadmin.module.oil.scjt.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.lab1024.smartadmin.common.anno.NoNeedLogin;
import net.lab1024.smartadmin.common.controller.BaseController;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.TradeQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.*;
import net.lab1024.smartadmin.module.oil.scjt.service.TradeService;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;

/**
 * @author Jackie
 */
@RestController
@Api(tags = {"四川交投"})
@RequestMapping("/oil/trade")
public class OilTradeController extends BaseController {

    @Resource
    private TradeService tradeService;


    @ApiOperation(value = "匹配率(汇总)",notes = "@author 卓大")
    @PostMapping("/matchratio/query")
    public ResponseDTO<MatchRatioVO> queryMatchRatio(@RequestBody TradeQueryDTO queryDTO) {
        return tradeService.queryMatchRatio(queryDTO);
    }

    @ApiOperation(value = "进出站频率(日期-站点-车牌，汇总)",notes = "@author 卓大")
    @PostMapping("/inoutnum/page/query")
    public ResponseDTO<PageResultDTO<CarInOutNumVO>> getInOutNumByPage(@RequestBody TradeQueryDTO queryDTO) {
        return tradeService.getCarInOutNum(queryDTO);
    }

    @ApiOperation(value = "加油站车辆识别情况跟踪(日期-站点，汇总)",notes = "@author 卓大")
    @PostMapping("/matchtrack/page/query")
    public ResponseDTO<PageResultDTO<MatchTrackVO>> getMatchTrackByPage(@RequestBody TradeQueryDTO queryDTO) {
        return tradeService.queryMatchTrack(queryDTO);
    }

    @ApiOperation(value = "加油站油枪车辆识别情况跟踪(日期-站点-油枪，汇总)",notes = "@author 卓大")
    @PostMapping("/matchtrack/nozzleno/page/query")
    public ResponseDTO<PageResultDTO<MatchTrackVO>> getNozzleNoMatchTrackByPage(@RequestBody TradeQueryDTO queryDTO) {
        return tradeService.queryNozzleNoMatchTrack(queryDTO);
    }

    @ApiOperation(value = "车牌矫正，明细",notes = "@author 卓大")
    @PostMapping("/page/query")
    @NoNeedLogin
    public ResponseDTO<PageResultDTO<TradeVO>> queryByPage(@RequestBody TradeQueryDTO queryDTO) {
        return tradeService.queryByPage(queryDTO);
    }

    @ApiOperation(value = "车辆跟踪，明细",notes = "@author 卓大")
    @PostMapping("/cartrace/page/query")
    public ResponseDTO<PageResultDTO<CarTraceVO>> getCarTraceByPage(@RequestBody TradeQueryDTO queryDTO) {
        return tradeService.queryCarTraceByPage(queryDTO);
    }

    @ApiOperation(value = "车流走势(明细)",notes = "@author 卓大")
    @PostMapping("/cartraffic/page/query")
    public ResponseDTO<PageResultDTO<CarTrafficFlowVO>> getCarTrafficFlowByPage(@RequestBody TradeQueryDTO queryDTO) {
        if (null == queryDTO.getEndTime()){
            queryDTO.setStartTime(DateUtils.addDays(new Date(), -7));
            queryDTO.setEndTime(new Date());
        }else {
            queryDTO.setStartTime(DateUtils.addDays(queryDTO.getEndTime(), -7));
        }
        return tradeService.queryCarTrafficFlowByPage(queryDTO);
    }

    @ApiOperation(value = "车流走势Echarts(明细)",notes = "@author 卓大")
    @PostMapping("/cartraffic/chart/page/query")
    public ResponseDTO<Map<String, Object>> getCarTrafficFlowChart(@RequestBody TradeQueryDTO queryDTO) {
        if (null == queryDTO.getEndTime()){
            queryDTO.setStartTime(DateUtils.addMonths(new Date(), -6));
            queryDTO.setEndTime(new Date());
        }
        return tradeService.queryCarTrafficFlowChart(queryDTO);
    }

    @ApiOperation(value = "同环比，明细",notes = "@author 卓大")
    @PostMapping("/cargrowthanalyse/page/query")
    public ResponseDTO<PageResultDTO<CarGrowthAnalyseVO>> queryGrowthAnalyseByPage(@RequestBody TradeQueryDTO queryDTO) {
        if (null == queryDTO.getEndTime()){
            queryDTO.setStartTime(new Date());
            queryDTO.setEndTime(DateUtils.addDays(new Date(), 1));
        }else {
            queryDTO.setEndTime(DateUtils.addDays(queryDTO.getEndTime(), 1));
        }
        return tradeService.queryGrowthAnalyseByPage(queryDTO);
    }
}
