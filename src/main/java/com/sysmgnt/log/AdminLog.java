package com.sysmgnt.log;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import lombok.Data;

@Data   
@Entity
public class AdminLog {
    /*
     * CREATE SEQUENCE ADMIN_LOG_SEQ
     * MINVALUE 1
     * MAXVALUE 9999999999
     * START WITH 1
     * INCREMENT BY 1;
     */
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ADMIN_LOG_SEQUENCE")
    @SequenceGenerator(sequenceName = "ADMIN_LOG_SEQ", allocationSize = 1, name = "ADMIN_LOG_SEQUENCE")
    private int     id;
    private String  url;
    private String  userId;
    private Date    createDt;
    private String  createIp;
    private boolean isApi;
}
