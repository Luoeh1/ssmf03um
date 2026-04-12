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
 * 预约信息
 * 数据库通用操作实体类（普通增删改查）
 */
@TableName("yuyuexinxi")
public class YuyuexinxiEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;

	public YuyuexinxiEntity() {
	}

	public YuyuexinxiEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	@TableId
	private Long id;
	private String yuyuebianhao;
	private String xiangmumingcheng;
	private String xiangmufenlei;
	private String xiangmuweizhi;

	// 上门预约扩展字段
	private String fuwuleixing;
	private String shangmendizhi;
	private String shouji;
	private String yuyueneirong;

	@JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date yuyueshijian;

	private String yonghuzhanghao;
	private Integer feiyong;
	private String yonghuxingming;
	private String yishenggonghao;
	private String yishengxingming;
	private String sfsh;
	private String shhf;
	private String ispay;

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

	public String getYuyuebianhao() {
		return yuyuebianhao;
	}

	public void setYuyuebianhao(String yuyuebianhao) {
		this.yuyuebianhao = yuyuebianhao;
	}

	public String getXiangmumingcheng() {
		return xiangmumingcheng;
	}

	public void setXiangmumingcheng(String xiangmumingcheng) {
		this.xiangmumingcheng = xiangmumingcheng;
	}

	public String getXiangmufenlei() {
		return xiangmufenlei;
	}

	public void setXiangmufenlei(String xiangmufenlei) {
		this.xiangmufenlei = xiangmufenlei;
	}

	public String getXiangmuweizhi() {
		return xiangmuweizhi;
	}

	public void setXiangmuweizhi(String xiangmuweizhi) {
		this.xiangmuweizhi = xiangmuweizhi;
	}

	public String getFuwuleixing() {
		return fuwuleixing;
	}

	public void setFuwuleixing(String fuwuleixing) {
		this.fuwuleixing = fuwuleixing;
	}

	public String getShangmendizhi() {
		return shangmendizhi;
	}

	public void setShangmendizhi(String shangmendizhi) {
		this.shangmendizhi = shangmendizhi;
	}

	public String getShouji() {
		return shouji;
	}

	public void setShouji(String shouji) {
		this.shouji = shouji;
	}

	public String getYuyueneirong() {
		return yuyueneirong;
	}

	public void setYuyueneirong(String yuyueneirong) {
		this.yuyueneirong = yuyueneirong;
	}

	public Date getYuyueshijian() {
		return yuyueshijian;
	}

	public void setYuyueshijian(Date yuyueshijian) {
		this.yuyueshijian = yuyueshijian;
	}

	public String getYonghuzhanghao() {
		return yonghuzhanghao;
	}

	public void setYonghuzhanghao(String yonghuzhanghao) {
		this.yonghuzhanghao = yonghuzhanghao;
	}

	public Integer getFeiyong() {
		return feiyong;
	}

	public void setFeiyong(Integer feiyong) {
		this.feiyong = feiyong;
	}

	public String getYonghuxingming() {
		return yonghuxingming;
	}

	public void setYonghuxingming(String yonghuxingming) {
		this.yonghuxingming = yonghuxingming;
	}

	public String getYishenggonghao() {
		return yishenggonghao;
	}

	public void setYishenggonghao(String yishenggonghao) {
		this.yishenggonghao = yishenggonghao;
	}

	public String getYishengxingming() {
		return yishengxingming;
	}

	public void setYishengxingming(String yishengxingming) {
		this.yishengxingming = yishengxingming;
	}

	public String getSfsh() {
		return sfsh;
	}

	public void setSfsh(String sfsh) {
		this.sfsh = sfsh;
	}

	public String getShhf() {
		return shhf;
	}

	public void setShhf(String shhf) {
		this.shhf = shhf;
	}

	public String getIspay() {
		return ispay;
	}

	public void setIspay(String ispay) {
		this.ispay = ispay;
	}
}
