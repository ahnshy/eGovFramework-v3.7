package egovframework.com.cmm.config;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.springframework.data.rest.webmvc.RepositoryRestDispatcherServlet;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.XmlWebApplicationContext;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.DispatcherServlet;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.sec.security.filter.EgovSpringSecurityLoginFilter;
import egovframework.com.sec.security.filter.EgovSpringSecurityLogoutFilter;

/**
 * EgovWebApplicationInitializer 클래스
 * <Notice>
 * 사용자 인증 권한 처리를 분리(session, spring security) 하기 위해서 web.xml의 기능을
 * Servlet3.x WebApplicationInitializer 기능으로 처리
 * <Disclaimer>
 * N/A
 *
 * @author ahnshy
 * @since 2016.07.08
 * @version 1.0
 */
public class EgovWebApplicationInitializer implements WebApplicationInitializer {
    private static final Logger LOGGER = LoggerFactory.getLogger(EgovWebApplicationInitializer.class);

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        LOGGER.info("EgovWebApplicationInitializer START-============================================");
        // -------------------------------------------------------------
        // Egov Web ServletContextListener 설정
        // -------------------------------------------------------------
        servletContext.addListener(new egovframework.com.cmm.context.EgovWebServletContextListener());
        // -------------------------------------------------------------
        // Spring CharacterEncodingFilter 설정
        // -------------------------------------------------------------
        FilterRegistration.Dynamic characterEncoding = servletContext.addFilter("encodingFilter", new org.springframework.web.filter.CharacterEncodingFilter());
        characterEncoding.setInitParameter("encoding", "UTF-8");
        characterEncoding.setInitParameter("forceEncoding", "true");
        characterEncoding.addMappingForUrlPatterns(null, false, "*.do");
        // characterEncoding.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST), true, "*.do");
        // -------------------------------------------------------------
        // Spring ServletContextListener 설정
        // -------------------------------------------------------------
        XmlWebApplicationContext rootContext = new XmlWebApplicationContext();
        rootContext.setConfigLocations(new String[] { "classpath*:egovframework/spring/com/**/context-*.xml" });
        rootContext.refresh();
        rootContext.start();
        servletContext.addListener(new ContextLoaderListener(rootContext));
        // -------------------------------------------------------------
        // Spring ServletContextListener 설정
        // -------------------------------------------------------------
        XmlWebApplicationContext xmlWebApplicationContext = new XmlWebApplicationContext();
        xmlWebApplicationContext.setConfigLocation("/WEB-INF/config/egovframework/springmvc/egov-com-*.xml");
        ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher", new DispatcherServlet(xmlWebApplicationContext));
        dispatcher.addMapping("/");
        dispatcher.setLoadOnStartup(1);
        if ("security".equals(EgovProperties.getProperty("Globals.Auth").trim())) {
            // -------------------------------------------------------------
            // springSecurityFilterChain 설정
            // -------------------------------------------------------------
            FilterRegistration.Dynamic springSecurityFilterChain = servletContext.addFilter("springSecurityFilterChain", new DelegatingFilterProxy());
            springSecurityFilterChain.addMappingForUrlPatterns(null, false, "*");
            // servletContext.addFilter("springSecurityFilterChain", new DelegatingFilterProxy("springSecurityFilterChain")).addMappingForUrlPatterns(null, false, "/*");
            // -------------------------------------------------------------
            // HttpSessionEventPublisher 설정
            // -------------------------------------------------------------
            servletContext.addListener(new org.springframework.security.web.session.HttpSessionEventPublisher());
            // -------------------------------------------------------------
            // EgovSpringSecurityLoginFilter 설정
            // -------------------------------------------------------------
            FilterRegistration.Dynamic egovSpringSecurityLoginFilter = servletContext.addFilter("egovSpringSecurityLoginFilter", new EgovSpringSecurityLoginFilter());
            // 로그인 실패시 반활 될 URL설정
            egovSpringSecurityLoginFilter.setInitParameter("loginURL", "/uat/uia/egovLoginUsr.do");
            // 로그인 처리 URL설정
            egovSpringSecurityLoginFilter.setInitParameter("loginProcessURL", "/uat/uia/actionLogin.do");
            // 처리 Url Pattern
            egovSpringSecurityLoginFilter.addMappingForUrlPatterns(null, false, "*.do");
            // -------------------------------------------------------------
            // EgovSpringSecurityLogoutFilter 설정
            // -------------------------------------------------------------
            FilterRegistration.Dynamic egovSpringSecurityLogoutFilter = servletContext.addFilter("egovSpringSecurityLogoutFilter", new EgovSpringSecurityLogoutFilter());
            egovSpringSecurityLogoutFilter.addMappingForUrlPatterns(null, false, "/uat/uia/actionLogout.do");
        }
        // -------------------------------------------------------------
        // Spring RequestContextListener 설정
        // -------------------------------------------------------------
        servletContext.addListener(new org.springframework.web.context.request.RequestContextListener());
        LOGGER.info("EgovWebApplicationInitializer END-============================================");
        
//        XmlWebApplicationContext xmlWebApplicationContextRest = new XmlWebApplicationContext();
//        xmlWebApplicationContextRest.setConfigLocation("/WEB-INF/config/egovframework/springrest/*.xml");
//        ServletRegistration.Dynamic dispatcherRest = servletContext.addServlet("dispatcherRest", new RepositoryRestDispatcherServlet(xmlWebApplicationContextRest));
//        dispatcherRest.addMapping("/api/*");
//        dispatcherRest.setLoadOnStartup(1);
    }
}
