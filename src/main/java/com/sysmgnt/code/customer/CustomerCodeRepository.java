package com.sysmgnt.code.customer;

import org.springframework.data.jpa.repository.JpaRepository;

//@RepositoryRestResource(collectionResourceRel = "customercodes", path = "customercodes")
public interface CustomerCodeRepository extends JpaRepository<CustomerCode, Integer> {
    
}
