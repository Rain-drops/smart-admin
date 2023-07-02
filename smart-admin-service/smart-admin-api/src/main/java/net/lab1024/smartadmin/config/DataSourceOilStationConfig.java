package net.lab1024.smartadmin.config;

import com.baomidou.mybatisplus.core.MybatisConfiguration;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.extension.spring.MybatisSqlSessionFactoryBean;
import com.zaxxer.hikari.HikariDataSource;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.shardingsphere.api.config.sharding.ShardingRuleConfiguration;
import org.apache.shardingsphere.api.config.sharding.TableRuleConfiguration;
import org.apache.shardingsphere.api.config.sharding.strategy.StandardShardingStrategyConfiguration;
import org.apache.shardingsphere.shardingjdbc.api.ShardingDataSourceFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

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
@MapperScan(basePackages = {"net.lab1024.smartadmin.module.oil.**.*"},sqlSessionTemplateRef = "oilSqlTemplate")
public class DataSourceOilStationConfig {

    @Resource
    @Qualifier("oilDataSource")
    private DataSource dataSource;

    @Bean(name = "oilSqlFactory")
    public SqlSessionFactory sqlSessionFactory()throws Exception{
        MybatisSqlSessionFactoryBean factoryBean = new MybatisSqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource);

        MybatisConfiguration mybatisConfiguration = new MybatisConfiguration();
        mybatisConfiguration.addInterceptor(new PaginationInterceptor());
        factoryBean.setConfiguration(mybatisConfiguration);

        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        factoryBean.setMapperLocations(resolver.getResources("classpath*:mapper/oil/**/*Mapper.xml"));
        return factoryBean.getObject();
    }

    @Bean(name = "oilSqlTemplate")
    public SqlSessionTemplate sqlSessionTemplate(@Qualifier("oilSqlFactory") SqlSessionFactory sqlSessionFactory){
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
