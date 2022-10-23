<template>
  <el-dialog
    :title="!dataForm.id ? 'add' : 'modification'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="120px" class="demo-ruleForm">
    <el-form-item label="address name" prop="username">
      <el-input v-model="dataForm.username" placeholder="address name"></el-input>
    </el-form-item>
    <el-form-item label="password" prop="password">
      <el-input v-model="dataForm.password" placeholder="password"></el-input>
    </el-form-item>
      <el-form-item label="email" prop="email">
        <el-input v-model="dataForm.email" placeholder="email"></el-input>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">cancel</el-button>
      <el-button type="primary" @click="dataFormSubmit()">confirm</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          username: '',
          password: '',
          email: ''
        },
        dataRule: {
          username: [
            { required: true, message: 'The user name cannot be empty', trigger: 'blur' }
          ],
          password: [
            { required: true, message: 'The password cannot be empty', trigger: 'blur' }
          ],
          emial: [
            { required: true, message: 'The mailbox cannot be empty', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.username = ''
        this.dataForm.password = ''
        this.dataForm.email = ''
        this.dataForm.id = id || 0
        this.visible = true
            this.axios.get('http://localhost:8080/login/user/info',{
              params:{
                id:this.dataForm.id
              }}).then(({data}) => {
              if (data ) {
                this.dataForm.username = data.user.username
                this.dataForm.password = data.user.password
                this.dataForm.email = data.user.email
              }
            })
      },
      // Form submission
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.axios({
              url: `http://localhost:8080/login/user/${!this.dataForm.id ? 'save' : 'update'}`,
              method: 'post',
              data: this.dataForm
            }).then(({data}) => {
              if (data && data.code === 200) {
                this.$message({
                  message: 'operate successfully',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    }
  }
</script>
