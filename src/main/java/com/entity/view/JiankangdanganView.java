package com.entity.view;

import com.entity.JiankangdanganEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.io.Serializable;

/**
 * 居民健康档案
 * 后端返回视图实体辅助类
 */
@TableName("jiankangdangan")
public class JiankangdanganView  extends JiankangdanganEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    public JiankangdanganView(){
    }

    public JiankangdanganView(JiankangdanganEntity jiankangdanganEntity){
        try {
            BeanUtils.copyProperties(this, jiankangdanganEntity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }

    }
}