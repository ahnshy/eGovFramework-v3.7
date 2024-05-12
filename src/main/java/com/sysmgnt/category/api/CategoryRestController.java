///*
// * Copyright 2014 MOSPA(Ministry of Security and Public Administration).
// * Licensed under the Apache License, Version 2.0 (the "License");
// * you may not use this file except in compliance with the License.
// * You may obtain a copy of the License at
// * http://www.apache.org/licenses/LICENSE-2.0
// * Unless required by applicable law or agreed to in writing, software
// * distributed under the License is distributed on an "AS IS" BASIS,
// * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// * See the License for the specific language governing permissions and
// * limitations under the License.
// */
//package com.sysmgnt.category.api;
//
//import java.util.List;
//import javax.annotation.Resource;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.rest.webmvc.RepositoryRestController;
//import org.springframework.hateoas.Resources;
//import org.springframework.http.ResponseEntity;
//import org.springframework.ui.Model;
//import org.springframework.ui.ModelMap;
//import org.springframework.validation.BindingResult;
//import org.springframework.validation.Validator;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.bind.support.SessionStatus;
//import com.sysmgnt.category.Category;
//import com.sysmgnt.category.CategoryRepository;
//import com.sysmgnt.category.EgovCategoryService;
//import egovframework.com.cmm.annotation.IncludedInfo;
//
///**
// * 카테고리 관련 API Controller 클래서 정의
// * 
// * @author Daniela Kwon
// * @since 2014.04.07
// * @version 3.0
// * @see
// * 
// *      <pre>
// *  == 개정이력(Modification Information) ==
// *   
// *   수정일			수정자				수정내용
// *  ---------------------------------------------------------------------------------
// *   2014.04.07	Daniela Kwon		최초생성
// * 
// *      </pre>
// */
//@RepositoryRestController 
//@SessionAttributes(types = Category.class)
//@RequestMapping("/rest")
//public class CategoryRestController {
//    /** CategoryService */
//    @Resource(name = "categoryService")
//    private EgovCategoryService categoryService;
//    @Autowired
//    private CategoryRepository categoryRepository;
//    @Resource(name = "validator")
//    private Validator           beanValidator;
//
//    @GetMapping(value = "/sysmgnt/categories") 
//    public @ResponseBody ResponseEntity<?> categories() {
//        List<Category> categories = categoryRepository.findAll(); 
//        Resources<Category> resources = new Resources<Category>(categories); 
//        return ResponseEntity.ok(resources); 
//    } 
//    @GetMapping(value = "/sysmgnt/category/{id}") 
//    public @ResponseBody Category category(@PathVariable String id) {
//        Category category = categoryRepository.findOne(id);
//        return category;
//    } 
//    /**
//     * 카테고리 등록 화면으로 이동
//     * 
//     * @param model
//     * @return "sysmgnt/category/egovCategoryRegister"
//     * @throws Exception
//     */
//    @RequestMapping("/sysmgnt/category/insertCategoryView.do")
//    public String insertView(Model model) throws Exception {
//        model.addAttribute(new Category());
//        return "sysmgnt/category/egovCategoryRegister";
//    }
//
//    /**
//     * 카테고리 정보 저장 후 목록조회 화면으로 이동
//     * 
//     * @param category
//     * @param bindingResult
//     * @param model
//     * @param status
//     * @return "redirect:/sysmgnt/category/egovCategoryList.do"
//     * @throws Exception
//     */
//    @RequestMapping("/sysmgnt/category/insertCategory.do")
//    public String insert(@ModelAttribute Category category, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
//        this.beanValidator.validate(category, bindingResult);
//        if (bindingResult.hasErrors()) {
//            return "sysmgnt/category/egovCategoryRegister";
//        }
//        categoryService.saveCategory(category);
//        status.setComplete();
//        return "redirect:/sysmgnt/category/egovCategoryList.do";
//    }
//
//    /**
//     * 카테고리 수정 화면으로 이동
//     * 
//     * @param ctgryId
//     *            카테고리ID
//     * @param model
//     * @return "sysmgnt/category/egovCategoryRegister"
//     * @throws Exception
//     */
//    @RequestMapping("/sysmgnt/category/updateCategoryView.do")
//    public String updateView(@RequestParam("selectedId") String id, Model model) throws Exception {
//        Category vo = new Category();
//        vo.setCtgryId(id);
//        model.addAttribute(categoryService.findCategoryById(vo));
//        return "sysmgnt/category/egovCategoryRegister";
//    }
//
//    /**
//     * 카테고리 정보 수정 후 목록조회 화면으로 이동
//     * 
//     * @param category
//     * @param bindingResult
//     * @param model
//     * @param status
//     * @return "redirect:/sysmgnt/category/egovCategoryList.do"
//     * @throws Exception
//     */
//    @RequestMapping("/sysmgnt/category/updateCategory.do")
//    public String update(@ModelAttribute Category category, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
//        this.beanValidator.validate(category, bindingResult);
//        if (bindingResult.hasErrors()) {
//            return "sysmgnt/category/egovCategoryRegister";
//        }
//        categoryService.saveCategory(category);
//        status.setComplete();
//        return "redirect:/sysmgnt/category/egovCategoryList.do";
//    }
//
//    /**
//     * 카테고리 정보 삭제 후 목록조회 화면으로 이동
//     * 
//     * @param category
//     * @param status
//     * @return "redirect:/sysmgnt/category/egovCategoryList.do"
//     */
//    @RequestMapping("/sysmgnt/category/deleteCategory.do")
//    public String delete(@ModelAttribute Category category, SessionStatus status) throws Exception {
//        categoryService.deleteCategory(category);
//        status.setComplete();
//        return "redirect:/sysmgnt/category/egovCategoryList.do";
//    }
//
//    /**
//     * 카테고리 목록을 출력
//     * 
//     * @param model
//     * @return "sysmgnt/category/egovCategoryList"
//     * @throws Exception
//     */
//    @IncludedInfo(name="카테고리관리", listUrl="/sysmgnt/category/egovCategoryList.do", order = 3000,gid = 10)
//    @RequestMapping(value = "/sysmgnt/category/egovCategoryList.do")
//    public String list(ModelMap model) throws Exception {
//        List<Category> categories = categoryService.findAllCategories();
//        model.addAttribute("resultList", categories);
///*
//        Page<BoardEntity> findAll(Pageable pageable);
//        Page<BoardEntity> findAllByOrderBySeqDesc(Pageable pageable);
//        Page<BoardEntity> findAllByAuthor(String author, Pageable pageable);
//
//        @Query("select t  from BoardEntity t where content like concat('%', :searchString ,'%')")
//        Page<BoardEntity> findAllSearch(@Param("searchString") String searchString, Pageable pageable);
//*/
//        
//        return "sysmgnt/category/egovCategoryList";
//    }
//}
///**
//xxx-form
//Plural routes
//    GET    /posts
//    GET    /posts/1
//    POST   /posts
//    PUT    /posts/1
//    DELETE /posts/1
//
//Singular routes
//    GET    /profile + [Header Auth Code]
//    POST   /profile + [Header Auth Code]
//    PUT    /profile + [Header Auth Code]
//    PATCH  /profile + [Header Auth Code]
//
//Filter
//    GET /posts?title=json-server&author=typicode
//    
//    GET /posts?id=1&id=2
//    (GET /posts?id=1 == GET /posts/1)
//
//Paginate
//    GET /posts?_page=7
//    GET /posts?_page=7&_limit=20
//
//Sort
//    _sort: 정렬 대상 키
//    _order: 정렬 방법
//    _sort의 갯수와 _order의 갯수는 일치 해야 함.
//
//    GET /posts?_sort=views&_order=asc
//    GET /posts/1/comments?_sort=votes&_order=asc
//
//    GET /posts?_sort=user,views&_order=desc,asc
//        : Sort를 사용 시 Order는 무조건 명시적으로 표현
//    
//Slice
//    _start: 시작점(초과)
//    _end: 끝점(이하)
//    _limit: 시작점을 기준으로 최대 갯수
//
//    GET /posts?_start=20&_end=30
//    GET /posts/1/comments?_start=20&_end=30
//    GET /posts/1/comments?_start=20&_limit=10
//
//Operators
//    _gte: ~ 보다 큰 값(Great Then)
//    _lte: ~ 보다 작은 값(Less Then)
//    _ne: ~ 값이 아닌것;RegExp supported (Not Equal)
//    _like: SQL의 LIKE 표현식; RegExp supported
//            허용하는 표현식은 시작(^), 끝($)만 하는것으로.
//
//    GET /posts?views_gte=10&views_lte=20
//    GET /posts?id_ne=1
//    GET /posts?title_like=server
//
//Relationships
//    _embed: 자식 엔티티까지 Response
//    _expand: 부모 엔티티까지 Response
//
//    GET /posts?_embed=comments
//    GET /posts/1?_embed=comments
//
//    GET /comments?_expand=post
//    GET /comments/1?_expand=post
//
//    GET  /posts/1/comments : POST 1번의 COMMENTS Reponse
//    POST /posts/1/comments : POST 1번의 COMMENTS INSERT
//    
//*/
//
