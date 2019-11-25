package POJO.rainfall.dao;

import POJO.rainfall.domain.Rain;

import java.util.List;

public interface IrainDao {
    /**
     * 查询所有数据
     * @return
     */
    List<Rain> findAll();
}
