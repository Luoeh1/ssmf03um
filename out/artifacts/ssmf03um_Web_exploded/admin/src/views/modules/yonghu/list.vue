<template>
  <div class="patient-page">
    <div v-if="showFlag">
      <el-card shadow="never" class="toolbar-card">
        <el-form :inline="true" :model="searchForm" class="toolbar-form">
          <el-form-item label="患者账号">
            <el-input v-model="searchForm.yonghuzhanghao" clearable placeholder="请输入患者账号" />
          </el-form-item>
          <el-form-item label="患者姓名">
            <el-input v-model="searchForm.yonghuxingming" clearable placeholder="请输入患者姓名" />
          </el-form-item>
          <el-form-item label="联系电话">
            <el-input v-model="searchForm.dianhuahaoma" clearable placeholder="请输入联系电话" />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" icon="el-icon-search" @click="search">查询</el-button>
            <el-button @click="resetSearch">重置</el-button>
          </el-form-item>
          <el-form-item style="float:right; margin-right: 0;">
            <el-button v-if="isAuth('yonghu','新增')" type="success" icon="el-icon-plus" @click="addOrUpdateHandler()">新增患者</el-button>
          </el-form-item>
        </el-form>
      </el-card>

      <el-card shadow="never" class="table-card">
        <el-table :data="dataList" border stripe v-loading="dataListLoading">
          <el-table-column type="index" width="60" label="#" align="center" />
          <el-table-column prop="yonghuzhanghao" label="患者账号" min-width="120" />
          <el-table-column prop="yonghuxingming" label="患者姓名" min-width="120" />
          <el-table-column prop="xingbie" label="性别" width="80" align="center" />
          <el-table-column prop="dianhuahaoma" label="联系电话" min-width="130" />
          <el-table-column prop="xuexing" label="血型" width="90" align="center" />
          <el-table-column prop="bmi" label="BMI" width="90" align="center" />
          <el-table-column prop="xiyanqingkuang" label="吸烟情况" min-width="110" />
          <el-table-column prop="yinjiuqingkuang" label="饮酒情况" min-width="110" />
          <el-table-column prop="shuimianqingkuang" label="睡眠情况" min-width="110" />
          <el-table-column prop="guominshi" label="过敏史" min-width="160" show-overflow-tooltip />
          <el-table-column prop="jibingshi" label="疾病史" min-width="180" show-overflow-tooltip />
          <el-table-column label="操作" width="180" align="center" fixed="right">
            <template slot-scope="scope">
              <el-button size="mini" @click="addOrUpdateHandler(scope.row.id, 'info')">详情</el-button>
              <el-button v-if="isAuth('yonghu','修改')" type="primary" size="mini" @click="addOrUpdateHandler(scope.row.id)">修改</el-button>
            </template>
          </el-table-column>
        </el-table>

        <div class="pager-wrap">
          <el-pagination
            background
            layout="total, sizes, prev, pager, next, jumper"
            :current-page="pageIndex"
            :page-sizes="[10, 20, 50, 100]"
            :page-size="pageSize"
            :total="totalPage"
            @size-change="sizeChangeHandle"
            @current-change="currentChangeHandle"
          />
        </div>
      </el-card>
    </div>

    <add-or-update v-if="addOrUpdateFlag" :parent="this" ref="addOrUpdate" />
  </div>
</template>

<script>
import AddOrUpdate from './add-or-update'

export default {
  components: { AddOrUpdate },
  data() {
    return {
      searchForm: {
        yonghuzhanghao: '',
        yonghuxingming: '',
        dianhuahaoma: ''
      },
      dataList: [],
      pageIndex: 1,
      pageSize: 10,
      totalPage: 0,
      dataListLoading: false,
      showFlag: true,
      addOrUpdateFlag: false
    }
  },
  created() {
    this.getDataList()
  },
  methods: {
    search() {
      this.pageIndex = 1
      this.getDataList()
    },
    resetSearch() {
      this.searchForm = {
        yonghuzhanghao: '',
        yonghuxingming: '',
        dianhuahaoma: ''
      }
      this.search()
    },
    getDataList() {
      this.dataListLoading = true
      const params = {
        page: this.pageIndex,
        limit: this.pageSize,
        sort: 'id',
        order: 'desc'
      }
      if (this.searchForm.yonghuzhanghao) {
        params.yonghuzhanghao = '%' + this.searchForm.yonghuzhanghao + '%'
      }
      if (this.searchForm.yonghuxingming) {
        params.yonghuxingming = '%' + this.searchForm.yonghuxingming + '%'
      }
      if (this.searchForm.dianhuahaoma) {
        params.dianhuahaoma = '%' + this.searchForm.dianhuahaoma + '%'
      }
      this.$http({
        url: 'yonghu/page',
        method: 'get',
        params
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.dataList = data.data.list
          this.totalPage = data.data.total
        } else {
          this.dataList = []
          this.totalPage = 0
        }
        this.dataListLoading = false
      })
    },
    sizeChangeHandle(val) {
      this.pageSize = val
      this.pageIndex = 1
      this.getDataList()
    },
    currentChangeHandle(val) {
      this.pageIndex = val
      this.getDataList()
    },
    addOrUpdateHandler(id, type) {
      this.showFlag = false
      this.addOrUpdateFlag = true
      this.$nextTick(() => {
        this.$refs.addOrUpdate.init(id, type === 'info' ? 'info' : 'edit')
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.patient-page {
  .toolbar-card,
  .table-card {
    border-radius: 16px;
    margin-bottom: 16px;
  }

  .toolbar-form {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
  }

  .pager-wrap {
    margin-top: 20px;
    text-align: right;
  }
}
</style>
