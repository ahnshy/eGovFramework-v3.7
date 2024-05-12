package com.sysmgnt.code.customer;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import lombok.Data;

@Data
@Entity//(name="CUSTOMER_CODE")
public class CustomerCode {
    /*
    CREATE SEQUENCE STATE_SEQ
    MINVALUE 1
    MAXVALUE 9999999999
    START WITH 4
    INCREMENT BY 1;*/
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "STATE_SEQUENCE")
    @SequenceGenerator(sequenceName = "STATE_SEQ", allocationSize = 1, name = "STATE_SEQUENCE") 
    private int     id;
    private String  code;
    private String  ceo;
    private String  etprNo;
    private String  corpNm;
    private String  corpType;
    private String  postCode;
    private String  addr1;
    private String  addr2;
    private int     bldNo;
    private int     suplCd;
    private String  telNo;
    private boolean state;
    
}
