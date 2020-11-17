package com.xl.common.config;

import com.xl.common.security.shiro.session.CacheSessionDAO;
import com.xl.common.security.shiro.session.SessionManager;
import com.xl.common.utils.IdGen;
import com.xl.modules.sys.security.FormAuthenticationFilter;
import com.xl.modules.sys.security.SystemAuthorizingRealm;
import net.sf.ehcache.CacheManager;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.bind.RelaxedPropertyResolver;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.DependsOn;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.DelegatingFilterProxy;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.Map;

/**
 * shiro的控制类
 * 下面方法的顺序不能乱
 * Created by dingrenxin
 * create on 2017/1/11 10:59
 * the email is dingrenxin@jyall.com.
 */
@Component
public class ShiroConfig {

   
    
    @Bean(name = "securityManager")
    public SecurityManager securityManager(
            SystemAuthorizingRealm systemAuthorizingRealm,
            SessionManager sessionManager,
            EhCacheManager ehCacheManager) {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(systemAuthorizingRealm);
        securityManager.setSessionManager(sessionManager);
        securityManager.setCacheManager(ehCacheManager);        
        return securityManager;
    }


    @Bean(name = "shiroCacheManager")
    public EhCacheManager shiroCacheManager(CacheManager manager) {
        EhCacheManager ehCacheManager = new EhCacheManager();
        ehCacheManager.setCacheManager(manager);
        return ehCacheManager;
    }
    @Bean(name = "sessionDAO")
    public CacheSessionDAO sessionDAO(EhCacheManager shiroCacheManager,IdGen idGen){
    	CacheSessionDAO dao=new CacheSessionDAO();
    	dao.setSessionIdGenerator(idGen);
    	dao.setActiveSessionsCacheName("activeSessionsCache");
    	dao.setCacheManager(shiroCacheManager);
    	return dao;
    }

    @Bean(name = "sessionManager")
    public SessionManager sessionManager(CacheSessionDAO dao) {
        SessionManager sessionManager = new SessionManager();
        sessionManager.setSessionDAO(dao);
        sessionManager.setGlobalSessionTimeout(86400000);
        sessionManager.setSessionValidationInterval(1800000);
        sessionManager.setSessionValidationSchedulerEnabled(true);
        sessionManager.setSessionIdCookie(new SimpleCookie("xf.session.id"));
        sessionManager.setSessionIdCookieEnabled(true);
        
        return sessionManager;
    }
    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean shiroFilterFactoryBean(
            @Value("${adminPath:/a}") String adminPath,
            BasicHttpAuthenticationFilter basicHttpAuthenticationFilter,
            FormAuthenticationFilter formAuthenticationFilter,
            SecurityManager securityManager,
            @Qualifier("shiroFilterChainDefinitions") String shiroFilterChainDefinitions) {
        Map<String, Filter> filters = new HashMap<String, Filter>();
        filters.put("basic", basicHttpAuthenticationFilter);
        filters.put("authc", formAuthenticationFilter);
        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
        bean.setFilters(filters);
        bean.setSecurityManager(securityManager);
        bean.setLoginUrl(adminPath + "/login");
        bean.setSuccessUrl(adminPath + "?login");
        bean.setFilterChainDefinitions(shiroFilterChainDefinitions);
        return bean;
    }
    /**
     * 全局的环境变量的设置
     * shiro的拦截
     *
     * @param environment
     * @param adminPath
     * @return
     */
    @Bean(name = "shiroFilterChainDefinitions")
    public String shiroFilterChainDefinitions(Environment environment, @Value("${adminPath}") String adminPath) {
        Global.resolver = new RelaxedPropertyResolver(environment);
        String string = "/static/** = anon\n";
        string += "/userfiles/** = anon\n";
        string += adminPath + "/basic = basic\n";
        string += adminPath + "/login = authc\n";
        string += adminPath + "/logout = logout\n";
        string += adminPath + "/** = user\n";
        return string;
    }

    

    @Bean(name = "basicHttpAuthenticationFilter")
    public BasicHttpAuthenticationFilter casFilter(@Value("${adminPath:/a}") String adminPath) {
        BasicHttpAuthenticationFilter basicHttpAuthenticationFilter = new BasicHttpAuthenticationFilter();
        basicHttpAuthenticationFilter.setLoginUrl(adminPath + "/login");
        return basicHttpAuthenticationFilter;
    }
  

    @Bean
    public FilterRegistrationBean filterRegistrationBean() {
        FilterRegistrationBean filterRegistration = new FilterRegistrationBean();
        filterRegistration.setFilter(new DelegatingFilterProxy("shiroFilter"));
        filterRegistration.addInitParameter("targetFilterLifecycle", "true");
        filterRegistration.setEnabled(true);
        filterRegistration.addUrlPatterns("/*");
        return filterRegistration;
    }

   /* @Bean(name = "lifecycleBeanPostProcessor")
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    @Bean
    @DependsOn("lifecycleBeanPostProcessor")
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        defaultAdvisorAutoProxyCreator.setProxyTargetClass(true);
        return defaultAdvisorAutoProxyCreator;
    }*/
}
