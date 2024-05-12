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
package com.sysmgnt.category;

import java.sql.Timestamp;
import java.util.List;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.sysmgnt.code.customer.CustomerCode;
import com.sysmgnt.code.customer.CustomerCodeRepository;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.sym.log.wlg.service.EgovWebLogService;
import egovframework.com.sym.log.wlg.service.WebLog;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 카테고리 관련 업무 처리를 위한 Sevice Interface 구현 클래스 정의
 * 
 * @author Daniela Kwon
 * @since 2014. 4. 11.
 * @version 3.0
 * @see
 * 
 *      <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *   수정일			수정자				수정내용
 *  ---------------------------------------------------------------------------------
 *   2014. 4. 11.	Daniela Kwon		최초생성
 * 
 *      </pre>
 */
@Service("categoryService")
@Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
public class EgovCategoryServiceImpl extends EgovAbstractServiceImpl implements EgovCategoryService {
    @Resource(name = "EgovWebLogService")
    private EgovWebLogService      webLogService;
    /** CategoryRepository */
    @Resource(name = "categoryRepository")
    private CategoryRepository     categoryRepository;
    @Resource(name = "customerCodeRepository")
    private CustomerCodeRepository customerCodeRepository;
    /** ID Generation */
    @Resource(name = "egovIdGnrServiceCgr")
    private EgovIdGnrService       egovIdGnrService;
    private static final Logger    log = LoggerFactory.getLogger(EgovCategoryServiceImpl.class);

    /**
     * 선택된 ctgryId에 따라 카테고리 정보를 데이터베이스에서 삭제하도록 요청
     * 
     * @param Category
     *            category
     * @throws Exception
     */
    public void deleteCategory(Category category) throws Exception {
        categoryRepository.delete(category);
    }

    /**
     * 새로운 카테고리 정보를 입력받아 데이터베이스에 저장하도록 요청
     * 
     * @param Category
     *            category
     * @return String
     * @throws Exception
     */
    public void saveCategory(Category category) throws Exception {
        log.debug(category.toString());
        if (category.getCtgryId() == null) {
            /** ID Generation Service */
            String ctgryId = egovIdGnrService.getNextStringId();
            category.setCtgryId(ctgryId);
            log.debug(category.toString());
        }
        categoryRepository.save(category);
        WebLog webLog = new WebLog();
        String uniqId = "";
        /* Authenticated */
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if (isAuthenticated.booleanValue()) {
            LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
            uniqId = user.getUniqId();
        }
        webLog.setUrl("http://localhost:8080/test/" + new Timestamp(System.currentTimeMillis()));
        webLog.setRqesterId(uniqId);
        webLog.setRqesterIp("127.0.0.1");
        webLogService.logInsertWebLog(webLog);
        CustomerCode customerCode = new CustomerCode();
        customerCode.setAddr1("주소1");
        customerCode.setAddr2("주소2");
        customerCode.setBldNo(1);
        customerCode.setCeo("최고경영자");
        customerCode.setCode("회사코드");
        customerCode.setCorpNm("회사명");
        customerCode.setCorpType("회사타입");
        customerCode.setEtprNo("회사대표전화");
        customerCode.setPostCode("우편번호");
        customerCode.setState(true);
        customerCode.setSuplCd(1);
        customerCode.setTelNo("회사코드");
        customerCodeRepository.save(customerCode);
//        if ("".equals("")) {
//            throw new Exception("트랜잭션 테스트 중이에요 같이 롤백이 되는지 테스트 중이지유 ㅋㅋ");
//        }
    }

    /**
     * 카테고리의 전체 목록을 데이터베이스에서 읽어와 화면에 출력하도록 요청
     * 
     * @return List<Category> 카테고리 목록
     * @throws Exception
     */
    public List<Category> findAllCategories() throws Exception {
        return categoryRepository.findAll();
    }

    /**
     * 선택된 ctgryId에 따라 데이터베이스에서 카테고리 정보를 읽어와 화면에 출력하도록 요청
     * 
     * @param Category
     *            category
     * @return Category rCategory
     * @throws Exception
     */
    public Category findCategoryById(Category category) throws Exception {
        Category result = categoryRepository.findOne(category.getCtgryId());
        if (result == null)
            throw processException("info.nodata.msg");
        return result;
    }
}
