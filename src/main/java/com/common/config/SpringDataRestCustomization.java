package com.common.config;

import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurerAdapter;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import com.sysmgnt.category.Category;
import com.sysmgnt.code.customer.CustomerCode;

@Component
public class SpringDataRestCustomization extends RepositoryRestConfigurerAdapter {
    @Override
    public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
        config.setBasePath("/api");
        config.setDefaultMediaType(MediaType.APPLICATION_JSON_UTF8); // new MediaType("application/vnd.api+json"));
        config.useHalAsDefaultJsonMediaType(false);
        config.exposeIdsFor(CustomerCode.class, Category.class); // ID를 노출시킬 도메인객체
    }
}
