<template>
  <div class="main-content">
    <el-form :inline="true" :model="searchForm" class="form-content">
      <el-form-item label="用户姓名">
        <el-input v-model="searchForm.yonghuxingming" placeholder="输入用户姓名" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="search()">查询</el-button>
        <el-button type="primary" @click="addOrUpdateHandler()">新增档案</el-button>
        <el-button type="danger" @click="deleteHandler()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
      </el-form-item>
    </el-form>

    <el-table :data="dataList" border v-loading="dataListLoading" @selection-change="selectionChangeHandler" style="width: 100%;">
      <el-table-column type="selection" header-align="center" align="center" width="50"></el-table-column>
      <el-table-column prop="yonghuzhanghao" header-align="center" align="center" label="用户账号"></el-table-column>
      <el-table-column prop="yonghuxingming" header-align="center" align="center" label="用户姓名"></el-table-column>
      <el-table-column prop="xingbie" header-align="center" align="center" label="性别" width="80"></el-table-column>
      <el-table-column prop="nianling" header-align="center" align="center" label="年龄" width="80"></el-table-column>
      <el-table-column prop="xuexing" header-align="center" align="center" label="血型" width="80"></el-table-column>
      <el-table-column prop="guominshi" header-align="center" align="center" label="过敏史" show-overflow-tooltip></el-table-column>
      <el-table-column prop="addtime" header-align="center" align="center" label="创建时间" width="160"></el-table-column>

      <el-table-column fixed="right" header-align="center" align="center" width="150" label="操作">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="addOrUpdateHandler(scope.row.id)">修改</el-button>
          <el-button type="text" size="small" @click="deleteHandler(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination
        @size-change="sizeChangeHandle"
        @current-change="currentChangeHandle"
        :current-page="pageIndex"
        :page-sizes="[10, 20, 50, 100]"
        :page-size="pageSize"
        :total="totalPage"
        layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>

    <add-or-update v-if="addOrUpdateFlag" ref="addOrUpdate" @refreshDataList="getDataList"></add-or-update>
  </div>
</template>

<script>
import AddOrUpdate from "./add-or-update"; // 引入下面我们要写的表单组件

export default {
  data() {
    return {
      searchForm: {
        yonghuxingming: ''
      },
      dataList: [],
      pageIndex: 1,
      pageSize: 10,
      totalPage: 0,
      dataListLoading: false,
      dataListSelections: [],
      addOrUpdateFlag: false,
    };
  },
  components: {
    AddOrUpdate
  },
  activated() {
    this.getDataList();
  },
  methods: {
    // 搜索
    search() {
      this.pageIndex = 1;
      this.getDataList();
    },
    // 获取数据列表
    getDataList() {
      this.dataListLoading = true;
      let params = {
        page: this.pageIndex,
        limit: this.pageSize,
        sort: 'id',
      }
      if(this.searchForm.yonghuxingming != '' && this.searchForm.yonghuxingming != undefined){
        params['yonghuxingming'] = '%' + this.searchForm.yonghuxingming + '%'
      }
      // 调用我们刚写的后端接口
      this.$http({
        url: "jiankangdangan/page",
        method: "get",
        params: params
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.dataList = data.data.list;
          this.totalPage = data.data.total;
        } else {
          this.dataList = [];
          this.totalPage = 0;
        }
        this.dataListLoading = false;
      });
    },
    // 每页数
    sizeChangeHandle(val) {
      this.pageSize = val;
      this.pageIndex = 1;
      this.getDataList();
    },
    // 当前页
    currentChangeHandle(val) {
      this.pageIndex = val;
      this.getDataList();
    },
    // 多选
    selectionChangeHandler(val) {
      this.dataListSelections = val;
    },
    // 新增 / 修改 弹窗
    addOrUpdateHandler(id) {
      this.addOrUpdateFlag = true;
      this.$nextTick(() => {
        this.$refs.addOrUpdate.init(id);
      });
    },
    // 删除
    deleteHandler(id) {
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.id;
      });
      this.$confirm(`确定进行[${id ? "删除" : "批量删除"}]操作?`, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.$http({
          url: "jiankangdangan/delete",
          method: "post",
          data: ids
        }).then(({ data }) => {
          if (data && data.code === 0) {
            this.$message({
              message: "操作成功",
              type: "success",
              duration: 1500,
              onClose: () => {
                this.search();
              }
            });
          } else {
            this.$message.error(data.msg);
          }
        });
      });
    }
  }
};
</script>
<style lang="scss" scoped>
</style>