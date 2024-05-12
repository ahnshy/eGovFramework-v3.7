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
 * 카테고리 관련 웹요청을 관리하는 Controller 클래서 정의
 * 
 * @author Daniela Kwon
 * @since 2014.04.07
 * @version 3.0
 * @see
 * 
 *      <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *   수정일			수정자				수정내용
 *  ---------------------------------------------------------------------------------
 *   2014.04.07	Daniela Kwon		최초생성
 * 
 *      </pre>
 */
@Controller
@SessionAttributes(types = Category.class)
public class CategoryController {
    /** CategoryService */
    @Resource(name = "categoryService")
    private EgovCategoryService categoryService;
    @Resource(name = "validator")
    private Validator           beanValidator;

    /**
     * 카테고리 등록 화면으로 이동
     * 
     * @param model
     * @return "com/sysmgnt/category/egovCategoryRegister"
     * @throws Exception
     */
    @RequestMapping("/com/sysmgnt/category/insertCategoryView.do")
    public String insertView(Model model) throws Exception {
        model.addAttribute(new Category());
        return "com/sysmgnt/category/egovCategoryRegister";
    }

    /**
     * 카테고리 정보 저장 후 목록조회 화면으로 이동
     * 
     * @param category
     * @param bindingResult
     * @param model
     * @param status
     * @return "redirect:/com/sysmgnt/category/egovCategoryList.do"
     * @throws Exception
     */
    @RequestMapping("/com/sysmgnt/category/insertCategory.do")
    public String insert(@ModelAttribute Category category, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
        this.beanValidator.validate(category, bindingResult);
        if (bindingResult.hasErrors()) {
            return "com/sysmgnt/category/egovCategoryRegister";
        }
        category.getCtgryId();
        category.getCtgryCd();
        category.getCtgryNm();
        categoryService.saveCategory(category);
        status.setComplete();
        return "redirect:/com/sysmgnt/category/egovCategoryList.do";
    }

    /**
     * 카테고리 수정 화면으로 이동
     * 
     * @param ctgryId
     *            카테고리ID
     * @param model
     * @return "com/sysmgnt/category/egovCategoryRegister"
     * @throws Exception
     */
    @RequestMapping("/com/sysmgnt/category/updateCategoryView.do")
    public String updateView(@RequestParam("selectedId") String id, Model model) throws Exception {
        Category vo = new Category();
        vo.setCtgryId(id);
        model.addAttribute(categoryService.findCategoryById(vo));
        return "com/sysmgnt/category/egovCategoryRegister";
    }

    /**
     * 카테고리 정보 수정 후 목록조회 화면으로 이동
     * 
     * @param category
     * @param bindingResult
     * @param model
     * @param status
     * @return "redirect:/com/sysmgnt/category/egovCategoryList.do"
     * @throws Exception
     */
    @RequestMapping("/com/sysmgnt/category/updateCategory.do")
    public String update(@ModelAttribute Category category, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
        this.beanValidator.validate(category, bindingResult);
        if (bindingResult.hasErrors()) {
            return "com/sysmgnt/category/egovCategoryRegister";
        }
        categoryService.saveCategory(category);
        status.setComplete();
        return "redirect:/com/sysmgnt/category/egovCategoryList.do";
    }

    /**
     * 카테고리 정보 삭제 후 목록조회 화면으로 이동
     * 
     * @param category
     * @param status
     * @return "redirect:/com/sysmgnt/category/egovCategoryList.do"
     */
    @RequestMapping("/com/sysmgnt/category/deleteCategory.do")
    public String delete(@ModelAttribute Category category, SessionStatus status) throws Exception {
        categoryService.deleteCategory(category);
        status.setComplete();
        return "redirect:/com/sysmgnt/category/egovCategoryList.do";
    }

    /**
     * 카테고리 목록을 출력
     * 
     * @param model
     * @return "com/sysmgnt/category/egovCategoryList"
     * @throws Exception
     */
    @IncludedInfo(name="카테고리관리", listUrl="/com/sysmgnt/category/egovCategoryList.do", order = 3000,gid = 10)
    @RequestMapping(value = "/com/sysmgnt/category/egovCategoryList.do")
    public String list(ModelMap model) throws Exception {
        List<Category> categories = categoryService.findAllCategories();
        model.addAttribute("resultList", categories);
/*
        Page<BoardEntity> findAll(Pageable pageable);
        Page<BoardEntity> findAllByOrderBySeqDesc(Pageable pageable);
        Page<BoardEntity> findAllByAuthor(String author, Pageable pageable);

        @Query("select t  from BoardEntity t where content like concat('%', :searchString ,'%')")
        Page<BoardEntity> findAllSearch(@Param("searchString") String searchString, Pageable pageable);
*/
        
        return "com/sysmgnt/category/egovCategoryList";
    }
}
