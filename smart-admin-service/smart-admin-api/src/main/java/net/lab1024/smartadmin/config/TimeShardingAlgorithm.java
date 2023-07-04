package net.lab1024.smartadmin.config;

import cn.hutool.core.date.DateUtil;
import com.google.common.collect.Range;
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
public class TimeShardingAlgorithm implements RangeShardingAlgorithm<Date>, PreciseShardingAlgorithm<Date> {

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
        System.out.println("精确分片");
        return buildShardingTable(preciseShardingValue.getLogicTableName(), preciseShardingValue.getValue());
    }

    /**
     * 范围分片
     * @param collection
     * @param rangeShardingValue
     * @return
     */
    @Override
    public Collection<String> doSharding(Collection<String> collection, RangeShardingValue<Date> rangeShardingValue) {
        System.out.println("范围分片");
        Range<Date> valueRange = rangeShardingValue.getValueRange();
        Date start = valueRange.lowerEndpoint();
        Date end = valueRange.upperEndpoint();

        Collection<String> tables = new ArrayList<>();
        while (start.compareTo(end) <= 0) {
            tables.add(buildShardingTable(rangeShardingValue.getLogicTableName(), start));
            start = DateUtil.beginOfMonth(DateUtil.offsetMonth(start, 1));
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
        String dateStr = DATE_TIME_FORMAT.format(date);
        StringBuffer stringBuffer = new StringBuffer(logicTableName).append("_").append(dateStr, 0, 6);
        System.out.println(logicTableName + " ==== " + stringBuffer.toString());
        return stringBuffer.toString();
    }
}
