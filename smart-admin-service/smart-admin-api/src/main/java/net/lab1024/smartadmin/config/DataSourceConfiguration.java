package net.lab1024.smartadmin.config;

import com.alibaba.fastjson.JSON;
import com.baomidou.dynamic.datasource.DynamicRoutingDataSource;
import com.baomidou.dynamic.datasource.provider.AbstractDataSourceProvider;
import com.baomidou.dynamic.datasource.provider.DynamicDataSourceProvider;
import com.baomidou.dynamic.datasource.spring.boot.autoconfigure.DataSourceProperty;
import com.baomidou.dynamic.datasource.spring.boot.autoconfigure.DynamicDataSourceAutoConfiguration;
import com.baomidou.dynamic.datasource.spring.boot.autoconfigure.DynamicDataSourceProperties;
import org.apache.shardingsphere.shardingjdbc.jdbc.adapter.AbstractDataSourceAdapter;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Primary;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.Map;

@Configuration
@AutoConfigureBefore({DynamicDataSourceAutoConfiguration.class,
        SpringBootConfiguration.class})
public class DataSourceConfiguration {
//    // 分表数据源名称
//    public static final String SHARDING_DATA_SOURCE_NAME = "sharding";
//
//    //动态数据源配置项
//    @Resource
//    private DynamicDataSourceProperties properties;
//
//    /**
//     * shardingjdbc有四种数据源，需要根据业务注入不同的数据源
//     *
//     * <p>1. 未使用分片, 脱敏的名称(默认): shardingDataSource;
//     * <p>2. 主从数据源: masterSlaveDataSource;
//     * <p>3. 脱敏数据源：encryptDataSource;
//     * <p>4. 影子数据源：shadowDataSource
//     */
//    @Lazy
//    @Resource(name = "shardingDataSource")
//    AbstractDataSourceAdapter shardingDataSource;
//
//    @Bean
//    public DynamicDataSourceProvider dynamicDataSourceProvider() {
//        Map<String, DataSourceProperty> datasourceMap = properties.getDatasource();
//        System.out.println(" --->>> <<<---" + JSON.toJSONString(datasourceMap));
//        System.out.println(" --->>> <<<---" + JSON.toJSONString(shardingDataSource));
//        return new AbstractDataSourceProvider() {
//            @Override
//            public Map<String, DataSource> loadDataSources() {
//                Map<String, DataSource> dataSourceMap = createDataSourceMap(datasourceMap);
//                // 将 shardingjdbc 管理的数据源也交给动态数据源管理
//                dataSourceMap.put(SHARDING_DATA_SOURCE_NAME, shardingDataSource);
//                return dataSourceMap;
//            }
//        };
//    }

//    @Primary
//    @Bean
//    public DataSource dataSource(DynamicDataSourceProvider dynamicDataSourceProvider) {
//        DynamicRoutingDataSource dataSource = new DynamicRoutingDataSource();
//        dataSource.setPrimary(properties.getPrimary());
//        dataSource.setStrict(properties.getStrict());
//        dataSource.setStrategy(properties.getStrategy());
//        dataSource.setP6spy(properties.getP6spy());
//        dataSource.setSeata(properties.getSeata());
//        return dataSource;
//    }
}
