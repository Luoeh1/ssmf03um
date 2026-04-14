package com.entity.vo;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;

/**
 * 居民健康档案
 * 手机端接口返回实体辅助类
 */
public class JiankangdanganVO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 用户账号
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