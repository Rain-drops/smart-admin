package net.lab1024.smartadmin.module.oil.scjt.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.oil.scjt.dao.StationDao;
import net.lab1024.smartadmin.module.oil.scjt.domain.dto.StationQueryDTO;
import net.lab1024.smartadmin.module.oil.scjt.domain.entity.StationEntity;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.StationLinkageMenuVO;
import net.lab1024.smartadmin.module.oil.scjt.domain.vo.StationVO;
import net.lab1024.smartadmin.util.SmartPageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

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

    public ResponseDTO<StationLinkageMenuVO> queryLinkageMenu() {
        StationLinkageMenuVO resultVo = new StationLinkageMenuVO();

        List<StationEntity> entityList = stationDao.selectList(null);

        List<StationLinkageMenuVO.MenuVo> l1 = entityList.stream().filter(distinctByKey(e -> e.getStationAreaName()))
                .map(e -> new StationLinkageMenuVO.MenuVo(e.getStationAreaName()))
                .collect(Collectors.toList());

        Map<String, List<StationLinkageMenuVO.MenuVo>> l2 = new HashMap<>();
        Map<String, List<StationLinkageMenuVO.MenuVo>> l3 = new HashMap<>();
        Map<String, List<StationLinkageMenuVO.MenuVo>> l4 = new HashMap<>();
        Map<String, List<StationEntity>> collect = null;
        collect = entityList.stream().filter(distinctByKey(e -> e.getStationExpName()))
                .collect(Collectors.groupingBy(StationEntity::getStationAreaName));
        for (String key : collect.keySet()){
            l2.put(key, collect.get(key).stream().map(e -> new StationLinkageMenuVO.MenuVo(e.getStationExpName())).collect(Collectors.toList()));
        }
        collect = entityList.stream().filter(distinctByKey(e -> e.getStationExpServiceArea()))
                .collect(Collectors.groupingBy(StationEntity::getStationExpName));
        for (String key : collect.keySet()){
            l3.put(key, collect.get(key).stream().map(e -> new StationLinkageMenuVO.MenuVo(e.getStationExpServiceArea())).collect(Collectors.toList()));
        }
        collect = entityList.stream().filter(distinctByKey(e -> e.getStationName()))
                .collect(Collectors.groupingBy(StationEntity::getStationExpServiceArea));
        for (String key : collect.keySet()){
            l4.put(key, collect.get(key).stream().map(e -> new StationLinkageMenuVO.MenuVo(e.getStationName())).collect(Collectors.toList()));
        }

        resultVo.setL1(l1);
        resultVo.setL2(l2);
        resultVo.setL3(l3);
        resultVo.setL4(l4);

        return ResponseDTO.succData(resultVo);
    }

    public static <T> Predicate<T> distinctByKey(Function<? super T, Object> keyExtractor) {
        Map<Object, Boolean> seen = new ConcurrentHashMap<>();
        return t -> seen.putIfAbsent(keyExtractor.apply(t), Boolean.TRUE) == null;
    }
}
