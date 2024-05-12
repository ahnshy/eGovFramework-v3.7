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

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotBlank;
import lombok.Data;

/**
 * 영속성 처리를 위한 카테고리 클래스 정의
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
@Data
@Entity
@Table(name = "RTETNCTGRY")
public class Category implements Serializable {
    private static final long serialVersionUID = 1L;
    /** 카테고리ID */
    @Id
    @Column(name = "CTGRY_ID")
    private String            ctgryId;
    /** 카테고리명 */
    @NotBlank
    @Column(name = "CTGRY_NM")
    private String            ctgryNm;
    /** 카테고리명 코드 */
    private String            ctgryCd;
    /** 카테고리 설명 */
    @NotBlank
    @Column(name = "DC")
    private String            dc;
}
