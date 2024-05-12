/*
 * Copyright 2014 MOSPA(Ministry of Security and Public Administration).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.sysmgnt.category;

import java.util.List;

/**
 * 카테고리 관련 업무 처리를 위한 Sevice Interface 정의
 * 
 * @author Daniela Kwon
 * @since 2014. 4. 11.
 * @version 3.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *   수정일			수정자				수정내용
 *  ---------------------------------------------------------------------------------
 *   2014. 4. 11.	Daniela Kwon		최초생성
 * 
 * </pre>
 */
public interface EgovCategoryService {

    /**
	 * 선택된 ctgryId에 따라 카테고리 정보를 데이터베이스에서 삭제하도록 요청
	 * @param Category category
	 * @throws Exception
	 */
	public void deleteCategory(Category category) throws Exception;
	
	/**
	 * 카테고리 정보를 입력받아 데이터베이스에 저장하도록 요청
	 * @param Category category
	 * @throws Exception
	 */
	public void saveCategory(Category category) throws Exception;
	
	/**
	 * 카테고리의 전체 목록을 데이터베이스에서 읽어와 화면에 출력하도록 요청
	 * @return List<Category> 카테고리 목록
	 * @throws Exception
	 */
	public List<Category> findAllCategories() throws Exception;
		
	/**
	 * 선택된 ctgryId에 따라 데이터베이스에서 카테고리 정보를 읽어와 화면에 출력하도록 요청
	 * @param Category category
	 * @return Category rCategory 출력할 카테고리 정보
	 * @throws Exception
	 */
	public Category findCategoryById(Category category) throws Exception;
}
