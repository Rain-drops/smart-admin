package net.lab1024.smartadmin.module.oil.scjt.service;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
//import net.lab1024.smartadmin.config.DataSourceConfiguration;
import net.lab1024.smartadmin.module.oil.scjt.dao.TradeDao;
import net.lab1024.smartadmin.module.oil.scjt.domain.bo.CarGrowthAnalyseBO;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.TradeQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.*;
import net.lab1024.smartadmin.util.SmartPageUtil;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
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
        // 站 明细

        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        page.setSearchCount(false);
        IPage<CarInOutNumVO> voList = tradeDao.getCarInOutNum(page, queryDTO);
        voList.setTotal(10);
        PageResultDTO<CarInOutNumVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 明细
     * @param queryDTO
     * @return
     */
    public ResponseDTO<PageResultDTO<TradeVO>> queryByPage(TradeQueryDTO queryDTO) {
        // 站 明细
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<TradeVO> voList = tradeDao.queryByPage(page, queryDTO);
        PageResultDTO<TradeVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 匹配率
     * @param queryDTO
     * @return
     */
    public ResponseDTO<MatchRatioVO> queryMatchRatio(TradeQueryDTO queryDTO) {
        MatchRatioVO vo = tradeDao.queryMatchRatio(queryDTO);
        if (vo.getTotalDeal() > 0){
            vo.setMatchRatio(String.format("%.2f", vo.getIsMatch()*1D / vo.getTotalDeal()*1D * 100));
        }
        return ResponseDTO.succData(vo);
    }

    /**
     * 加油站车辆识别情况跟踪
     * @param queryDTO
     * @return
     */
    public ResponseDTO<PageResultDTO<MatchTrackVO>> queryMatchTrack(TradeQueryDTO queryDTO) {

        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        page.setSearchCount(false);
        Long total = tradeDao.queryMatchTrackByPageCount(queryDTO);
        IPage<MatchTrackVO> voList = tradeDao.queryMatchTrackByPage(page, queryDTO);
        voList.setTotal(total);
        PageResultDTO<MatchTrackVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 加油站车辆识别情况跟踪
     * @param queryDTO
     * @return
     */
    public ResponseDTO<PageResultDTO<MatchTrackVO>> queryNozzleNoMatchTrack(TradeQueryDTO queryDTO) {

        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        page.setSearchCount(false);
        Long total = tradeDao.queryNozzleNoMatchTrackByPageCount(queryDTO);
        IPage<MatchTrackVO> voList = tradeDao.queryNozzleNoMatchTrackByPage(page, queryDTO);
        voList.setTotal(total);
        PageResultDTO<MatchTrackVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 车辆跟踪
     * @param queryDTO
     * @return
     */
    public ResponseDTO<PageResultDTO<CarTraceVO>> queryCarTraceByPage(TradeQueryDTO queryDTO) {

        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<CarTraceVO> voList = tradeDao.queryCarTraceByPage(page, queryDTO);
        PageResultDTO<CarTraceVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 车流走势
     * @param queryDTO
     * @return
     */
    public ResponseDTO<PageResultDTO<CarTrafficFlowVO>> queryCarTrafficFlowByPage(TradeQueryDTO queryDTO) {

        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<CarTrafficFlowVO> voList = tradeDao.queryCarTrafficFlowByPage(page, queryDTO);

        PageResultDTO<CarTrafficFlowVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    public ResponseDTO<Map<String, Object>> queryCarTrafficFlowChart(TradeQueryDTO queryDTO) {

        HashMap<String, Object> resultData = new HashMap<>();

        List<CarTrafficFlowVO> voList = tradeDao.queryCarTrafficFlowChart(queryDTO);
        if (null == voList || voList.isEmpty()){
            return ResponseDTO.succData(resultData);
        }

        Map<String, Integer> collectTime = new HashMap<>();
        if (Objects.equals(queryDTO.getChartRadioType(), "1")){
            collectTime.putAll(voList.stream().collect(
                    Collectors.groupingBy(e -> e.getEndtime(), Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal())))));
        }
        Map<String, Integer> collectAttribute = new HashMap<>();
        if (Objects.equals(queryDTO.getChartRadioType(), "2")){
            collectAttribute.putAll(voList.stream().collect(
                    Collectors.groupingBy(e -> e.getCarnumber(), Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal())))));
        }

        resultData.put("tableData", voList);
        resultData.put("lineData", collectTime);
        resultData.put("barData", collectAttribute);

        return ResponseDTO.succData(resultData);
    }

    public ResponseDTO<PageResultDTO<CarGrowthAnalyseVO>> queryGrowthAnalyseByPage(TradeQueryDTO queryDTO) {

        Date startTime = queryDTO.getStartTime(), endTime = queryDTO.getEndTime();
        List<CarGrowthAnalyseBO> voListThisDay = new ArrayList<>();
        voListThisDay.addAll(tradeDao.queryGrowthAnalyse(queryDTO));

        Date startTimeMonth = DateUtils.addMonths(startTime, -1);
        Date endTimeMonth = DateUtils.addMonths(endTime, -1);
        queryDTO.setStartTime(startTimeMonth); queryDTO.setEndTime(endTimeMonth);
        List<CarGrowthAnalyseBO> voListMonthOnMonth = new ArrayList<>();
        voListMonthOnMonth.addAll(tradeDao.queryGrowthAnalyse(queryDTO));

        Date startTimeYear = DateUtils.addYears(startTime, -1);
        Date endTimeYear = DateUtils.addYears(endTime, -1);
        queryDTO.setStartTime(startTimeYear); queryDTO.setEndTime(endTimeYear);
        List<CarGrowthAnalyseBO> voListYearOnYear = new ArrayList<>();
        voListYearOnYear.addAll(tradeDao.queryGrowthAnalyse(queryDTO));

        ArrayList resultVO = new ArrayList<CarGrowthAnalyseVO>();


        Map<String, List<CarGrowthAnalyseBO>> collectThisDay = voListThisDay.stream().collect(
                Collectors.groupingBy(e -> e.getStationAreaName() + "_" + e.getStationExpName() + "_" + e.getStationExpServiceArea() + "_" + e.getStationCode()));
        Map<String, List<CarGrowthAnalyseBO>> collectMonthOnMonth = voListMonthOnMonth.stream().collect(
                Collectors.groupingBy(e -> e.getStationAreaName() + "_" + e.getStationExpName() + "_" + e.getStationExpServiceArea() + "_" + e.getStationCode()));
        Map<String, List<CarGrowthAnalyseBO>> collectYearOnYear = voListYearOnYear.stream().collect(
                Collectors.groupingBy(e -> e.getStationAreaName() + "_" + e.getStationExpName() + "_" + e.getStationExpServiceArea() + "_" + e.getStationCode()));

        for (String station : collectThisDay.keySet()){
            List<CarGrowthAnalyseBO> boList = collectThisDay.get(station);

            CarGrowthAnalyseVO vo = new CarGrowthAnalyseVO();
            CarGrowthAnalyseVO.CarGrowthAnalyseData thisDayData = new CarGrowthAnalyseVO.CarGrowthAnalyseData();
            CarGrowthAnalyseVO.CarGrowthAnalyseData monthOnMonthData = new CarGrowthAnalyseVO.CarGrowthAnalyseData();
            CarGrowthAnalyseVO.CarGrowthAnalyseData yearOnYearData = new CarGrowthAnalyseVO.CarGrowthAnalyseData();


            vo.setStationAreaName(boList.get(0).getStationAreaName());
            vo.setStationExpName(boList.get(0).getStationExpName());
            vo.setStationExpServiceArea(boList.get(0).getStationExpServiceArea());
            vo.setStationCode(boList.get(0).getStationCode());
            vo.setStationName(boList.get(0).getStationName());
            vo.setThisDayData(thisDayData);
            vo.setMonthOnMonthData(monthOnMonthData);
            vo.setYearOnYearData(yearOnYearData);
            resultVO.add(vo);


            if (null != boList && !boList.isEmpty()){
                Integer d_sum = boList.stream().collect(Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal())));
                Map<String, Integer> oil_class_sum = boList.stream().collect(Collectors.groupingBy(CarGrowthAnalyseBO::getOilclass, Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal()))));
                Map<String, Integer> oil_code_sum = boList.stream().collect(Collectors.groupingBy(CarGrowthAnalyseBO::getOilcode, Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal()))));

                thisDayData.setD_sum(d_sum);
                thisDayData.setQ_sum(oil_class_sum.get("汽油"));
                thisDayData.setC_sum(oil_class_sum.get("柴油"));
                thisDayData.setOil_92(oil_code_sum.get("92号"));
                thisDayData.setOil_95(oil_code_sum.get("95号"));
                thisDayData.setOil_98(oil_code_sum.get("98号"));
                thisDayData.setOil_0(oil_code_sum.get("0号"));
            }

            List<CarGrowthAnalyseBO> boListMonth = collectMonthOnMonth.get(station);
            if (null != boListMonth && !boListMonth.isEmpty()){
                Integer d_sum_month = boListMonth.stream().collect(Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal())));
                Map<String, Integer> oil_class_sum_month = boList.stream().collect(Collectors.groupingBy(CarGrowthAnalyseBO::getOilclass, Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal()))));
                Map<String, Integer> oil_code_sum_month = boList.stream().collect(Collectors.groupingBy(CarGrowthAnalyseBO::getOilcode, Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal()))));

                monthOnMonthData.setD_sum(d_sum_month);
                monthOnMonthData.setQ_sum(oil_class_sum_month.get("汽油"));
                monthOnMonthData.setC_sum(oil_class_sum_month.get("柴油"));
                monthOnMonthData.setOil_92(oil_code_sum_month.get("92号"));
                monthOnMonthData.setOil_95(oil_code_sum_month.get("95号"));
                monthOnMonthData.setOil_98(oil_code_sum_month.get("98号"));
                monthOnMonthData.setOil_0(oil_code_sum_month.get("0号"));
            }

            List<CarGrowthAnalyseBO> boListYear = collectYearOnYear.get(station);
            if (null != boListYear && !boListYear.isEmpty()){
                Integer d_sum_year = boListYear.stream().collect(Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal())));
                Map<String, Integer> oil_class_sum_year = boList.stream().collect(Collectors.groupingBy(CarGrowthAnalyseBO::getOilclass, Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal()))));
                Map<String, Integer> oil_code_sum_year = boList.stream().collect(Collectors.groupingBy(CarGrowthAnalyseBO::getOilcode, Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal()))));

                yearOnYearData.setD_sum(d_sum_year);
                yearOnYearData.setQ_sum(oil_class_sum_year.get("汽油"));
                yearOnYearData.setC_sum(oil_class_sum_year.get("柴油"));
                yearOnYearData.setOil_92(oil_code_sum_year.get("92号"));
                yearOnYearData.setOil_95(oil_code_sum_year.get("95号"));
                yearOnYearData.setOil_98(oil_code_sum_year.get("98号"));
                yearOnYearData.setOil_0(oil_code_sum_year.get("0号"));
            }
        }

        for (String station : collectMonthOnMonth.keySet()){
            List<CarGrowthAnalyseBO> boList = collectMonthOnMonth.get(station);
            if (null != collectThisDay.get(station) && !collectThisDay.get(station).isEmpty()){
                continue;
            }

            CarGrowthAnalyseVO vo = new CarGrowthAnalyseVO();
            CarGrowthAnalyseVO.CarGrowthAnalyseData thisDayData = new CarGrowthAnalyseVO.CarGrowthAnalyseData();
            CarGrowthAnalyseVO.CarGrowthAnalyseData monthOnMonthData = new CarGrowthAnalyseVO.CarGrowthAnalyseData();
            CarGrowthAnalyseVO.CarGrowthAnalyseData yearOnYearData = new CarGrowthAnalyseVO.CarGrowthAnalyseData();


            vo.setStationAreaName(boList.get(0).getStationAreaName());
            vo.setStationExpName(boList.get(0).getStationExpName());
            vo.setStationExpServiceArea(boList.get(0).getStationExpServiceArea());
            vo.setStationCode(boList.get(0).getStationCode());
            vo.setStationName(boList.get(0).getStationName());
            vo.setThisDayData(thisDayData);
            vo.setMonthOnMonthData(monthOnMonthData);
            vo.setYearOnYearData(yearOnYearData);
            resultVO.add(vo);


            List<CarGrowthAnalyseBO> boListMonth = collectMonthOnMonth.get(station);
            if (null != boListMonth && !boListMonth.isEmpty()){
                Integer d_sum_month = boListMonth.stream().collect(Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal())));
                Map<String, Integer> oil_class_sum_month = boListMonth.stream().collect(Collectors.groupingBy(CarGrowthAnalyseBO::getOilclass, Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal()))));
                Map<String, Integer> oil_code_sum_month = boListMonth.stream().collect(Collectors.groupingBy(CarGrowthAnalyseBO::getOilcode, Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal()))));

                monthOnMonthData.setD_sum(d_sum_month);
                monthOnMonthData.setQ_sum(oil_class_sum_month.get("汽油"));
                monthOnMonthData.setC_sum(oil_class_sum_month.get("柴油"));
                monthOnMonthData.setOil_92(oil_code_sum_month.get("92号"));
                monthOnMonthData.setOil_95(oil_code_sum_month.get("95号"));
                monthOnMonthData.setOil_98(oil_code_sum_month.get("98号"));
                monthOnMonthData.setOil_0(oil_code_sum_month.get("0号"));
            }

            List<CarGrowthAnalyseBO> boListYear = collectYearOnYear.get(station);
            if (null != boListYear && !boListYear.isEmpty()){
                Integer d_sum_year = boListYear.stream().collect(Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal())));
                Map<String, Integer> oil_class_sum_year = boListYear.stream().collect(Collectors.groupingBy(CarGrowthAnalyseBO::getOilclass, Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal()))));
                Map<String, Integer> oil_code_sum_year = boListYear.stream().collect(Collectors.groupingBy(CarGrowthAnalyseBO::getOilcode, Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal()))));

                yearOnYearData.setD_sum(d_sum_year);
                yearOnYearData.setQ_sum(oil_class_sum_year.get("汽油"));
                yearOnYearData.setC_sum(oil_class_sum_year.get("柴油"));
                yearOnYearData.setOil_92(oil_code_sum_year.get("92号"));
                yearOnYearData.setOil_95(oil_code_sum_year.get("95号"));
                yearOnYearData.setOil_98(oil_code_sum_year.get("98号"));
                yearOnYearData.setOil_0(oil_code_sum_year.get("0号"));
            }
        }

        for (String station : collectYearOnYear.keySet()){
            List<CarGrowthAnalyseBO> boList = collectYearOnYear.get(station);
            if (null != collectThisDay.get(station) && !collectThisDay.get(station).isEmpty()){
                continue;
            }
            if (null != collectMonthOnMonth.get(station) && !collectMonthOnMonth.get(station).isEmpty()){
                continue;
            }

            CarGrowthAnalyseVO vo = new CarGrowthAnalyseVO();
            CarGrowthAnalyseVO.CarGrowthAnalyseData thisDayData = new CarGrowthAnalyseVO.CarGrowthAnalyseData();
            CarGrowthAnalyseVO.CarGrowthAnalyseData monthOnMonthData = new CarGrowthAnalyseVO.CarGrowthAnalyseData();
            CarGrowthAnalyseVO.CarGrowthAnalyseData yearOnYearData = new CarGrowthAnalyseVO.CarGrowthAnalyseData();


            vo.setStationAreaName(boList.get(0).getStationAreaName());
            vo.setStationExpName(boList.get(0).getStationExpName());
            vo.setStationExpServiceArea(boList.get(0).getStationExpServiceArea());
            vo.setStationCode(boList.get(0).getStationCode());
            vo.setStationName(boList.get(0).getStationName());
            vo.setThisDayData(thisDayData);
            vo.setMonthOnMonthData(monthOnMonthData);
            vo.setYearOnYearData(yearOnYearData);
            resultVO.add(vo);

            List<CarGrowthAnalyseBO> boListYear = collectYearOnYear.get(station);
            if (null != boListYear && !boListYear.isEmpty()){
                Integer d_sum_year = boListYear.stream().collect(Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal())));
                Map<String, Integer> oil_class_sum_year = boListYear.stream().collect(Collectors.groupingBy(CarGrowthAnalyseBO::getOilclass, Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal()))));
                Map<String, Integer> oil_code_sum_year = boListYear.stream().collect(Collectors.groupingBy(CarGrowthAnalyseBO::getOilcode, Collectors.summingInt(e -> Integer.valueOf(e.getTotalDeal()))));

                yearOnYearData.setD_sum(d_sum_year);
                yearOnYearData.setQ_sum(oil_class_sum_year.get("汽油"));
                yearOnYearData.setC_sum(oil_class_sum_year.get("柴油"));
                yearOnYearData.setOil_92(oil_code_sum_year.get("92号"));
                yearOnYearData.setOil_95(oil_code_sum_year.get("95号"));
                yearOnYearData.setOil_98(oil_code_sum_year.get("98号"));
                yearOnYearData.setOil_0(oil_code_sum_year.get("0号"));
            }
        }



        return ResponseDTO.succData(SmartPageUtil.convert2PageResult(new Page<>().setRecords(resultVO)));
    }
}
