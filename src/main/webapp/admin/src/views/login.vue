<template>
  <div class="login-container">
    <div class="ambient-bg">
      <div class="blob blob-1"></div>
      <div class="blob blob-2"></div>
      <div class="blob blob-3"></div>
    </div>

    <div class="login-card">
      <div class="login-left">
        <div class="brand-wrap">
          <div class="logo-icon">
            <i class="el-icon-first-aid-kit"></i>
          </div>
          <h2 class="sys-title">社区诊疗与健康<br/>档案管理系统</h2>
          <p class="sys-desc">专业 · 便捷 · 智能的数据管理工作台</p>
        </div>
        <div class="footer-text">
          &copy; 2024 Health Care Admin System.
        </div>
      </div>

      <div class="login-right">
        <div class="form-header">
          <h3>欢迎回来</h3>
          <p>请登录您的账号以继续操作</p>
        </div>

        <el-form class="custom-login-form" ref="rulesForm" :model="rulesForm">

          <el-form-item prop="username">
            <el-input
                v-model="rulesForm.username"
                placeholder="请输入管理员或员工账号"
                prefix-icon="el-icon-user"
                clearable>
            </el-input>
          </el-form-item>

          <el-form-item prop="password" style="margin-bottom: 25px;">
            <el-input
                v-model="rulesForm.password"
                type="password"
                placeholder="请输入登录密码"
                prefix-icon="el-icon-lock"
                show-password
                @keyup.enter.native="login()">
            </el-input>
          </el-form-item>

          <el-form-item v-if="roles.length > 1" prop="role" class="role-container">
            <el-radio-group v-model="rulesForm.role" class="role-group">
              <el-radio v-for="item in roles" :key="item.roleName" :label="item.roleName">
                {{item.roleName}}
              </el-radio>
            </el-radio-group>
          </el-form-item>

          <div class="btn-container">
            <el-button type="primary" class="login-btn" @click="login()" :loading="loading">
              安全登录
            </el-button>
          </div>

        </el-form>
      </div>
    </div>
  </div>
</template>

<script>
import menu from "@/utils/menu";

export default {
  data() {
    return {
      baseUrl: this.$base.url,
      rulesForm: {
        username: "",
        password: "",
        role: "",
      },
      menus: [],
      roles: [],
      tableName: "",
      loading: false
    };
  },
  mounted() {
    let menus = menu.list();
    this.menus = menus;
    for (let i = 0; i < this.menus.length; i++) {
      if (this.menus[i].hasBackLogin == '是') {
        this.roles.push(this.menus[i]);
      }
    }
  },
  methods: {
    async login() {
      if (!this.rulesForm.username) {
        this.$message.error("请输入登录账号");
        return;
      }
      if (!this.rulesForm.password) {
        this.$message.error("请输入登录密码");
        return;
      }

      if (this.roles.length > 1) {
        if (!this.rulesForm.role) {
          this.$message.error("请选择您的登录角色");
          return;
        }
        let menus = this.menus;
        for (let i = 0; i < menus.length; i++) {
          if (menus[i].roleName == this.rulesForm.role) {
            this.tableName = menus[i].tableName;
          }
        }
      } else {
        this.tableName = this.roles[0].tableName;
        this.rulesForm.role = this.roles[0].roleName;
      }

      this.loading = true;
      let res = await this.$http({
        url: `${this.tableName}/login?username=${this.rulesForm.username}&password=${this.rulesForm.password}`,
        method: "post"
      });
      this.loading = false;

      if (res.data.code === 0) {
        this.$storage.set("Token", res.data.token);
        this.$storage.set("role", this.rulesForm.role);
        this.$storage.set("sessionTable", this.tableName);
        this.$storage.set("adminName", this.rulesForm.username);
        this.$router.replace({ path: "/index/" });
      } else {
        this.$message.error(res.data.msg);
      }
    }
  }
};
</script>

<style lang="scss" scoped>
/* 避免系统全局样式干扰，最外层容器重新定义 */
.login-container {
  width: 100vw;
  height: 100vh;
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  background-color: #eef2f5;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  margin: 0;
  padding: 0;
}

