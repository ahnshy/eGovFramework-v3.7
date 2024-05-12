/*
 * Copyright 2014 MOSPA(Ministry of Security and Public Administration).
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.sysmgnt.code.customer;

import java.sql.Timestamp;
import java.util.List;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.sym.log.wlg.service.EgovWebLogService;
import egovframework.com.sym.log.wlg.service.WebLog;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 카테고리 관련 업무 처리를 위한 Sevice Interface 구현 클래스 정의
 * 
 * @author ahnshy (ahnshy@naver.com)
 * @since 2018.04.02
 * @version 1.0
 * 
 */
@Service("customerCodeService")
@Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
public class CustomerCodeServiceImpl extends EgovAbstractServiceImpl implements CustomerCodeService {
    @Resource(name = "EgovWebLogService")
    private EgovWebLogService      webLogService;
    /** CustomerCodeRepository */
    @Resource(name = "customerCodeRepository")
    private CustomerCodeRepository     customerCodeRepository;
    /** ID Generation */
    @Resource(name = "egovIdGnrServiceCgr")
    private EgovIdGnrService       egovIdGnrService;
    private static final Logger    log = LoggerFactory.getLogger(CustomerCodeServiceImpl.class);

    /**
     * 선택된 ctgryId에 따라 카테고리 정보를 데이터베이스에서 삭제하도록 요청
     * 
     * @param PortCode
     *            category
     * @throws Exception
     */
    public void deleteCustomerCode(CustomerCode category) throws Exception {
        customerCodeRepository.delete(category);
    }

    /**
     * 새로운 카테고리 정보를 입력받아 데이터베이스에 저장하도록 요청
     * 
     * @param PortCode
     *            category
     * @return String
     * @throws Exception
     */
    public void saveCustomerCode(CustomerCode category) throws Exception {
        log.debug(category.toString());
//        if (category.getCtgryId() == null) {
//            /** ID Generation Service */
//            String ctgryId = egovIdGnrService.getNextStringId();
//            category.setCtgryId(ctgryId);
//            log.debug(category.toString());
//        }
        WebLog webLog = new WebLog();
        String uniqId = "";
        /* Authenticated */
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if (isAuthenticated.booleanValue()) {
            LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
            uniqId = user.getUniqId();
        }
        webLog.setUrl("http://localhost:8080/sample/" + new Timestamp(System.currentTimeMillis()));
        webLog.setRqesterId(uniqId);
        webLog.setRqesterIp("127.0.0.1");
        webLogService.logInsertWebLog(webLog);
        CustomerCode customerCode = new CustomerCode();
        customerCode.setAddr1("Address 1");
        customerCode.setAddr2("Address 2");
        customerCode.setBldNo(1);
        customerCode.setCeo("CEO");
        customerCode.setCode("CompayCode");
        customerCode.setCorpNm("CompayTitle");
        customerCode.setCorpType("CompayType");
        customerCode.setEtprNo("PrNo");
        customerCode.setPostCode("Post Code");
        customerCode.setState(true);
        customerCode.setSuplCd(1);
        customerCode.setTelNo("Tel");
        customerCodeRepository.save(customerCode);
//        if ("".equals("")) {
//            throw new Exception("InProgressing....Exception");
//        }
    }

    /**
     * 카테고리의 전체 목록을 데이터베이스에서 읽어와 화면에 출력하도록 요청
     * 
     * @return List<CustomerCode> 카테고리 목록
     * @throws Exception
     */
    public List<CustomerCode> findAllCustomerCodes() throws Exception {
        return customerCodeRepository.findAll();
    }

    /**
     * 선택된 ctgryId에 따라 데이터베이스에서 카테고리 정보를 읽어와 화면에 출력하도록 요청
     * 
     * @param PortCode
     *            category
     * @return CustomerCode rCustomerCode
     * @throws Exception
     */
    public CustomerCode findCustomerCodeById(CustomerCode category) throws Exception {
        CustomerCode result = customerCodeRepository.findOne(category.getId());
        if (result == null)
            throw processException("info.nodata.msg");
        return result;
    }
}
