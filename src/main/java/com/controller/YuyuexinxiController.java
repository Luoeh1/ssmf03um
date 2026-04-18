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

import com.entity.YaopinxinxiEntity;
import com.entity.view.YaopinxinxiView;
import com.service.YaopinxinxiService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;

/**
 * 药品信息 / 药单
 * 后端接口
 */
@RestController
@RequestMapping("/yaopinxinxi")
public class YaopinxinxiController {
	@Autowired
	private YaopinxinxiService yaopinxinxiService;

	/**
	 * 后端列表 (管理员/医生/用户在后台查看)
	 */
	@RequestMapping("/page")
	public R page(@RequestParam Map<String, Object> params, YaopinxinxiEntity yaopinxinxi, HttpServletRequest request){
		EntityWrapper<YaopinxinxiEntity> ew = new EntityWrapper<YaopinxinxiEntity>();

		String tableName = (String)request.getSession().getAttribute("tableName");
		String username = (String)request.getSession().getAttribute("username");

		if(tableName != null && tableName.equals("yonghu")) {
			ew.eq("yonghuzhanghao", username); // 病人只能看自己的药单
		}
		if(tableName != null && tableName.equals("yisheng")) {
			ew.eq("yishenggonghao", username); // 医生只能看自己开的
		}

		PageUtils page = yaopinxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yaopinxinxi), params), params));
		return R.ok().put("data", page);
	}

	/**
	 * 前端列表 (用户在网站前台查看)
	 * 注意：这里已经删除了 @IgnoreAuth，并且加上了身份过滤！
	 */
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params, YaopinxinxiEntity yaopinxinxi, HttpServletRequest request){
		EntityWrapper<YaopinxinxiEntity> ew = new EntityWrapper<YaopinxinxiEntity>();

		String tableName = (String)request.getSession().getAttribute("tableName");
		String username = (String)request.getSession().getAttribute("username");

		if(tableName != null && tableName.equals("yonghu")) {
			ew.eq("yonghuzhanghao", username); // 前台病人只能看自己的药单
		}
		if(tableName != null && tableName.equals("yisheng")) {
			ew.eq("yishenggonghao", username);
		}

		PageUtils page = yaopinxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yaopinxinxi), params), params));
		return R.ok().put("data", page);
	}

	@RequestMapping("/lists")
	public R list(YaopinxinxiEntity yaopinxinxi){
		EntityWrapper<YaopinxinxiEntity> ew = new EntityWrapper<YaopinxinxiEntity>();
		ew.allEq(MPUtil.allEQMapPre( yaopinxinxi, "yaopinxinxi"));
		return R.ok().put("data", yaopinxinxiService.selectListView(ew));
	}

	@RequestMapping("/query")
	public R query(YaopinxinxiEntity yaopinxinxi){
		EntityWrapper< YaopinxinxiEntity> ew = new EntityWrapper< YaopinxinxiEntity>();
		ew.allEq(MPUtil.allEQMapPre( yaopinxinxi, "yaopinxinxi"));
		YaopinxinxiView yaopinxinxiView =  yaopinxinxiService.selectView(ew);
		return R.ok("查询成功").put("data", yaopinxinxiView);
	}

	@RequestMapping("/info/{id}")
	public R info(@PathVariable("id") Long id){
		YaopinxinxiEntity yaopinxinxi = yaopinxinxiService.selectById(id);
		return R.ok().put("data", yaopinxinxi);
	}

	@RequestMapping("/detail/{id}")
	public R detail(@PathVariable("id") Long id){
		YaopinxinxiEntity yaopinxinxi = yaopinxinxiService.selectById(id);
		return R.ok().put("data", yaopinxinxi);
	}

	@RequestMapping("/save")
	public R save(@RequestBody YaopinxinxiEntity yaopinxinxi, HttpServletRequest request){
		yaopinxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
		yaopinxinxiService.insert(yaopinxinxi);
		return R.ok();
	}

	@RequestMapping("/add")
	public R add(@RequestBody YaopinxinxiEntity yaopinxinxi, HttpServletRequest request){
		yaopinxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
		yaopinxinxiService.insert(yaopinxinxi);
		return R.ok();
	}

	@RequestMapping("/update")
	public R update(@RequestBody YaopinxinxiEntity yaopinxinxi, HttpServletRequest request){
		yaopinxinxiService.updateById(yaopinxinxi);
		return R.ok();
	}

	@RequestMapping("/delete")
	public R delete(@RequestBody Long[] ids){
		yaopinxinxiService.deleteBatchIds(Arrays.asList(ids));
		return R.ok();
	}
}