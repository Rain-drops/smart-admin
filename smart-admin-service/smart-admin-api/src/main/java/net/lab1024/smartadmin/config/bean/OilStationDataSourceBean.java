package net.lab1024.smartadmin.config.bean;

import com.alibaba.druid.filter.Filter;
import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.util.JdbcConstants;
import lombok.extern.slf4j.Slf4j;
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
    public DataSource oilStationDruidDataSource() {
        DruidDataSource druidDataSource = new DruidDataSource();
        druidDataSource.setDbType(JdbcConstants.MYSQL);
        druidDataSource.setDriverClassName(driver);
        druidDataSource.setUrl(url);
        druidDataSource.setUsername(username);
        druidDataSource.setPassword(password);
        druidDataSource.setInitialSize(initialSize);
        druidDataSource.setMinIdle(minIdle);
        druidDataSource.setMaxActive(maxActive);
        druidDataSource.setMaxWait(maxWait);
        druidDataSource.setTimeBetweenEvictionRunsMillis(timeBetweenEvictionRunsMillis);
        druidDataSource.setMinEvictableIdleTimeMillis(minEvictableIdleTimeMillis);
        try {
            druidDataSource.setFilters(filters);
            ArrayList<Filter> arrayList = new ArrayList<>();
            arrayList.add(oilStationLogSlowSql());
            druidDataSource.setProxyFilters(arrayList);
            druidDataSource.init();
        } catch (SQLException e) {
            log.error("初始化数据源出错", e);
        }

        return druidDataSource;
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
}
