package com.common.context;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * <code>@CustomControllerAdvice</code>
 *
 * @author ahnshy (ahnshy@naver.com)
 * @since 2017. 11. 24.
 * @version 1.0
 */
@ControllerAdvice(basePackages = { "com", "egovframework" })
public class CustomControllerAdvice {
    private final ObjectMapper  mapper = new ObjectMapper();
    private static final Logger logger = LoggerFactory.getLogger(CustomControllerAdvice.class);

//    /**
//     * client에서 배열 형태로 넘어 오는 데이터가 스프링에서 bind 시, defalut max length가 256이나, 1024로 증가
//     * 
//     * @param binder
//     */
//    @InitBinder
//    public void initBinder(WebDataBinder binder) {
//        binder.setAutoGrowCollectionLimit(1024);
//    }

    /**
     * 
     * @param request
     * @param response
     * @param exception
     * @return
     */
    @ExceptionHandler(value = Exception.class)
    public ModelAndView exceptionHandler(HttpServletRequest request, HttpServletResponse response, Exception exception) {
        ResponseStatus annotation = exception.getClass().getAnnotation(ResponseStatus.class);
        if (annotation == null || annotation.value() == null) {
            return commonExceptionHandler(request, response, exception, HttpStatus.INTERNAL_SERVER_ERROR);
        } else {
            return commonExceptionHandler(request, response, exception, HttpStatus.valueOf(annotation.value().value()));
        }
    }

    /**
     * 
     * @param request
     * @param response
     * @param exception
     * @param httpStatus
     * @return
     */
    private ModelAndView commonExceptionHandler(HttpServletRequest request, HttpServletResponse response, Exception exception, HttpStatus httpStatus) {
        exception.printStackTrace();
        ModelAndView model = null;
        // Content-Type 확인, json 만 View를 따로 처리함.
        if (request.getRequestURI().toLowerCase().contains(".json") ||
                (request.getHeader("Content-Type") != null
                        && MediaType.APPLICATION_JSON_VALUE.equals(request.getHeader("Content-Type")))) {
            model = new ModelAndView("jsonView");
        } else {
            // json 이 아닐경우 error page 로 이동
            model = new ModelAndView("egovframework/com/cmm/error/egovError");
            model.addObject("exception", exception);
        }
        model.addObject("statusReason", httpStatus.getReasonPhrase()); // 상태에 대한 설명/이유
        model.addObject("statusCode", httpStatus.value());// http 상태 코드
        model.addObject("errorMessage", exception.getMessage() + "시스템오류가 발생하였습니다. 관리자에게 문의하세요."); // alert으로 실제 알려줄 메시지
        model.addObject("errorCode", httpStatus.value()); // 세부 에러코드
        model.addObject("error", true); // 에러여부
        response.setStatus(httpStatus.value());
        logger.error("URL : {}, header & parameters : {}, exception : ", request.getRequestURL(), getHeadersNParams(request), exception);
        return model;
    }

    public String getHeadersNParams(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("headers", getHeader(request));
        map.put("params", getParameter(request));
        String returnStr = null;
        try {
            returnStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);
            ;
        } catch (JsonGenerationException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return returnStr;
    }

    public Map<String, Object> getHeader(HttpServletRequest request) {
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

    public Map<String, Object> getParameter(HttpServletRequest request) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if(request==null || request.getContentType() ==null){
            return paramMap;
        }
        boolean isMultipartForm = (request.getContentType().indexOf("multipart/form-data") >= 0);
        try {
            Enumeration<String> paramNames = (Enumeration<String>) request.getParameterNames();
            String paramName = null;
            while (paramNames.hasMoreElements()) {
                paramName = paramNames.nextElement();
                String[] values = request.getParameterValues(paramName);
                if (values != null && values.length == 1) {
                    if (isMultipartForm) {
                        paramMap.put(paramName, new String(values[0].getBytes("8859_1"), "utf-8"));
                    } else {
                        paramMap.put(paramName, values[0]);
                    }
                } else {
                    if (isMultipartForm) {
                        String[] UTF8_values = new String[values.length];
                        for (int i = 0; i < values.length; i++) {
                            UTF8_values[i] = new String(values[i].getBytes("8859_1"), "utf-8");
                        }
                        paramMap.put(paramName, UTF8_values);
                    } else {
                        paramMap.put(paramName, values);
                    }
                }
            }
        } catch (Exception e) {
        }
        return paramMap;
    }
}