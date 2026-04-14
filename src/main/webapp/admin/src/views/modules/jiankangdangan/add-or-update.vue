<template>
  <el-dialog
      :title="!dataForm.id ? '新增居民健康档案' : '修改居民健康档案'"
      :close-on-click-modal="false"
      :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" label-width="120px">

      <el-row>
        <el-col :span="12">
          <el-form-item label="用户账号" prop="yonghuzhanghao">
            <el-input v-model="dataForm.yonghuzhanghao" placeholder="请输入关联的用户账号" clearable></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="用户姓名" prop="yonghuxingming">
            <el-input v-model="dataForm.yonghuxingming" placeholder="请输入用户姓名" clearable></el-input>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :span="12">
          <el-form-item label="性别" prop="xingbie">
            <el-select v-model="dataForm.xingbie" placeholder="请选择性别" clearable style="width: 100%;">
              <el-option label="男" value="男"></el-option>
              <el-option label="女" value="女"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="年龄" prop="nianling">
            <el-input v-model.number="dataForm.nianling" placeholder="请输入年龄" clearable></el-input>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :span="12">
          <el-form-item label="血型" prop="xuexing">
            <el-select v-model="dataForm.xuexing" placeholder="请选择血型" clearable style="width: 100%;">
              <el-option label="A型" value="A型"></el-option>
              <el-option label="B型" value="B型"></el-option>
              <el-option label="AB型" value="AB型"></el-option>
              <el-option label="O型" value="O型"></el-option>
              <el-option label="未知" value="未知"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>

      <el-form-item label="过敏史" prop="guominshi">
        <el-input type="textarea" :rows="2" v-model="dataForm.guominshi" placeholder="请输入过敏史（如无，请填'无'）"></el-input>
      </el-form-item>

      <el-form-item label="既往病史" prop="jiwangbingshi">
        <el-input type="textarea" :rows="2" v-model="dataForm.jiwangbingshi" placeholder="请输入既往病史（如高血压、糖尿病等）"></el-input>
      </el-form-item>

      <el-form-item label="家族遗传史" prop="jiazushiji">
        <el-input type="textarea" :rows="2" v-model="dataForm.jiazushiji" placeholder="请输入家族遗传史"></el-input>
      </el-form-item>

    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
export default {
  data() {
    return {
      visible: false,
      dataForm: {
        id: 0,
        yonghuzhanghao: '',
        yonghuxingming: '',
        xingbie: '',
        nianling: '',
        xuexing: '',
        guominshi: '',
        jiwangbingshi: '',
        jiazushiji: ''
      },
      // 表单必填校验规则
      dataRule: {
        yonghuzhanghao: [{ required: true, message: '用户账号不能为空', trigger: 'blur' }],
        yonghuxingming: [{ required: true, message: '用户姓名不能为空', trigger: 'blur' }],
        nianling: [
          { required: true, message: '年龄不能为空', trigger: 'blur' },
          { type: 'number', message: '年龄必须为数字值', trigger: 'blur'}
        ]
      }
    };
  },
  methods: {
    // 初始化组件，如果是修改传id，新增传空
    init(id) {
      this.dataForm.id = id || 0;
      this.visible = true;
      this.$nextTick(() => {
        this.$refs['dataForm'].resetFields(); // 清空历史表单残留
        if (this.dataForm.id) {
          // 如果有id，说明是修改，先去后端查出现有数据回显
          this.$http({
            url: `jiankangdangan/info/${this.dataForm.id}`,
            method: "get"
          }).then(({ data }) => {
            if (data && data.code === 0) {
              this.dataForm = data.data;
            }
          });
        }
      });
    },
    // 提交表单数据到后端
    dataFormSubmit() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.$http({
            url: `jiankangdangan/${!this.dataForm.id ? "save" : "update"}`,
            method: "post",
            data: this.dataForm
          }).then(({ data }) => {
            if (data && data.code === 0) {
              this.$message({
                message: "操作成功",
                type: "success",
                duration: 1500,
                onClose: () => {
                  this.visible = false;
                  this.$emit('refreshDataList'); // 通知父组件 list.vue 刷新表格
                }
              });
            } else {
              this.$message.error(data.msg);
            }
          });
        }
      });
    }
  }
};
</script>
<style lang="scss" scoped>
</style>