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

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 카테고리 데이터 처리를 위한 Repository 정의
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
public interface CategoryRepository extends JpaRepository<Category, String> {

}
