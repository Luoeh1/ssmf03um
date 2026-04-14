package com.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.JiankangdanganEntity;
import com.entity.view.JiankangdanganView;

import com.service.JiankangdanganService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.CommonUtil;

/**
 * 居民健康档案
 * 后端接口
 */
@RestController
@RequestMapping("/jiankangdangan")
public class JiankangdanganController {

    @Autowired
    private JiankangdanganService jiankangdanganService;

    /**
     * 后端列表查询 (带分页和条件过滤)
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,JiankangdanganEntity jiankangdangan,
                  HttpServletRequest request){

        // 权限判断：如果当前登录的是普通用户，只能看到自己的健康档案
        String tableName = request.getSession().getAttribute("tableName").toString();
        if(tableName.equals("yonghu")) {
            jiankangdangan.setYonghuzhanghao((String)request.getSession().getAttribute("username"));
        }

        EntityWrapper<JiankangdanganEntity> ew = new EntityWrapper<JiankangdanganEntity>();
        PageUtils page = jiankangdanganService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiankangdangan), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 前端列表查询
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,JiankangdanganEntity jiankangdangan,
                  HttpServletRequest request){
        EntityWrapper<JiankangdanganEntity> ew = new EntityWrapper<JiankangdanganEntity>();
        PageUtils page = jiankangdanganService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiankangdangan), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 查询单条记录详情
     */
    @RequestMapping("/query")
    public R query(JiankangdanganEntity jiankangdangan){
        EntityWrapper< JiankangdanganEntity> ew = new EntityWrapper< JiankangdanganEntity>();
        ew.allEq(MPUtil.allEQMapPre( jiankangdangan, "jiankangdangan"));
        JiankangdanganView jiankangdanganView =  jiankangdanganService.selectView(ew);
        return R.ok("查询居民健康档案成功").put("data", jiankangdanganView);
    }

    /**
     * 获取详情信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        JiankangdanganEntity jiankangdangan = jiankangdanganService.selectById(id);
        return R.ok().put("data", jiankangdangan);
    }

    /**
     * 保存新增记录
     */
    @RequestMapping("/save")
    public R save(@RequestBody JiankangdanganEntity jiankangdangan, HttpServletRequest request){
        // 生成主键ID
        jiankangdangan.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
        jiankangdanganService.insert(jiankangdangan);
        return R.ok();
    }

    /**
     * 修改记录
     */
    @RequestMapping("/update")
    public R update(@RequestBody JiankangdanganEntity jiankangdangan, HttpServletRequest request){
        jiankangdanganService.updateById(jiankangdangan); // 全部更新
        return R.ok();
    }

    /**
     * 批量删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        jiankangdanganService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
}