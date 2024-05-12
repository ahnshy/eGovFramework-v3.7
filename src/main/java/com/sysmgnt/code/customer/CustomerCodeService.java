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

/**
 * 코드 관련 업무 처리를 위한 Sevice Interface 정의
 * 
 * @author ahnshy (ahnshy@naver.com)
 * @since 2018.05.12
 * @version 1.0
 *
 */
public interface CustomerCodeService {
    /**
     * 선택된 Id에 따라 코드 정보를 데이터베이스에서 삭제하도록 요청
     * 
     * @param PortCode
     *            customerCode
     * @throws Exception
     */
    public void deleteCustomerCode(CustomerCode customerCode) throws Exception;

    /**
     * 코드 정보를 입력받아 데이터베이스에 저장하도록 요청
     * 
     * @param PortCode
     *            customerCode
     * @throws Exception
     */
    public void saveCustomerCode(CustomerCode customerCode) throws Exception;

    /**
     * 코드의 전체 목록을 데이터베이스에서 읽어와 화면에 출력하도록 요청
     * 
     * @return List<CustomerCode> 코드 목록
     * @throws Exception
     */
    public List<CustomerCode> findAllCustomerCodes() throws Exception;

    /**
     * 선택된 Id에 따라 데이터베이스에서 코드 정보를 읽어와 화면에 출력하도록 요청
     * 
     * @param PortCode
     *            customerCode
     * @return CustomerCode customerCode 출력할 코드 정보
     * @throws Exception
     */
    public CustomerCode findCustomerCodeById(CustomerCode customerCode) throws Exception;
}
