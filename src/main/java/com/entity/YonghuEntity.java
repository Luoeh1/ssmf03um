package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

/**
 * 用户
 * 数据库通用操作实体类（普通增删改查）
 */
@TableName("yonghu")
public class YonghuEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;

	public YonghuEntity() {
	}

	public YonghuEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	@TableId
	private Long id;
	private String yonghuzhanghao;
	private String yonghuxingming;
	private String mima;
	private String xingbie;
	private String touxiang;
	private String dianhuahaoma;
	private String jinjilianxiren;
	private String xuexing;
	private String jinji;

	// 社区健康档案扩展字段
	private String yinjiuqingkuang;
	private String xiyanqingkuang;
	private String yundongpinlv;
	private String jingshenyali;
	private String shuimianqingkuang;
	private String shengao;
	private String tizhong;
	private String bmi;
	private String xiongwei;
	private String yaowei;
	private String tunwei;
	private String yuejingqingkuang;
	private String jibingshi;
	private String yaopinbaojianpinshiyongqingkuang;
	private String yichuanbingshi;
	private String guominshi;

	@JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Date getAddtime() {
		return addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

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

	public String getMima() {
		return mima;
	}

	public void setMima(String mima) {
		this.mima = mima;
	}

	public String getXingbie() {
		return xingbie;
	}

	public void setXingbie(String xingbie) {
		this.xingbie = xingbie;
	}

	public String getTouxiang() {
		return touxiang;
	}

	public void setTouxiang(String touxiang) {
		this.touxiang = touxiang;
	}

	public String getDianhuahaoma() {
		return dianhuahaoma;
	}

	public void setDianhuahaoma(String dianhuahaoma) {
		this.dianhuahaoma = dianhuahaoma;
	}

	public String getJinjilianxiren() {
		return jinjilianxiren;
	}

	public void setJinjilianxiren(String jinjilianxiren) {
		this.jinjilianxiren = jinjilianxiren;
	}

	public String getXuexing() {
		return xuexing;
	}

	public void setXuexing(String xuexing) {
		this.xuexing = xuexing;
	}

	public String getJinji() {
		return jinji;
	}

	public void setJinji(String jinji) {
		this.jinji = jinji;
	}

	public String getYinjiuqingkuang() {
		return yinjiuqingkuang;
	}

	public void setYinjiuqingkuang(String yinjiuqingkuang) {
		this.yinjiuqingkuang = yinjiuqingkuang;
	}

	public String getXiyanqingkuang() {
		return xiyanqingkuang;
	}

	public void setXiyanqingkuang(String xiyanqingkuang) {
		this.xiyanqingkuang = xiyanqingkuang;
	}

	public String getYundongpinlv() {
		return yundongpinlv;
	}

	public void setYundongpinlv(String yundongpinlv) {
		this.yundongpinlv = yundongpinlv;
	}

	public String getJingshenyali() {
		return jingshenyali;
	}

	public void setJingshenyali(String jingshenyali) {
		this.jingshenyali = jingshenyali;
	}

	public String getShuimianqingkuang() {
		return shuimianqingkuang;
	}

	public void setShuimianqingkuang(String shuimianqingkuang) {
		this.shuimianqingkuang = shuimianqingkuang;
	}

	public String getShengao() {
		return shengao;
	}

	public void setShengao(String shengao) {
		this.shengao = shengao;
	}

	public String getTizhong() {
		return tizhong;
	}

	public void setTizhong(String tizhong) {
		this.tizhong = tizhong;
	}

	public String getBmi() {
		return bmi;
	}

	public void setBmi(String bmi) {
		this.bmi = bmi;
	}

	public String getXiongwei() {
		return xiongwei;
	}

	public void setXiongwei(String xiongwei) {
		this.xiongwei = xiongwei;
	}

	public String getYaowei() {
		return yaowei;
	}

	public void setYaowei(String yaowei) {
		this.yaowei = yaowei;
	}

	public String getTunwei() {
		return tunwei;
	}

	public void setTunwei(String tunwei) {
		this.tunwei = tunwei;
	}

	public String getYuejingqingkuang() {
		return yuejingqingkuang;
	}

	public void setYuejingqingkuang(String yuejingqingkuang) {
		this.yuejingqingkuang = yuejingqingkuang;
	}

	public String getJibingshi() {
		return jibingshi;
	}

	public void setJibingshi(String jibingshi) {
		this.jibingshi = jibingshi;
	}

	public String getYaopinbaojianpinshiyongqingkuang() {
		return yaopinbaojianpinshiyongqingkuang;
	}

	public void setYaopinbaojianpinshiyongqingkuang(String yaopinbaojianpinshiyongqingkuang) {
		this.yaopinbaojianpinshiyongqingkuang = yaopinbaojianpinshiyongqingkuang;
	}

	public String getYichuanbingshi() {
		return yichuanbingshi;
	}

	public void setYichuanbingshi(String yichuanbingshi) {
		this.yichuanbingshi = yichuanbingshi;
	}

	public String getGuominshi() {
		return guominshi;
	}

	public void setGuominshi(String guominshi) {
		this.guominshi = guominshi;
	}
}
