var projectName = '社区诊疗与健康档案管理系统';

/**
 * 轮播图配置
 */
var swiper = {
    width: '100%',
    height: '420px',
    arrow: 'hover',
    anim: 'fade',
    interval: 3500,
    indicator: 'inside'
}

function normalizeUserTable(tableName, fallback) {
    fallback = fallback || 'yonghu';
    if (!tableName || tableName === 'null' || tableName === 'undefined') {
        return fallback;
    }
    return tableName;
}

var currentUserTable = normalizeUserTable(localStorage.getItem('userTable'), '');
currentUserTable = normalizeUserTable(currentUserTable, localStorage.getItem('sessionTable'));
currentUserTable = normalizeUserTable(currentUserTable, 'yonghu');

/**
 * 个人中心菜单
 */
var centerMenu = [
    {
        name: '个人中心',
        url: '../' + currentUserTable + '/center.html'
    },
    {
        name: '预约上门',
        url: '../yuyuexinxi/list.html'
    },
    {
        name: '我的检查',
        url: '../jianchaxinxi/list.html'
    },
    {
        name: '检查报告',
        url: '../jianchabaogao/list.html'
    },
    {
        name: '电子病历',
        url: '../dianzibingli/list.html'
    }
]

if (currentUserTable === 'yisheng') {
    centerMenu.splice(1, 0, {
        name: '患者信息',
        url: '../yonghu/list.html'
    });
}

var indexNav = [
    {
        name: '社区医生',
        url: './pages/yisheng/list.html'
    },
    {
        name: '预约上门',
        url: './pages/yuyuexinxi/add.html'
    },
    {
        name: '社区公告',
        url: './pages/news/list.html'
    },
]

var adminurl =  "http://localhost:8080/ssmf03um/admin/dist/index.html";

var cartFlag = false

var chatFlag = false

