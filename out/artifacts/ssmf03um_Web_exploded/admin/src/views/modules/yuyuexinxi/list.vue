<template>
  <div class="appointment-page">
    <div v-if="showFlag">
      <el-card shadow="never" class="toolbar-card">
        <el-form :inline="true" :model="searchForm" class="toolbar-form">
          <el-form-item label="服务类型">
            <el-input v-model="searchForm.fuwuleixing" clearable placeholder="请输入服务类型" />
          </el-form-item>
          <el-form-item label="用户姓名">
            <el-input v-model="searchForm.yonghuxingming" clearable placeholder="请输入用户姓名" />
          </el-form-item>
          <el-form-item label="医生姓名">
            <el-input v-model="searchForm.yishengxingming" clearable placeholder="请输入医生姓名" />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" icon="el-icon-search" @click="search">查询</el-button>
            <el-button @click="resetSearch">重置</el-button>
          </el-form-item>
        </el-form>
      </el-card>

      <el-card shadow="never" class="table-card">
        <el-table :data="dataList" border stripe v-loading="dataListLoading">
          <el-table-column type="index" width="60" label="#" align="center" />
          <el-table-column prop="yuyuebianhao" label="预约编号" min-width="150" />
          <el-table-column prop="fuwuleixing" label="服务类型" min-width="180">
            <template slot-scope="scope">{{ scope.row.fuwuleixing || scope.row.xiangmumingcheng }}</template>
          </el-table-column>
          <el-table-column prop="shangmendizhi" label="上门地址" min-width="220" show-overflow-tooltip>
            <template slot-scope="scope">{{ scope.row.shangmendizhi || scope.row.xiangmuweizhi }}</template>
          </el-table-column>
          <el-table-column prop="yuyueshijian" label="预约时间" min-width="160" />
          <el-table-column prop="yonghuxingming" label="用户姓名" min-width="110" />
          <el-table-column prop="shouji" label="联系电话" min-width="120" />
          <el-table-column prop="yishengxingming" label="医生姓名" min-width="110" />
          <el-table-column prop="feiyong" label="费用" width="90" align="center" />
          <el-table-column prop="ispay" label="支付状态" width="100" align="center" />
          <el-table-column label="审核状态" width="110" align="center">
            <template slot-scope="scope">
              <el-tag v-if="scope.row.sfsh === '是'" type="success">通过</el-tag>
              <el-tag v-else-if="scope.row.sfsh === '否'" type="danger">不通过</el-tag>
              <el-tag v-else type="warning">待审核</el-tag>
            </template>
          </el-table-column>
          <el-table-column prop="shhf" label="审核回复" min-width="180" show-overflow-tooltip />
          <el-table-column label="操作" min-width="280" align="center" fixed="right">
            <template slot-scope="scope">
              <el-button size="mini" @click="addOrUpdateHandler(scope.row.id, 'info')">详情</el-button>
              <el-button v-if="isAuth('yuyuexinxi','修改')" type="primary" size="mini" @click="addOrUpdateHandler(scope.row.id)">修改</el-button>
              <el-button v-if="isAuth('yuyuexinxi','审核')" type="warning" size="mini" @click="openAudit(scope.row)">审核</el-button>
              <el-button v-if="isAuth('yuyuexinxi','检查')" type="success" size="mini" @click="jianchaxinxiCrossAddOrUpdateHandler(scope.row)">检查</el-button>
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
    <jianchaxinxi-cross-add-or-update v-if="jianchaxinxiCrossAddOrUpdateFlag" :parent="this" ref="jianchaxinxiCrossaddOrUpdate" />

    <el-dialog title="预约审核" :visible.sync="sfshVisiable" width="520px">
      <el-form label-width="90px">
        <el-form-item label="审核状态">
          <el-select v-model="shForm.sfsh" placeholder="请选择审核状态" style="width:100%;">
            <el-option label="通过" value="是" />
            <el-option label="不通过" value="否" />
          </el-select>
        </el-form-item>
        <el-form-item label="审核回复">
          <el-input type="textarea" :rows="5" v-model="shForm.shhf" placeholder="请输入审核意见" />
        </el-form-item>
      </el-form>
      <span slot="footer">
        <el-button @click="sfshVisiable = false">取消</el-button>
        <el-button type="primary" @click="submitAudit">确定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import AddOrUpdate from './add-or-update'
import jianchaxinxiCrossAddOrUpdate from '../jianchaxinxi/add-or-update'

export default {
  components: {
    AddOrUpdate,
    jianchaxinxiCrossAddOrUpdate
  },
  data() {
    return {
      searchForm: {
        fuwuleixing: '',
        yonghuxingming: '',
        yishengxingming: ''
      },
      dataList: [],
      pageIndex: 1,
      pageSize: 10,
      totalPage: 0,
      dataListLoading: false,
      showFlag: true,
      addOrUpdateFlag: false,
      jianchaxinxiCrossAddOrUpdateFlag: false,
      sfshVisiable: false,
      shForm: {}
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
        fuwuleixing: '',
        yonghuxingming: '',
        yishengxingming: ''
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
      if (this.searchForm.fuwuleixing) {
        params.fuwuleixing = '%' + this.searchForm.fuwuleixing + '%'
      }
      if (this.searchForm.yonghuxingming) {
        params.yonghuxingming = '%' + this.searchForm.yonghuxingming + '%'
      }
      if (this.searchForm.yishengxingming) {
        params.yishengxingming = '%' + this.searchForm.yishengxingming + '%'
      }
      this.$http({ url: 'yuyuexinxi/page', method: 'get', params }).then(({ data }) => {
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
    },
    openAudit(row) {
      this.shForm = Object.assign({}, row)
      this.sfshVisiable = true
    },
    submitAudit() {
      this.$http({
        url: 'yuyuexinxi/update',
        method: 'post',
        data: this.shForm
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.$message.success('审核成功')
          this.sfshVisiable = false
          this.getDataList()
        } else {
          this.$message.error(data.msg)
        }
      })
    },
    jianchaxinxiCrossAddOrUpdateHandler(row) {
      if (row.sfsh !== '是') {
        this.$message.warning('请审核通过后再执行检查')
        return
      }
      this.showFlag = false
      this.addOrUpdateFlag = false
      this.jianchaxinxiCrossAddOrUpdateFlag = true
      this.$storage.set('crossObj', row)
      this.$storage.set('crossTable', 'yuyuexinxi')
      this.$storage.set('statusColumnName', '')
      this.$storage.set('statusColumnValue', '')
      this.$storage.set('tips', '')
      this.$nextTick(() => {
        this.$refs.jianchaxinxiCrossaddOrUpdate.init(row.id, 'cross')
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.appointment-page {
  .toolbar-card,
  .table-card {
    border-radius: 16px;
    margin-bottom: 16px;
  }

  .pager-wrap {
    margin-top: 20px;
    text-align: right;
  }
}
</style>
