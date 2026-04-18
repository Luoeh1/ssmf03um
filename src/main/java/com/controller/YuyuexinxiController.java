package com.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.YuyuexinxiEntity;
import com.entity.view.YuyuexinxiView;
import com.service.YuyuexinxiService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;

/**
 * 预约信息
 * 后端接口
 */
@RestController
@RequestMapping("/yuyuexinxi")
public class YuyuexinxiController {
	@Autowired
	private YuyuexinxiService yuyuexinxiService;

	@RequestMapping("/page")
	public R page(@RequestParam Map<String, Object> params, YuyuexinxiEntity yuyuexinxi, HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		EntityWrapper<YuyuexinxiEntity> ew = new EntityWrapper<YuyuexinxiEntity>();

		if(tableName.equals("yisheng")) {
			ew.eq("yishenggonghao", (String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("yonghu")) {
			ew.eq("yonghuzhanghao", (String)request.getSession().getAttribute("username"));
		}

		PageUtils page = yuyuexinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yuyuexinxi), params), params));
		return R.ok().put("data", page);
	}

	@IgnoreAuth
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params,YuyuexinxiEntity yuyuexinxi, HttpServletRequest request){
		EntityWrapper<YuyuexinxiEntity> ew = new EntityWrapper<YuyuexinxiEntity>();
		PageUtils page = yuyuexinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yuyuexinxi), params), params));
		return R.ok().put("data", page);
	}

	@RequestMapping("/info/{id}")
	public R info(@PathVariable("id") Long id){
		YuyuexinxiEntity yuyuexinxi = yuyuexinxiService.selectById(id);
		return R.ok().put("data", yuyuexinxi);
	}

	@RequestMapping("/save")
	public R save(@RequestBody YuyuexinxiEntity yuyuexinxi, HttpServletRequest request){
		yuyuexinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
		yuyuexinxiService.insert(yuyuexinxi);
		return R.ok();
	}

	@RequestMapping("/update")
	public R update(@RequestBody YuyuexinxiEntity yuyuexinxi, HttpServletRequest request){
		yuyuexinxiService.updateById(yuyuexinxi);
		return R.ok();
	}

	@RequestMapping("/delete")
	public R delete(@RequestBody Long[] ids){
		yuyuexinxiService.deleteBatchIds(Arrays.asList(ids));
		return R.ok();
	}
}