/* 环境光动态背景 */
.ambient-bg {
  position: absolute;
  top: 0; left: 0; width: 100%; height: 100%; z-index: 1;
  background: linear-gradient(135deg, #f0f4f8 0%, #d9e2e8 100%);
}
.blob {
  position: absolute; border-radius: 50%; filter: blur(90px); opacity: 0.6; animation: float 15s infinite ease-in-out alternate;
}
.blob-1 { top: -10%; left: -10%; width: 50vw; height: 50vw; background: #a1c4fd; }
.blob-2 { bottom: -20%; right: -10%; width: 60vw; height: 60vw; background: #c2e9fb; animation-delay: -5s; }
.blob-3 { top: 30%; left: 50%; width: 35vw; height: 35vw; background: #008476; opacity: 0.2; animation-delay: -10s; }

@keyframes float {
  0% { transform: translate(0, 0) scale(1); }
  100% { transform: translate(5%, 10%) scale(1.1); }
}

/* 左右分栏登录卡片 */
.login-card {
  position: relative;
  z-index: 10;
  width: 950px;
  max-width: 90%;
  height: 540px;
  display: flex;
  background: rgba(255, 255, 255, 0.65);
  backdrop-filter: blur(24px);
  -webkit-backdrop-filter: blur(24px);
  border: 1px solid rgba(255, 255, 255, 0.8);
  border-radius: 24px;
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: transform 0.3s ease;
}
.login-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 25px 60px rgba(0, 0, 0, 0.15);
}

/* 左侧品牌区 */
.login-left {
  flex: 0 0 42%;
  background: linear-gradient(135deg, #008476 0%, #00b4db 100%);
  padding: 50px 40px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  color: #ffffff;
  position: relative;
  overflow: hidden;
}
.login-left::before {
  content: ''; position: absolute; top: -20%; right: -20%; width: 300px; height: 300px;
  background: rgba(255,255,255,0.1); border-radius: 50%; filter: blur(30px);
}
.brand-wrap {
  margin-top: 30px;
}
.logo-icon {
  width: 60px; height: 60px; border-radius: 16px; background: rgba(255, 255, 255, 0.2);
  display: flex; justify-content: center; align-items: center; margin-bottom: 30px; border: 1px solid rgba(255,255,255,0.3);
}
.logo-icon i { font-size: 34px; color: #fff; }
.sys-title {
  font-size: 30px; font-weight: bold; line-height: 1.4; margin: 0 0 15px 0; letter-spacing: 2px; text-shadow: 0 2px 10px rgba(0,0,0,0.1);
}
.sys-desc {
  font-size: 15px; opacity: 0.9; margin: 0; letter-spacing: 1px;
}
.footer-text {
  font-size: 12px; opacity: 0.6;
}

/* 右侧表单区：使用 Flex 的 column 控制自然的上下居中和左右内边距拉伸 */
.login-right {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center; /* 核心：完美上下垂直居中 */
  padding: 0 60px; /* 核心：左右内边距，限制内容宽度但不破坏对齐 */
  background: transparent;
}

.form-header {
  margin-bottom: 30px;
  text-align: left;
}
.form-header h3 {
  font-size: 26px; color: #1e293b; font-weight: bold; margin: 0 0 8px 0; letter-spacing: 1px;
}
.form-header p {
  font-size: 14px; color: #64748b; margin: 0;
}

.custom-login-form {
  width: 100%;
}

::v-deep .el-form-item {
  margin-bottom: 22px;
}
::v-deep .el-input__inner {
  height: 50px;
  line-height: 50px;
  border-radius: 10px;
  border: 1px solid rgba(255, 255, 255, 0.9);
  background: rgba(255, 255, 255, 0.7);
  padding-left: 45px;
  font-size: 15px;
  color: #334155;
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
  box-shadow: 0 2px 6px rgba(0,0,0,0.02) inset;
  width: 100%;
}
::v-deep .el-input__prefix {
  left: 15px; font-size: 18px; color: #94a3b8; transition: color 0.3s;
}
::v-deep .el-input__inner:focus {
  background: rgba(255, 255, 255, 1);
  border-color: #008476;
  box-shadow: 0 0 0 4px rgba(0, 132, 118, 0.15);
}
::v-deep .el-input.is-active .el-input__inner,
::v-deep .el-input__inner:focus + .el-input__prefix {
  color: #008476;
}

.role-container {
  margin-bottom: 15px;
}
::v-deep .el-form-item__content {
  line-height: initial;
}
.role-group {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  width: 100%;
  justify-content: flex-start;
}
::v-deep .el-radio {
  margin-right: 0;
  display: flex;
  align-items: center;
}
::v-deep .el-radio__input.is-checked .el-radio__inner {
  border-color: #008476;
  background: #008476;
}
::v-deep .el-radio__input.is-checked + .el-radio__label {
  color: #008476;
  font-weight: bold;
}
::v-deep .el-radio__inner:hover {
  border-color: #008476;
}

.btn-container {
  margin-top: 15px;
  width: 100%;
}
.login-btn {
  width: 100%;
  height: 50px;
  border-radius: 10px;
  background: linear-gradient(135deg, #00b4db 0%, #008476 100%);
  border: none;
  font-size: 16px;
  font-weight: 600;
  letter-spacing: 4px;
  box-shadow: 0 6px 20px rgba(0, 132, 118, 0.3);
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
}
.login-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 25px rgba(0, 132, 118, 0.4);
}

@media (max-width: 900px) {
  .login-card { flex-direction: column; height: auto; width: 450px; }
  .login-left { flex: none; padding: 40px 30px; border-radius: 24px 24px 0 0; }
  .sys-title { font-size: 24px; }
  .login-right { flex: none; height: 450px; padding: 40px 40px; }
}
</style>