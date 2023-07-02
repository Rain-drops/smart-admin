package net.lab1024.smartadmin;

import net.lab1024.smartadmin.module.oil.scjt.domain.dto.TradeQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.service.TradeService;
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

    @Test
    public void test(){

        tradeService.getCarInOutNum(new TradeQueryDTO());
    }
}
