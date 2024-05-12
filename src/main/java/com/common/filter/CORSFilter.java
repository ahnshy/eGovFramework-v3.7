package com.common.filter;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.common.context.CustomControllerAdvice;

/**
 * Servlet Filter implementation class CORSFilter
 */
// Enable it for Servlet 3.x implementations
@WebFilter(asyncSupported = true, urlPatterns = { "/api/*" })
public class CORSFilter implements Filter {

    private static final Logger logger = LoggerFactory.getLogger(CORSFilter.class);

    /**
     * Default constructor.
     */
    public CORSFilter() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        // TODO Auto-generated method stub
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        logger.info("▶ URL : {}, HTTP Method: {}, Request Header: {}",request.getRequestURI(), request.getMethod(),getHeader(request));
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        // Authorize (allow) all domains to consume the content
        response.setHeader("Access-Control-Allow-Origin", "*"); // application/x-spring-data-verbose+json
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS, HEAD");
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Max-Age", "86400"); // 86400초=24시간, 3600초=1시간
        response.setHeader("Access-Control-Allow-Headers", "x-requested-with, origin, content-type, accept, authorization");
        // For HTTP OPTIONS verb/method reply with ACCEPTED status code -- per CORS handshake
        if (request.getMethod().equals("OPTIONS")) {
            response.setStatus(HttpServletResponse.SC_ACCEPTED);
            return;
        }
        // pass the request along the filter chain
        chain.doFilter(request, servletResponse);
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

    public static Map<String, Object> getHeader(HttpServletRequest request) {
        Map<String, Object> headerMap = new HashMap<String, Object>();
        try {
            Enumeration<String> headerNames = (Enumeration<String>) request.getHeaderNames();
            String headerName = null;
            while (headerNames.hasMoreElements()) {
                headerName = headerNames.nextElement();
                headerMap.put(headerName, request.getHeader(headerName));
            }
        } catch (Exception e) {
        }
        return headerMap;
    }
}