package net.lab1024.smartadmin.module.oil.scjt.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.lab1024.smartadmin.common.controller.BaseController;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.StationInfoDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.StationQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.StationExcelVO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.StationLinkageMenuVO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.StationVO;
import net.lab1024.smartadmin.module.oil.scjt.service.StationService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Jackie
 */
@RestController
@Api(tags = {"四川交投"})
@RequestMapping("/oil/station")
public class OilStationController extends BaseController {

    @Resource
    private StationService stationService;

    @ApiOperation(value = "新增站点信息",notes = "@author 卓大")
    @PostMapping("/add")
    public ResponseDTO<PageResultDTO<StationVO>> addStation(@RequestBody StationInfoDTO stationDTO) {
        return stationService.add(stationDTO);
    }

    @ApiOperation(value = "分页查询站点信息",notes = "@author 卓大")
    @PostMapping("/page/query")
    public ResponseDTO<PageResultDTO<StationVO>> queryByPage(@RequestBody StationQueryDTO queryDTO) {
        return stationService.queryByPage(queryDTO);
    }

    @ApiOperation(value = "导出站点信息",notes = "@author 卓大")
    @PostMapping("/export/all")
    public void exportAll(@RequestBody StationQueryDTO queryDTO, HttpServletResponse response) {
        //查询数据
        queryDTO.setPageNum(1); queryDTO.setPageSize(500);
        ResponseDTO<PageResultDTO<StationVO>> stationVOList = stationService.queryByPage(queryDTO);
        //导出操作
        ExportParams ex = new ExportParams("站点信息", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, StationExcelVO.class, stationVOList.getData().getList());
        downloadExcel("站点信息", workbook, response);
    }

    @ApiOperation(value = "分页查询站点信息",notes = "@author 卓大")
    @PostMapping("/linkagemenu/query")
    public ResponseDTO<StationLinkageMenuVO> queryLinkageMenu(@RequestBody StationQueryDTO queryDTO) {
        return stationService.queryLinkageMenu();
    }

}
