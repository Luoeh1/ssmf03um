const base = {
    get() {
        return {
            url : "http://localhost:8080/ssmf03um/",
            name: "ssmf03um",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/ssmf03um/front/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "社区诊疗与健康档案管理系统"
        } 
    }
}
export default base
