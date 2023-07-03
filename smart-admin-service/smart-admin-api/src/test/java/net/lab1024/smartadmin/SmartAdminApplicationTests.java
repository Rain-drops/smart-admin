package net.lab1024.smartadmin;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.module.oil.scjt.dao.TradeDao;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.TradeQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.service.TradeService;
import net.lab1024.smartadmin.util.SmartPageUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

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
        queryDTO.setStationAreaName("川");
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        page.setSearchCount(false);
        tradeDao.queryCarTraceByPage(page, queryDTO);
    }
}
