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

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import egovframework.com.cmm.annotation.IncludedInfo;

/**
 * 관리 Controller
 * 
 * @author ahnshy (ahnshy@naver.com)
 * @since 2018.05.12
 * @version 1.0
 * 
 */
@Controller
public class CustomerCodeController {
    /** CustomerCodeService */
    @Resource(name = "customerCodeService")
    private CustomerCodeService customerCodeService;
    @Resource(name = "validator")
    private Validator           beanValidator;
    
    /**
     *  코드 등록 화면으로 이동
     * 
     * @param model
     * @return "com/sysmgnt/code/customer/customerCodeRegister"
     * @throws Exception
     */
    @RequestMapping("/com/sysmgnt/code/customer/insertCustomerCodeView.do")
    public String insertView(Model model) throws Exception {
        model.addAttribute(new CustomerCode());
        return "com/sysmgnt/code/customer/customerCodeRegister";
    }

    /**
     *  코드 정보 저장 후 목록조회 화면으로 이동
     * 
     * @param category
     * @param bindingResult
     * @param model
     * @param status
     * @return "redirect:/com/sysmgnt/code/customer/customerCodeList.do"
     * @throws Exception
     */
    @RequestMapping("/com/sysmgnt/code/customer/insertCustomerCode.do")
    public String insert(@ModelAttribute CustomerCode category, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
        this.beanValidator.validate(category, bindingResult);
        if (bindingResult.hasErrors()) {
            return "com/sysmgnt/code/customer/customerCodeRegister";
        }
        customerCodeService.saveCustomerCode(category);
        status.setComplete();
        return "redirect:/com/sysmgnt/code/customer/customerCodeList.do";
    }

    /**
     *  코드 수정 화면으로 이동
     * 
     * @param ctgryId
     *             코드ID
     * @param model
     * @return "com/sysmgnt/code/customer/customerCodeRegister"
     * @throws Exception
     */
    @RequestMapping("/com/sysmgnt/code/customer/updateCustomerCodeView.do")
    public String updateView(@RequestParam("selectedId") int id, Model model) throws Exception {
        CustomerCode vo = new CustomerCode();
        vo.setId(id);
        model.addAttribute(customerCodeService.findCustomerCodeById(vo));
        return "com/sysmgnt/code/customer/customerCodeRegister";
    }

    /**
     *  코드 정보 수정 후 목록조회 화면으로 이동
     * 
     * @param category
     * @param bindingResult
     * @param model
     * @param status
     * @return "redirect:/com/sysmgnt/code/customer/customerCodeList.do"
     * @throws Exception
     */
    @RequestMapping("/com/sysmgnt/code/customer/updateCustomerCode.do")
    public String update(@ModelAttribute CustomerCode category, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
        this.beanValidator.validate(category, bindingResult);
        if (bindingResult.hasErrors()) {
            return "com/sysmgnt/code/customer/customerCodeRegister";
        }
        customerCodeService.saveCustomerCode(category);
        status.setComplete();
        return "redirect:/com/sysmgnt/code/customer/customerCodeList.do";
    }

    /**
     *  코드 정보 삭제 후 목록조회 화면으로 이동
     * 
     * @param category
     * @param status
     * @return "redirect:/com/sysmgnt/code/customer/customerCodeList.do"
     */
    @RequestMapping("/com/sysmgnt/code/customer/deleteCustomerCode.do")
    public String delete(@ModelAttribute CustomerCode category, SessionStatus status) throws Exception {
        customerCodeService.deleteCustomerCode(category);
        status.setComplete();
        return "redirect:/com/sysmgnt/code/customer/customerCodeList.do";
    }

    /**
     *  코드 목록을 출력
     * 
     * @param model
     * @return "com/sysmgnt/code/customer/customerCodeList"
     * @throws Exception
     */
    @IncludedInfo(name=" 코드관리", listUrl="/com/sysmgnt/code/customer/customerCodeList.do", order = 4000,gid = 10)
    @RequestMapping(value = "/com/sysmgnt/code/customer/customerCodeList.do")
    public String list(ModelMap model) throws Exception {
        List<CustomerCode> categories = customerCodeService.findAllCustomerCodes();
        model.addAttribute("resultList", categories);
/*
        Page<BoardEntity> findAll(Pageable pageable);
        Page<BoardEntity> findAllByOrderBySeqDesc(Pageable pageable);
        Page<BoardEntity> findAllByAuthor(String author, Pageable pageable);

        @Query("select t  from BoardEntity t where content like concat('%', :searchString ,'%')")
        Page<BoardEntity> findAllSearch(@Param("searchString") String searchString, Pageable pageable);
*/
        
        return "com/sysmgnt/code/customer/customerCodeList";
    }
}
