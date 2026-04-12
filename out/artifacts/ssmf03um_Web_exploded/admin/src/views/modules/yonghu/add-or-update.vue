<template>
  <div class="addEdit-block">
    <el-card shadow="never" class="form-card">
      <div slot="header" class="clearfix">
        <span>{{ type === 'info' ? '患者健康档案详情' : (ruleForm.id ? '编辑患者健康档案' : '新增患者健康档案') }}</span>
      </div>

      <el-form ref="ruleForm" :model="ruleForm" :rules="rules" label-width="120px" class="detail-form-content">
        <div class="section-title">基础资料</div>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="患者账号" prop="yonghuzhanghao">
              <el-input v-model="ruleForm.yonghuzhanghao" :readonly="isInfo" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="患者姓名" prop="yonghuxingming">
              <el-input v-model="ruleForm.yonghuxingming" :readonly="isInfo" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="登录密码" prop="mima">
              <el-input v-model="ruleForm.mima" :readonly="isInfo" show-password />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="性别" prop="xingbie">
              <el-select v-model="ruleForm.xingbie" :disabled="isInfo" placeholder="请选择性别" style="width:100%;">
                <el-option label="男" value="男" />
                <el-option label="女" value="女" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="联系电话" prop="dianhuahaoma">
              <el-input v-model="ruleForm.dianhuahaoma" :readonly="isInfo" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="紧急联系人" prop="jinjilianxiren">
              <el-input v-model="ruleForm.jinjilianxiren" :readonly="isInfo" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="血型" prop="xuexing">
              <el-input v-model="ruleForm.xuexing" :readonly="isInfo" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="禁忌" prop="jinji">
              <el-input v-model="ruleForm.jinji" :readonly="isInfo" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="头像">
              <file-upload
                v-if="!isInfo"
                tip="点击上传头像"
                action="file/upload"
                :limit="1"
                :multiple="false"
                :fileUrls="ruleForm.touxiang || ''"
                @change="file => ruleForm.touxiang = file"
              />
              <div v-else-if="ruleForm.touxiang">
                <img :src="$base.url + ruleForm.touxiang.split(',')[0]" class="avatar-preview">
              </div>
            </el-form-item>
          </el-col>
        </el-row>

        <div class="section-title">生活方式与体征</div>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="饮酒情况"><el-select v-model="ruleForm.yinjiuqingkuang" :disabled="isInfo" style="width:100%;"><el-option label="从不饮酒" value="从不饮酒" /><el-option label="偶尔饮酒" value="偶尔饮酒" /><el-option label="每周饮酒" value="每周饮酒" /><el-option label="经常饮酒" value="经常饮酒" /></el-select></el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="吸烟情况"><el-select v-model="ruleForm.xiyanqingkuang" :disabled="isInfo" style="width:100%;"><el-option label="从不吸烟" value="从不吸烟" /><el-option label="已戒烟" value="已戒烟" /><el-option label="偶尔吸烟" value="偶尔吸烟" /><el-option label="经常吸烟" value="经常吸烟" /></el-select></el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="运动频率"><el-select v-model="ruleForm.yundongpinlv" :disabled="isInfo" style="width:100%;"><el-option label="几乎不运动" value="几乎不运动" /><el-option label="每周1-2次" value="每周1-2次" /><el-option label="每周3-5次" value="每周3-5次" /><el-option label="几乎每天" value="几乎每天" /></el-select></el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="精神压力"><el-select v-model="ruleForm.jingshenyali" :disabled="isInfo" style="width:100%;"><el-option label="低" value="低" /><el-option label="中" value="中" /><el-option label="高" value="高" /></el-select></el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="睡眠情况"><el-select v-model="ruleForm.shuimianqingkuang" :disabled="isInfo" style="width:100%;"><el-option label="良好" value="良好" /><el-option label="一般" value="一般" /><el-option label="较差" value="较差" /><el-option label="长期失眠" value="长期失眠" /></el-select></el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="BMI"><el-input v-model="ruleForm.bmi" readonly /></el-form-item>
          </el-col>
          <el-col :span="8"><el-form-item label="身高(cm)"><el-input v-model="ruleForm.shengao" :readonly="isInfo" @input="calcBmi" /></el-form-item></el-col>
          <el-col :span="8"><el-form-item label="体重(kg)"><el-input v-model="ruleForm.tizhong" :readonly="isInfo" @input="calcBmi" /></el-form-item></el-col>
          <el-col :span="8"><el-form-item label="胸围(cm)"><el-input v-model="ruleForm.xiongwei" :readonly="isInfo" /></el-form-item></el-col>
          <el-col :span="8"><el-form-item label="腰围(cm)"><el-input v-model="ruleForm.yaowei" :readonly="isInfo" /></el-form-item></el-col>
          <el-col :span="8"><el-form-item label="臀围(cm)"><el-input v-model="ruleForm.tunwei" :readonly="isInfo" /></el-form-item></el-col>
          <el-col :span="24"><el-form-item label="月经情况"><el-input type="textarea" :rows="3" v-model="ruleForm.yuejingqingkuang" :readonly="isInfo" placeholder="女性选填" /></el-form-item></el-col>
        </el-row>

        <div class="section-title">病史与用药</div>
        <el-row :gutter="20">
          <el-col :span="24"><el-form-item label="疾病史"><el-input type="textarea" :rows="4" v-model="ruleForm.jibingshi" :readonly="isInfo" /></el-form-item></el-col>
          <el-col :span="24"><el-form-item label="药品保健品"><el-input type="textarea" :rows="4" v-model="ruleForm.yaopinbaojianpinshiyongqingkuang" :readonly="isInfo" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="遗传病史"><el-input type="textarea" :rows="4" v-model="ruleForm.yichuanbingshi" :readonly="isInfo" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="过敏史"><el-input type="textarea" :rows="4" v-model="ruleForm.guominshi" :readonly="isInfo" /></el-form-item></el-col>
        </el-row>

        <el-form-item class="btn-wrap">
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
        callback()
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
        yonghuzhanghao: '',
        yonghuxingming: '',
        mima: '',
        xingbie: '',
        touxiang: '',
        dianhuahaoma: '',
        jinjilianxiren: '',
        xuexing: '',
        jinji: '',
        yinjiuqingkuang: '',
        xiyanqingkuang: '',
        yundongpinlv: '',
        jingshenyali: '',
        shuimianqingkuang: '',
        shengao: '',
        tizhong: '',
        bmi: '',
        xiongwei: '',
        yaowei: '',
        tunwei: '',
        yuejingqingkuang: '',
        jibingshi: '',
        yaopinbaojianpinshiyongqingkuang: '',
        yichuanbingshi: '',
        guominshi: ''
      },
      rules: {
        yonghuzhanghao: [{ required: true, message: '患者账号不能为空', trigger: 'blur' }],
        yonghuxingming: [{ required: true, message: '患者姓名不能为空', trigger: 'blur' }],
        mima: [{ required: true, message: '登录密码不能为空', trigger: 'blur' }],
        dianhuahaoma: [{ validator: validateMobile, trigger: 'blur' }],
        jinjilianxiren: [{ validator: validateMobile, trigger: 'blur' }]
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
      this.$http({
        url: `yonghu/info/${id}`,
        method: 'get'
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.ruleForm = Object.assign({}, this.ruleForm, data.data)
          this.calcBmi()
        } else {
          this.$message.error(data.msg)
        }
      })
    },
    calcBmi() {
      const height = parseFloat(this.ruleForm.shengao)
      const weight = parseFloat(this.ruleForm.tizhong)
      if (!height || !weight || height <= 0) {
        this.ruleForm.bmi = ''
        return
      }
      this.ruleForm.bmi = (weight / Math.pow(height / 100, 2)).toFixed(1)
    },
    onSubmit() {
      this.calcBmi()
      if (this.ruleForm.touxiang) {
        this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url, 'g'), '')
      }
      this.$refs.ruleForm.validate(valid => {
        if (!valid) {
          return
        }
        this.$http({
          url: `yonghu/${!this.ruleForm.id ? 'save' : 'update'}`,
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
.section-title {
  margin: 6px 0 18px;
  font-size: 16px;
  font-weight: 700;
  color: #0f172a;
  padding-left: 12px;
  border-left: 4px solid #0f766e;
}
.avatar-preview {
  width: 96px;
  height: 96px;
  border-radius: 16px;
  object-fit: cover;
}
.btn-wrap {
  margin-top: 16px;
}
</style>
