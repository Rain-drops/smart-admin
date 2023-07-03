package net.lab1024.smartadmin;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.module.oil.scjt.dao.TradeDao;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.TradeQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.service.TradeService;
import net.lab1024.smartadmin.util.SmartPageUtil;
import org.apache.commons.lang3.time.DateUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.Date;

@RunWith(SpringRunner.class)
@ActiveProfiles("dev")
@SpringBootTest(classes = SmartAdminApplication.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class SmartAdminApplicationTests {

    @Resource
    private TradeService tradeService;

    @Resource
    private TradeDao tradeDao;

    @Test
    public void test(){
        TradeQueryDTO queryDTO = new TradeQueryDTO();
        queryDTO.setStartTime(DateUtils.addMonths(new Date(), -1));
        queryDTO.setEndTime(DateUtils.addDays(new Date(), 1));
        queryDTO.setStationAreaName("川南片区");
        queryDTO.setChartRadioType("1");
//        queryDTO.setChartRadioType("0");
//        queryDTO.setCarAttributionType("1");
         queryDTO.setCarAttributionType("2");
        // queryDTO.setCarAttributionType("3");

//        queryDTO.setTimeRadioType("1");
        queryDTO.setTimeRadioType("2");

        queryDTO.setGrowthAnalyseStationType("0");

        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        page.setSearchCount(false);

//        tradeDao.queryByPage(page, queryDTO);

//        tradeDao.queryMatchRatio(queryDTO);

//        tradeDao.getCarInOutNum(page, queryDTO);

//        tradeDao.queryCarTrafficFlowByPage(page, queryDTO);

//        tradeDao.queryMatchTrackByPage(page, queryDTO);

//        tradeDao.queryNozzleNoMatchTrackByPage(page, queryDTO);

//        tradeDao.queryCarTraceByPage(page, queryDTO);

//        tradeDao.queryCarTrafficFlowByPage(page, queryDTO);

//        tradeDao.queryCarTrafficFlowChart(queryDTO);

//        tradeDao.queryGrowthAnalyse(queryDTO);

        tradeDao.queryGrowthAnalyseByPage(page, queryDTO);
    }
}
