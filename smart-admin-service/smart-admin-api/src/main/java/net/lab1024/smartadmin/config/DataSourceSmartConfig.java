package net.lab1024.smartadmin.config;

import com.alibaba.druid.support.http.WebStatFilter;
import com.alibaba.druid.support.spring.stat.DruidStatInterceptor;
import com.baomidou.mybatisplus.core.MybatisConfiguration;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.extension.spring.MybatisSqlSessionFactoryBean;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.aop.support.JdkRegexpMethodPointcut;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.annotation.Resource;
import javax.sql.DataSource;

/**
 * [ 数据源配置 ]
 *
 * @author yandanyang
 * @version 1.0
 * @company 1024lab.net
 * @copyright (c) 2019 1024lab.netInc. All rights reserved.
 * @date
 * @since JDK1.8
 */
@Slf4j
@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = {"net.lab1024.smartadmin.module.business.**.*", "net.lab1024.smartadmin.module.support.**.*","net.lab1024.smartadmin.module.system.**.*"},sqlSessionTemplateRef = "primarySqlTemplate")
public class DataSourceSmartConfig {


    @Resource
    @Qualifier("primaryDataSource")
    private DataSource dataSource;

    @Primary
    @Bean(name = "primarySqlFactory")
    public SqlSessionFactory sqlSessionFactory()throws Exception{
        MybatisSqlSessionFactoryBean factoryBean = new MybatisSqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource);

        MybatisConfiguration mybatisConfiguration = new MybatisConfiguration();
        mybatisConfiguration.addInterceptor(new PaginationInterceptor());
        factoryBean.setConfiguration(mybatisConfiguration);


        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        factoryBean.setMapperLocations(resolver.getResources("classpath*:mapper/base/**/*Mapper.xml"));
        return factoryBean.getObject();
    }

    @Primary
    @Bean(name = "primarySqlTemplate")
    public SqlSessionTemplate sqlSessionTemplate(@Qualifier("primarySqlFactory") SqlSessionFactory sqlSessionFactory){
        return new SqlSessionTemplate(sqlSessionFactory);
    }


    @Bean
    public FilterRegistrationBean filterRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new WebStatFilter());
        filterRegistrationBean.addUrlPatterns("/*");
        filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
        return filterRegistrationBean;
    }

    public DruidStatInterceptor druidStatInterceptor() {
        DruidStatInterceptor dsInterceptor = new DruidStatInterceptor();
        return dsInterceptor;
    }

    public JdkRegexpMethodPointcut jdkRegexpMethodPointcut() {
        JdkRegexpMethodPointcut jdkRegexpMethodPointcut = new JdkRegexpMethodPointcut();
        jdkRegexpMethodPointcut.setPatterns("net.lab1024.smartadmin.module..*Service.*");
        return jdkRegexpMethodPointcut;
    }

    @Bean
    public DefaultPointcutAdvisor defaultPointcutAdvisor() {
        DefaultPointcutAdvisor pointcutAdvisor = new DefaultPointcutAdvisor();
        pointcutAdvisor.setPointcut(jdkRegexpMethodPointcut());
        pointcutAdvisor.setAdvice(druidStatInterceptor());
        return pointcutAdvisor;
    }

}
