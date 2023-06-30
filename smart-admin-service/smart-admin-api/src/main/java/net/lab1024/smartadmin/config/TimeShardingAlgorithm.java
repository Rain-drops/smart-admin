package net.lab1024.smartadmin.config;

import com.google.common.collect.Range;
import org.apache.commons.lang.time.DateUtils;
import org.apache.shardingsphere.api.sharding.standard.PreciseShardingAlgorithm;
import org.apache.shardingsphere.api.sharding.standard.PreciseShardingValue;
import org.apache.shardingsphere.api.sharding.standard.RangeShardingAlgorithm;
import org.apache.shardingsphere.api.sharding.standard.RangeShardingValue;

import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

/**
 * 分片算法，按月分片
 * @author
 */
public class TimeShardingAlgorithm implements PreciseShardingAlgorithm<Date>, RangeShardingAlgorithm<Date> {

    /** 时间格式 */
    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyyMMdd");
    private static final SimpleDateFormat DATE_TIME_FORMAT = new SimpleDateFormat("yyyyMMdd");

    /** 需要空构造方法 */
    public TimeShardingAlgorithm() {
        System.out.println("-------------------------------");
    }

    /**
     * 精确分片
     * @param collection
     * @param preciseShardingValue
     * @return
     */
    @Override
    public String doSharding(Collection<String> collection, PreciseShardingValue<Date> preciseShardingValue) {
        System.out.println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
        return buildShardingTable(preciseShardingValue.getLogicTableName(), preciseShardingValue.getValue());
    }

    /**
     * 范围分片
     * @param collection
     * @param rangeShardingValue
     * @return
     */
//    @Override
//    public Collection<String> doSharding(Collection<String> collection, RangeShardingValue<String> rangeShardingValue) {
//        System.out.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
//        Range<String> valueRange = rangeShardingValue.getValueRange();
//        String lower = valueRange.lowerEndpoint();
//        String upper = valueRange.upperEndpoint();
//
//        LocalDate start = LocalDate.parse(lower, DATE_TIME_FORMATTER);
//        LocalDate end = LocalDate.parse(upper, DATE_TIME_FORMATTER);
//
//        Collection<String> tables = new ArrayList<>();
//        while (start.compareTo(end) <= 0) {
//            tables.add(buildShardingTable(rangeShardingValue.getLogicTableName(), start.format(DATE_TIME_FORMATTER)));
//            start = start.plusMonths(1L);
//        }
//
//        // collection配置的数据节点表，这里是排除不存在配置中的表
//        collection.retainAll(tables);
//        return collection;
//    }
    @Override
    public Collection<String> doSharding(Collection<String> collection, RangeShardingValue<Date> rangeShardingValue) {
        System.out.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
        Range<Date> valueRange = rangeShardingValue.getValueRange();
        Date start = valueRange.lowerEndpoint();
        Date end = valueRange.upperEndpoint();

        Collection<String> tables = new ArrayList<>();
        while (start.compareTo(end) <= 0) {
            tables.add(buildShardingTable(rangeShardingValue.getLogicTableName(), start));
            start = DateUtils.addMonths(start, 1);
        }

        // collection配置的数据节点表，这里是排除不存在配置中的表
        collection.retainAll(tables);
        return collection;
    }

    /**
     * 构建分片后的表名
     * @param logicTableName
     * @param date
     * @return
     */
    private String buildShardingTable(String logicTableName, Date date) {
        System.out.println(logicTableName + " ==== " + date);
        String dateStr = DATE_TIME_FORMAT.format(date);
        StringBuffer stringBuffer = new StringBuffer(logicTableName).append("_").append(dateStr, 0, 6);
        return stringBuffer.toString();
    }
}
