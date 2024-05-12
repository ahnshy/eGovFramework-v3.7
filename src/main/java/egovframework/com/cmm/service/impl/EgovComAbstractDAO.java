/**
 *
 */
package egovframework.com.cmm.service.impl;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
/**
 * EgovComAbstractDAO.java 클래스
 *
 * @author ahnshy
 * @since 2011. 9. 23.
 * @version 1.0
 *
 */
public abstract class EgovComAbstractDAO extends EgovAbstractMapper{

	@Resource(name="egov.sqlSession")
	public void setSqlSessionFactory(SqlSessionFactory sqlSession) {
		super.setSqlSessionFactory(sqlSession);
	}
	

}
