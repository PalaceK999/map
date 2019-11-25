package POJO.rainfall.test;


import POJO.rainfall.dao.IrainDao;
import POJO.rainfall.domain.Rain;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import javax.sql.rowset.serial.SQLOutputImpl;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class MybatisTest {

    private InputStream in;
    private SqlSession sqlSession;
    private IrainDao irainDao;


    /**
     * 初始化
     */
    @Before//用于在测试方法之前执行
    public void init() throws Exception{

        in = Resources.getResourceAsStream("SqlMapConfig.xml");
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        SqlSessionFactory factory = builder.build(in);
        sqlSession = factory.openSession();
        irainDao = sqlSession.getMapper(IrainDao.class);
    }


    /**
     * 用于资源的释放
     */
    @After//用于在测试方法之后执行
    public void destroy() throws Exception{
        //提交事务
        sqlSession.commit();

        sqlSession.close();
        in.close();
    }


    /**
     * 查询所有用户信息
     */

    @Test
    public void TestFindAll(){

        List<Rain> rain = irainDao.findAll();

        rain.stream().forEach(System.out::println);

    }


}
