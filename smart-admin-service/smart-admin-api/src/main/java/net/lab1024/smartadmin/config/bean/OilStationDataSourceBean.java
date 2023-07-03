package net.lab1024.smartadmin.config.bean;

import com.alibaba.druid.filter.Filter;
import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.util.JdbcConstants;
import com.zaxxer.hikari.HikariDataSource;
import lombok.extern.slf4j.Slf4j;
import net.lab1024.smartadmin.config.TimeShardingAlgorithm;
import org.apache.shardingsphere.api.config.sharding.ShardingRuleConfiguration;
import org.apache.shardingsphere.api.config.sharding.TableRuleConfiguration;
import org.apache.shardingsphere.api.config.sharding.strategy.StandardShardingStrategyConfiguration;
import org.apache.shardingsphere.shardingjdbc.api.ShardingDataSourceFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@Slf4j
@Configuration
public class OilStationDataSourceBean {

    @Value("${spring.datasource.dynamic.datasource.station.driver-class-name}")
    String driver;

    @Value("${spring.datasource.dynamic.datasource.station.url}")
    String url;

    @Value("${spring.datasource.dynamic.datasource.station.username}")
    String username;

    @Value("${spring.datasource.dynamic.datasource.station.password}")
    String password;

    @Value("${spring.datasource.hikari.initial-size}")
    int initialSize;

    @Value("${spring.datasource.hikari.min-idle}")
    int minIdle;

    @Value("${spring.datasource.hikari.max-active}")
    int maxActive;

    @Value("${spring.datasource.hikari.max-wait}")
    long maxWait;

    @Value("${spring.datasource.hikari.time-between-eviction-runs-millis}")
    long timeBetweenEvictionRunsMillis;

    @Value("${spring.datasource.hikari.min-evictable-idle-time-millis}")
    long minEvictableIdleTimeMillis;

    @Value("${spring.datasource.dynamic.filters}")
    String filters;

    @Value("${spring.datasource.station.druid.username}")
    String druidUserName;

    @Value("${spring.datasource.station.druid.password}")
    String druidPassword;

    @Value("${spring.datasource.station.druid.login.enabled}")
    boolean druidLoginEnable;

    @Bean(name = "oilDataSource")
    @Qualifier("oilDataSource")
    public DataSource oilStationDruidDataSource() throws Exception{
//        DruidDataSource druidDataSource = new DruidDataSource();
//
//        druidDataSource.setDbType(JdbcConstants.MYSQL);
//        druidDataSource.setDriverClassName(driver);
//        druidDataSource.setUrl(url);
//        druidDataSource.setUsername(username);
//        druidDataSource.setPassword(password);
//        druidDataSource.setInitialSize(initialSize);
//        druidDataSource.setMinIdle(minIdle);
//        druidDataSource.setMaxActive(maxActive);
//        druidDataSource.setMaxWait(maxWait);
//        druidDataSource.setTimeBetweenEvictionRunsMillis(timeBetweenEvictionRunsMillis);
//        druidDataSource.setMinEvictableIdleTimeMillis(minEvictableIdleTimeMillis);
//        try {
//            druidDataSource.setFilters(filters);
//            ArrayList<Filter> arrayList = new ArrayList<>();
//            arrayList.add(oilStationLogSlowSql());
//            druidDataSource.setProxyFilters(arrayList);
//            druidDataSource.init();
//        } catch (SQLException e) {
//            log.error("初始化数据源出错", e);
//        }

        return getShardingDataSource();
    }
    public StatFilter oilStationLogSlowSql() {
        StatFilter statFilter = new StatFilter();
        statFilter.setMergeSql(true);
        statFilter.setSlowSqlMillis(300);
        statFilter.setLogSlowSql(true);
        return statFilter;
    }

    @Bean
    public ServletRegistrationBean oilStationDruidServlet() {
        ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean();
        servletRegistrationBean.setServlet(new StatViewServlet());
        servletRegistrationBean.addUrlMappings("/druid/*");
        Map<String, String> initParameters = new HashMap<String, String>();
        //不设置用户名密码可以直接通过druid/index.html访问
        if (druidLoginEnable) {
            initParameters.put("loginUsername", druidUserName);
            initParameters.put("loginPassword", druidPassword);
        }
        initParameters.put("resetEnable", "false");
        servletRegistrationBean.setInitParameters(initParameters);
        return servletRegistrationBean;
    }

    DataSource getShardingDataSource() throws SQLException {
        ShardingRuleConfiguration shardingRuleConfig = new ShardingRuleConfiguration();
        // 配置分表规则
        shardingRuleConfig.getTableRuleConfigs().add(getRealTableRuleConfiguration());
//        shardingRuleConfig.getBindingTableGroups().add("bus_tradelog");

        Properties props = new Properties();
        // 配置shardingsphere是否打印日志
        props.setProperty("sql.show", "true");
        // 创建数据源
        return ShardingDataSourceFactory.createDataSource(createDataSourceMap(), shardingRuleConfig, props);
    }

    /** 返回 bus_tradelog 表的分表规则配置 */
    TableRuleConfiguration getRealTableRuleConfiguration() {
        // 指定数据库及表配置规则
        TableRuleConfiguration result = new TableRuleConfiguration("bus_tradelog", "sharding-fullingdb.bus_tradelog_20230$->{5..9},sharding-fullingdb.bus_tradelog_20231$->{0..2}");
        // 指定分表字段及分表规则类  TaTable2Algorithm为自定义分表规则类
        result.setTableShardingStrategyConfig(new StandardShardingStrategyConfiguration("endtime", new TimeShardingAlgorithm(), new TimeShardingAlgorithm()));
        return result;
    }

    private Map<String, DataSource> createDataSourceMap() {
        Map<String, DataSource> result = new HashMap<>();
        DruidDataSource dbs = new DruidDataSource();
        dbs.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dbs.setUrl(url);
        dbs.setUsername(username);
        dbs.setPassword(password);
        result.put("sharding-fullingdb", dbs);
        return result;
    }
}
