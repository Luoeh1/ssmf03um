package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;

/**
 * 居民健康档案
 * 数据库映射实体类
 */
@TableName("jiankangdangan")
public class JiankangdanganEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    public JiankangdanganEntity() {
    }

    public JiankangdanganEntity(T t) {
        try {
            BeanUtils.copyProperties(this, t);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    /**
     * 主键id
     */
    @TableId
    private Long id;

    /**
     * 用户账号 (关联用户表)
     */
    private String yonghuzhanghao;

    /**
     * 用户姓名
     */
    private String yonghuxingming;

    /**
     * 性别
     */
    private String xingbie;

    /**
     * 年龄
     */
    private Integer nianling;

    /**
     * 血型
     */
    private String xuexing;

    /**
     * 过敏史
     */
    private String guominshi;

    /**
     * 既往病史
     */
    private String jiwangbingshi;

    /**
     * 家族遗传史
     */
    private String jiazushiji;

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;

    // ======= 下面是 Getter 和 Setter 方法 =======

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getYonghuzhanghao() {
        return yonghuzhanghao;
    }
    public void setYonghuzhanghao(String yonghuzhanghao) {
        this.yonghuzhanghao = yonghuzhanghao;
    }
    public String getYonghuxingming() {
        return yonghuxingming;
    }
    public void setYonghuxingming(String yonghuxingming) {
        this.yonghuxingming = yonghuxingming;
    }
    public String getXingbie() {
        return xingbie;
    }
    public void setXingbie(String xingbie) {
        this.xingbie = xingbie;
    }
    public Integer getNianling() {
        return nianling;
    }
    public void setNianling(Integer nianling) {
        this.nianling = nianling;
    }
    public String getXuexing() {
        return xuexing;
    }
    public void setXuexing(String xuexing) {
        this.xuexing = xuexing;
    }
    public String getGuominshi() {
        return guominshi;
    }
    public void setGuominshi(String guominshi) {
        this.guominshi = guominshi;
    }
    public String getJiwangbingshi() {
        return jiwangbingshi;
    }
    public void setJiwangbingshi(String jiwangbingshi) {
        this.jiwangbingshi = jiwangbingshi;
    }
    public String getJiazushiji() {
        return jiazushiji;
    }
    public void setJiazushiji(String jiazushiji) {
        this.jiazushiji = jiazushiji;
    }
    public Date getAddtime() {
        return addtime;
    }
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}