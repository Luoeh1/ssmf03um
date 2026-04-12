<template>
  <div class="addEdit-block">
    <el-card shadow="never" class="form-card">
      <div slot="header">{{ type === 'info' ? '预约上门详情' : '编辑预约上门' }}</div>
      <el-form ref="ruleForm" :model="ruleForm" :rules="rules" label-width="110px" class="detail-form-content">
        <el-row :gutter="20">
          <el-col :span="12"><el-form-item label="预约编号"><el-input v-model="ruleForm.yuyuebianhao" readonly /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="服务类型" prop="fuwuleixing"><el-select v-model="ruleForm.fuwuleixing" :disabled="isInfo" style="width:100%;"><el-option label="老年人健康体检" value="老年人健康体检" /><el-option label="慢病随访（高血压、糖尿病）" value="慢病随访（高血压、糖尿病）" /><el-option label="孕产妇社区随访" value="孕产妇社区随访" /></el-select></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="预约时间" prop="yuyueshijian"><el-date-picker v-model="ruleForm.yuyueshijian" type="datetime" value-format="yyyy-MM-dd HH:mm:ss" :readonly="isInfo" style="width:100%;" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="费用"><el-input v-model="ruleForm.feiyong" :readonly="isInfo" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="用户账号"><el-input v-model="ruleForm.yonghuzhanghao" :readonly="isInfo" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="用户姓名"><el-input v-model="ruleForm.yonghuxingming" :readonly="isInfo" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="联系电话" prop="shouji"><el-input v-model="ruleForm.shouji" :readonly="isInfo" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="医生姓名"><el-input v-model="ruleForm.yishengxingming" :readonly="isInfo" /></el-form-item></el-col>
          <el-col :span="24"><el-form-item label="上门地址" prop="shangmendizhi"><el-input type="textarea" :rows="3" v-model="ruleForm.shangmendizhi" :readonly="isInfo" /></el-form-item></el-col>
          <el-col :span="24"><el-form-item label="需求说明"><el-input type="textarea" :rows="4" v-model="ruleForm.yuyueneirong" :readonly="isInfo" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="审核状态"><el-input v-model="ruleForm.sfsh" readonly /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="支付状态"><el-input v-model="ruleForm.ispay" readonly /></el-form-item></el-col>
          <el-col :span="24"><el-form-item label="审核回复"><el-input type="textarea" :rows="3" v-model="ruleForm.shhf" readonly /></el-form-item></el-col>
        </el-row>
        <el-form-item>
          <el-button v-if="!isInfo" type="primary" @click="onSubmit">保存</el-button>
          <el-button @click="back">{{ isInfo ? '返回' : '取消' }}</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
import { isMobile } from '@/utils/validate'

export default {
  props: ['parent'],
  data() {
    const validateMobile = (rule, value, callback) => {
      if (!value) {
        callback(new Error('联系电话不能为空'))
      } else if (!isMobile(value)) {
        callback(new Error('请输入正确的手机号码'))
      } else {
        callback()
      }
    }
    return {
      id: '',
      type: 'edit',
      ruleForm: {
        yuyuebianhao: '',
        fuwuleixing: '',
        xiangmumingcheng: '',
        xiangmufenlei: '预约上门',
        xiangmuweizhi: '',
        shangmendizhi: '',
        yuyueshijian: '',
        yonghuzhanghao: '',
        yonghuxingming: '',
        shouji: '',
        yuyueneirong: '',
        feiyong: '',
        yishenggonghao: '',
        yishengxingming: '',
        sfsh: '',
        shhf: '',
        ispay: ''
      },
      rules: {
        fuwuleixing: [{ required: true, message: '请选择服务类型', trigger: 'change' }],
        shangmendizhi: [{ required: true, message: '请填写上门地址', trigger: 'blur' }],
        shouji: [{ validator: validateMobile, trigger: 'blur' }]
      }
    }
  },
  computed: {
    isInfo() {
      return this.type === 'info'
    }
  },
  methods: {
    init(id, type) {
      this.id = id || ''
      this.type = type || 'edit'
      if (id) {
        this.info(id)
      }
    },
    info(id) {
      this.$http({ url: `yuyuexinxi/info/${id}`, method: 'get' }).then(({ data }) => {
        if (data && data.code === 0) {
          const detail = Object.assign({}, this.ruleForm, data.data)
          detail.fuwuleixing = detail.fuwuleixing || detail.xiangmumingcheng || ''
          detail.shangmendizhi = detail.shangmendizhi || detail.xiangmuweizhi || ''
          this.ruleForm = detail
        } else {
          this.$message.error(data.msg)
        }
      })
    },
    onSubmit() {
      this.ruleForm.xiangmumingcheng = this.ruleForm.fuwuleixing
      this.ruleForm.xiangmufenlei = '预约上门'
      this.ruleForm.xiangmuweizhi = this.ruleForm.shangmendizhi
      this.$refs.ruleForm.validate(valid => {
        if (!valid) {
          return
        }
        this.$http({
          url: 'yuyuexinxi/update',
          method: 'post',
          data: this.ruleForm
        }).then(({ data }) => {
          if (data && data.code === 0) {
            this.$message.success('保存成功')
            this.parent.showFlag = true
            this.parent.addOrUpdateFlag = false
            this.parent.getDataList()
          } else {
            this.$message.error(data.msg)
          }
        })
      })
    },
    back() {
      this.parent.showFlag = true
      this.parent.addOrUpdateFlag = false
    }
  }
}
</script>

<style lang="scss" scoped>
.form-card {
  border-radius: 16px;
}
</style>
