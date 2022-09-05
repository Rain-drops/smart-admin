package net.lab1024.smartadmin.module.oil.scjt.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.lab1024.smartadmin.common.controller.BaseController;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.StationQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.StationLinkageMenuVO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.StationVO;
import net.lab1024.smartadmin.module.oil.scjt.service.StationService;
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
@RequestMapping("/oil/station")
public class OilStationController extends BaseController {

    @Resource
    private StationService stationService;

    @ApiOperation(value = "分页查询站点信息",notes = "@author 卓大")
    @PostMapping("/page/query")
    public ResponseDTO<PageResultDTO<StationVO>> queryByPage(@RequestBody StationQueryDTO queryDTO) {
        return stationService.queryByPage(queryDTO);
    }

    @ApiOperation(value = "分页查询站点信息",notes = "@author 卓大")
    @PostMapping("/linkagemenu/query")
    public ResponseDTO<StationLinkageMenuVO> queryLinkageMenu(@RequestBody StationQueryDTO queryDTO) {
        return stationService.queryLinkageMenu();
    }

}
