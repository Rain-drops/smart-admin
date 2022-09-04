package net.lab1024.smartadmin.config.bean;

import com.alibaba.druid.filter.Filter;
import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.spring.stat.DruidStatInterceptor;
import com.alibaba.druid.util.JdbcConstants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Configuration
public class SmartDataSourceBean {

    @Value("${spring.datasource.base.driver-class-name}")
    String driver;

    @Value("${spring.datasource.base.url}")
    String url;

    @Value("${spring.datasource.base.username}")
    String username;

    @Value("${spring.datasource.base.password}")
    String password;

    @Value("${spring.datasource.base.initial-size}")
    int initialSize;

    @Value("${spring.datasource.base.min-idle}")
    int minIdle;

    @Value("${spring.datasource.base.max-active}")
    int maxActive;

    @Value("${spring.datasource.base.max-wait}")
    long maxWait;

    @Value("${spring.datasource.base.time-between-eviction-runs-millis}")
    long timeBetweenEvictionRunsMillis;

    @Value("${spring.datasource.base.min-evictable-idle-time-millis}")
    long minEvictableIdleTimeMillis;

    @Value("${spring.datasource.base.filters}")
    String filters;

    @Value("${spring.datasource.base.druid.username}")
    String druidUserName;

    @Value("${spring.datasource.base.druid.password}")
    String druidPassword;

    @Value("${spring.datasource.base.druid.login.enabled}")
    boolean druidLoginEnable;

    @Bean(name = "primaryDataSource")
    @Qualifier("primaryDataSource")
    @Primary
    public DataSource primaryDruidDataSource() {
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
            arrayList.add(logSlowSql());
            druidDataSource.setProxyFilters(arrayList);
            druidDataSource.init();
        } catch (SQLException e) {
            log.error("初始化数据源出错", e);
        }

        return druidDataSource;
    }

    public StatFilter logSlowSql() {
        StatFilter statFilter = new StatFilter();
        statFilter.setMergeSql(true);
        statFilter.setSlowSqlMillis(300);
        statFilter.setLogSlowSql(true);
        return statFilter;
    }

    @Bean
    public ServletRegistrationBean druidServlet() {
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