var menu = [
    {
        "backMenu": [
            { "child": [{ "appFrontIcon": "cuIcon-phone", "buttons": ["新增", "查看", "修改", "删除"], "menu": "用户", "menuJump": "列表", "tableName": "yonghu" }], "menu": "用户管理" },
            { "child": [{ "appFrontIcon": "cuIcon-wenzi", "buttons": ["新增", "查看", "修改", "删除"], "menu": "医生", "menuJump": "列表", "tableName": "yisheng" }], "menu": "医生管理" },
            { "child": [{ "appFrontIcon": "cuIcon-camera", "buttons": ["新增", "查看", "修改", "删除"], "menu": "诊疗分类", "menuJump": "列表", "tableName": "xiangmufenlei" }], "menu": "诊疗分类管理" },
            { "child": [{ "appFrontIcon": "cuIcon-news", "buttons": ["新增", "查看", "修改", "删除"], "menu": "上门服务", "menuJump": "列表", "tableName": "xiangmuxinxi" }], "menu": "社区服务管理" },
            { "child": [{ "appFrontIcon": "cuIcon-keyboard", "buttons": ["查看", "修改", "删除"], "menu": "预约上门", "menuJump": "列表", "tableName": "yuyuexinxi" }], "menu": "预约上门管理" },
            { "child": [{ "appFrontIcon": "cuIcon-present", "buttons": ["查看", "修改", "删除"], "menu": "检查信息", "menuJump": "列表", "tableName": "jianchaxinxi" }], "menu": "检查信息管理" },
            { "child": [{ "appFrontIcon": "cuIcon-goodsnew", "buttons": ["查看", "修改", "删除"], "menu": "检查报告", "menuJump": "列表", "tableName": "jianchabaogao" }], "menu": "检查报告管理" },
            { "child": [{ "appFrontIcon": "cuIcon-circle", "buttons": ["新增", "查看", "修改", "删除"], "menu": "药品分类", "menuJump": "列表", "tableName": "yaopinfenlei" }], "menu": "药品分类管理" },
            { "child": [{ "appFrontIcon": "cuIcon-vipcard", "buttons": ["查看", "修改", "删除"], "menu": "药品信息", "menuJump": "列表", "tableName": "yaopinxinxi" }], "menu": "药品信息管理" },
            { "child": [{ "appFrontIcon": "cuIcon-vipcard", "buttons": ["查看", "修改", "删除"], "menu": "电子病例", "menuJump": "列表", "tableName": "dianzibingli" }], "menu": "电子病例管理" },
            { "child": [{ "appFrontIcon": "cuIcon-taxi", "buttons": ["查看", "修改", "删除"], "menu": "轮播图管理", "tableName": "config" }, { "appFrontIcon": "cuIcon-news", "buttons": ["新增", "查看", "修改", "删除"], "menu": "社区公告", "tableName": "news" }], "menu": "系统管理" }
        ],
        "frontMenu": [
            { "child": [{ "appFrontIcon": "cuIcon-goodsnew", "buttons": ["查看", "立即预约"], "menu": "上门服务列表", "menuJump": "列表", "tableName": "xiangmuxinxi" }], "menu": "上门服务模块" }
        ],
        "hasBackLogin": "是",
        "hasBackRegister": "否",
        "hasFrontLogin": "否",
        "hasFrontRegister": "否",
        "roleName": "管理员",
        "tableName": "users"
    },
    {
        "backMenu": [
            { "child": [{ "appFrontIcon": "cuIcon-keyboard", "buttons": ["查看", "支付"], "menu": "预约上门", "menuJump": "列表", "tableName": "yuyuexinxi" }], "menu": "预约上门管理" },
            { "child": [{ "appFrontIcon": "cuIcon-present", "buttons": ["查看"], "menu": "检查信息", "menuJump": "列表", "tableName": "jianchaxinxi" }], "menu": "检查信息管理" },
            { "child": [{ "appFrontIcon": "cuIcon-goodsnew", "buttons": ["查看"], "menu": "检查报告", "menuJump": "列表", "tableName": "jianchabaogao" }], "menu": "检查报告管理" },
            { "child": [{ "appFrontIcon": "cuIcon-vipcard", "buttons": ["查看", "支付"], "menu": "药品信息", "menuJump": "列表", "tableName": "yaopinxinxi" }], "menu": "药品信息管理" },
            { "child": [{ "appFrontIcon": "cuIcon-vipcard", "buttons": ["查看"], "menu": "电子病例", "menuJump": "列表", "tableName": "dianzibingli" }], "menu": "电子病例管理" }
        ],
        "frontMenu": [
            { "child": [{ "appFrontIcon": "cuIcon-goodsnew", "buttons": ["查看", "立即预约"], "menu": "上门服务列表", "menuJump": "列表", "tableName": "xiangmuxinxi" }], "menu": "上门服务模块" }
        ],
        "hasBackLogin": "否",
        "hasBackRegister": "否",
        "hasFrontLogin": "是",
        "hasFrontRegister": "是",
        "roleName": "用户",
        "tableName": "yonghu"
    },
    {
        "backMenu": [
            { "child": [{ "appFrontIcon": "cuIcon-phone", "buttons": ["查看", "修改"], "menu": "患者信息", "menuJump": "列表", "tableName": "yonghu" }], "menu": "患者档案管理" },
            { "child": [{ "appFrontIcon": "cuIcon-keyboard", "buttons": ["查看", "审核", "检查"], "menu": "预约上门", "menuJump": "列表", "tableName": "yuyuexinxi" }], "menu": "预约上门管理" },
            { "child": [{ "appFrontIcon": "cuIcon-present", "buttons": ["查看", "检查报告"], "menu": "检查信息", "menuJump": "列表", "tableName": "jianchaxinxi" }], "menu": "检查信息管理" },
            { "child": [{ "appFrontIcon": "cuIcon-goodsnew", "buttons": ["查看", "打印", "开药"], "menu": "检查报告", "menuJump": "列表", "tableName": "jianchabaogao" }], "menu": "检查报告管理" },
            { "child": [{ "appFrontIcon": "cuIcon-vipcard", "buttons": ["查看"], "menu": "药品信息", "menuJump": "列表", "tableName": "yaopinxinxi" }], "menu": "药品信息管理" },
            { "child": [{ "appFrontIcon": "cuIcon-vipcard", "buttons": ["新增", "查看", "修改", "删除"], "menu": "电子病例", "menuJump": "列表", "tableName": "dianzibingli" }], "menu": "电子病例管理" }
        ],
        "frontMenu": [
            { "child": [{ "appFrontIcon": "cuIcon-goodsnew", "buttons": ["查看", "立即预约"], "menu": "上门服务列表", "menuJump": "列表", "tableName": "xiangmuxinxi" }], "menu": "上门服务模块" }
        ],
        "hasBackLogin": "是",
        "hasBackRegister": "是",
        "hasFrontLogin": "否",
        "hasFrontRegister": "否",
        "roleName": "医生",
        "tableName": "yisheng"
    }
]


var isAuth = function (tableName,key) {
    let role = localStorage.getItem("userTable");
    let menus = menu;
    for(let i=0;i<menus.length;i++){
        if(menus[i].tableName==role){
            for(let j=0;j<menus[i].backMenu.length;j++){
                for(let k=0;k<menus[i].backMenu[j].child.length;k++){
                    if(tableName==menus[i].backMenu[j].child[k].tableName){
                        let buttons = menus[i].backMenu[j].child[k].buttons.join(',');
                        return buttons.indexOf(key) !== -1 || false
                    }
                }
            }
        }
    }
    return false;
}

var isFrontAuth = function (tableName,key) {
    let role = localStorage.getItem("userTable");
    let menus = menu;
    for(let i=0;i<menus.length;i++){
        if(menus[i].tableName==role){
            for(let j=0;j<menus[i].frontMenu.length;j++){
                for(let k=0;k<menus[i].frontMenu[j].child.length;k++){
                    if(tableName==menus[i].frontMenu[j].child[k].tableName){
                        let buttons = menus[i].frontMenu[j].child[k].buttons.join(',');
                        return buttons.indexOf(key) !== -1 || false
                    }
                }
            }
        }
    }
    return false;
}
