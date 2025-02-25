package com.dcits.common;

import com.dcits.platform.dao.DAO;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;
/**
 * @author meng.chunxia  
 * @since 20170208
 */
@Repository("daoSupportPecr")
public class DaoSupportPecr implements DAO {

	@Resource(name = "sqlSessionTemplate_pecr")
	private SqlSessionTemplate sqlSessionTemplatePecr;
	
	/**
	 * 保存对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object save(String str, Object obj) throws Exception {
		Object object = new Object();
		object = sqlSessionTemplatePecr.insert(str, obj);
		return object;
	}
	
	/**
	 * 批量更新
	 * @param str
	 * @param objs
	 * @return
	 * @throws Exception
	 */
	public Object batchSave(String str, List objs )throws Exception{
		return sqlSessionTemplatePecr.insert(str, objs);
	}
	
	/**
	 * 修改对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object update(String str, Object obj) throws Exception {
		SqlSession sqlSession = sqlSessionTemplatePecr.getSqlSessionFactory().openSession(false);
		Object object = new Object();
		 object = sqlSessionTemplatePecr.update(str, obj);
		 sqlSession.commit(); 
		return object;
	}
	
	/**
	 * 修改对象  韦宗英 add
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object insert(String str, Object obj) throws Exception {
		SqlSession sqlSession = sqlSessionTemplatePecr.getSqlSessionFactory().openSession(false);
		Object object = new Object();
		 object = sqlSessionTemplatePecr.insert(str, obj);
		 sqlSession.commit(); 
		return object;
	}

	/**
	 * 批量更新
	 * @param str
	 * @param objs
	 * @return
	 * @throws Exception
	 */
	public void batchUpdate(String str, List objs )throws Exception{
		SqlSessionFactory sqlSessionFactory = sqlSessionTemplatePecr.getSqlSessionFactory();
		//批量执行器
		SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH,false);
		try{
			if(objs!=null){
				for(int i=0,size=objs.size();i<size;i++){
					sqlSession.update(str, objs.get(i));
				}
				sqlSession.flushStatements();
				sqlSession.commit();
				sqlSession.clearCache();
			}
		}finally{
			sqlSession.close();
		}
	}
	
	/**
	 * 批量删除
	 * @param str
	 * @param objs
	 * @return
	 * @throws Exception
	 */
	public Object batchDelete(String str, List objs )throws Exception{
		return sqlSessionTemplatePecr.delete(str, objs);
	}
	
	/**
	 * 删除对象 
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object delete(String str, Object obj) throws Exception {
		return sqlSessionTemplatePecr.delete(str, obj);
	}
	 
	/**
	 * 查找对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object findForObject(String str, Object obj) throws Exception {
		Object object = new Object();
		object =  sqlSessionTemplatePecr.selectOne(str, obj);
		return object;
	}

	/**
	 * 查找对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object findForList(String str, Object obj) throws Exception {
		return sqlSessionTemplatePecr.selectList(str, obj);
	}
	
	/**
	 * 韦宗英统计
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public int findForListTotle(String str, Object obj) throws Exception {
		return sqlSessionTemplatePecr.selectOne(str, obj);
	}
	/**
	 * 韦宗英  获取单个
	 * @param str
	 * @return
	 * @throws Exception
	 */
	public Object findOne(String str,Map map) throws Exception {
		return sqlSessionTemplatePecr.selectOne(str,map);
	}
	/**
	 * 查找对象
	 * @param str
	 * @return
	 * @throws Exception
	 */
	public Object findForList(String str) throws Exception {
		return sqlSessionTemplatePecr.selectList(str);
	}
	/**
	 * 查找对象
	 * @param str
	 * @param obj
	 * @param key
	 * @param value
	 * @return
	 * @throws Exception
	 */
	public Object findForMap(String str, Object obj, String key, String value) throws Exception {
		return sqlSessionTemplatePecr.selectMap(str, obj, key);
	}
}


