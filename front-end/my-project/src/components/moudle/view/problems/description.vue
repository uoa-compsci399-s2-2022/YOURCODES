<template>
  <div>

    <header>
      <h1 class="title_name">YourCode</h1>
      <p>
        <el-dropdown :show-timeout="0" placement="bottom" style="text-align:right">
            <span class="el-dropdown-link">
              <img :src="require('../../../../assets/Images/user.png')" :alt="this.$store.state.user" width="30px" height="30px">{{ this.$store.state.user }}
            </span>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item @click.native="userdetails()">Profile</el-dropdown-item>
            <el-dropdown-item @click.native="updatePasswordHandle()">Change password</el-dropdown-item>
            <el-dropdown-item @click.native="logoutHandle()">Exit</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </p>
      <hr>
      <nav>
        <div class="navbar">
          <ul class="container gray highlightTextIn">
            <li><a alt ="Homepage" @click="home">Homepage</a></li>
            <li><a alt = "Problems"@click="func4">Problem</a></li>
          </ul>
        </div>
      </nav>
      <nav>
        <!-- second nav bar -->
      </nav>
    </header>
    <el-container>
      <el-aside width="500px">
        <div class="block">
          <span class="demonstration"> Application Scoring  <el-button type="text" size="small" @click="scoreSubmit">submit</el-button></span>
          <el-rate v-model="scoreForm.score"></el-rate>
        </div>

        <section>
          <!-- split screen -->
          <div class="split-screen">
            <!-- left screen -->
            <div class="left-screen">
              <!-- title area -->
              <div class="description">
                <!--              <h3><img src="./Images/pic_1.png" alt="Avatar">967. Numbers With Same Consecutive Differences</h3><p class="author">By Sponge Bob</p>-->
                <!-- tags list -->
                <el-tag
                  v-for="item in tags"
                  :key="item.name"
                  :type="item.type"
                  effect="plain">
                  {{ item.name }}
                </el-tag>
                <!-- difficulty, like, ratings, save -->
                <span class="difficulty">{{this.problemvo.difficulty}}</span>
                <span class="stars">
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
          </span>
                <span class="like">
          </span>
                <span class="add"><i class="fa-regular fa-heart" ></i> {{this.problemvo.title}}</span>
                <el-badge :value="this.problemvo.comment" class="item">
                  <el-button size="small" @click="func1(scoreForm.problemid)">comment</el-button>
                </el-badge>
              </div>
              <!-- question area -->
              <div class="question">
               {{this.problemvo.description}}

              </div>
              <!-- test cases and images -->
              <div class="test-case">
                <h3>Example1:</h3>
<!--                <img src="./Images/tree.png" alt="Tree">-->
                <!-- test cases input and output in tables -->
                <table bgcolor="black">
                  <thead>
                  <!-- table header -->
                  <tr bgcolor="lightgrey">
                    <th>Input</th>
                    <th>Output</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr bgcolor="white">
                    <td>{{this.problemvo.input1}}</td>
                    <td>{{this.problemvo.output1}}</td>
                  </tr>
                  </tbody>
                </table>
                <!-- second example of test case -->
                <h3>Example2:</h3>
<!--                <img src="./Images/tree.png" alt="Tree">-->
                <table bgcolor="black">
                  <thead>
                  <tr bgcolor="lightgrey">
                    <th>Input</th>
                    <th>Output</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr bgcolor="white">
                    <td>{{this.problemvo.input2}}</td>
                    <td>{{this.problemvo.output2}}</td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <div class="mod-config">
                <el-tag type="danger" v-if="mycodes">Review the code after you submit it</el-tag>
                <el-button @click="getproblemcodeDataList()">Refresh</el-button>
                <el-button @click="getsubmitproblemcode()">Creator Code</el-button>
                <el-table
                  :data="mycodedataList"
                  border
                  v-loading="dataListLoading"
                  style="width: 100%;">
                  <el-table-column
                    type="selection"
                    header-align="center"
                    align="center"
                    width="50">
                  </el-table-column>
                  <el-table-column
                    prop="code"
                    header-align="center"
                    align="center"
                    label="Code">
                    <template slot-scope="scope">
                      <el-button @click="func6(scope.row.code)" type="info" round style="margin-left: 16px;">
                        View Code
                      </el-button>
                    </template>
                  </el-table-column>
                  <el-table-column
                    prop="username"
                    header-align="center"
                    align="center"
                    label="Username">
                  </el-table-column>
                  <el-table-column
                    prop="time"
                    header-align="center"
                    align="center"
                    label="Time">
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
              </div>
            </div>
            <!-- right screen -->

            <!-- coding box area -->
            <!-- result console with table -->
            <!-- check and submit buttons -->

          </div>
        </section>
      </el-aside>
      <el-main>
        <template>
          <div>
            <text-expand :text="text" :expand="2" />
            <div id="app">
              <h1>CodeEditor</h1>
              <div>
                language ：
                <el-select
                  v-model="opts.language"
                  clearable
                  placeholder="please choose"
                  size="mini"
                  @change="changeLanguage"
                >
                  <el-option
                    v-for="item in sets.language"
                    :key="item"
                    :label="item"
                    :value="item"
                  >
                  </el-option>
                </el-select>
                style：
                <el-select
                  v-model="opts.theme"
                  clearable
                  placeholder="please choose"
                  size="mini"
                  @change="changeTheme"
                >
                  <el-option
                    v-for="item in sets.theme"
                    :key="item"
                    :label="item"
                    :value="item"
                  >
                  </el-option>
                </el-select>
                <el-button type="primary" size="mini" @click="getcode">run</el-button>
                <el-button @click="mycodedataFormSubmit()">submit my code</el-button>
              </div>
            </div>
            <div>

              <monaco
                ref="monaco"
                :opts="opts"
                @change="changeValue"
                :height="600"
              ></monaco>
            </div>

            <el-descriptions title="computational results">
            </el-descriptions>
            <el-row>
              <span style="font-size:15px;width:200px;margin-right: 30px">"Result: "{{this.res.result}}</span>
            </el-row>
            <el-row>
              <span style="font-size:15px;width:200px;margin-right: 30px">"RunningTime: "{{this.res.elapsedTime}}ms</span>
            </el-row>
          </div>
        </template>
      </el-main>
    </el-container>
    <main>

    </main>
    <el-drawer
      title="Code"
      :visible.sync="drawer"
      direction="ltr"
      :before-close="handleClose">
      <span>
        <el-input
          type="textarea"
          :autosize="{ minRows: 20}"
          v-model="this.code">
        </el-input>
        </span>
    </el-drawer>
    <el-dialog
      title="modification"
      :close-on-click-modal="false"
      :visible.sync="passwordvisible">
      <el-form :model="passwordataForm"  ref="dataForm"  label-width="110px" class="demo-ruleForm">
        <el-form-item label="User Name" prop="User Name">
          <el-input v-model="passwordataForm.username" placeholder="User Name"></el-input>
        </el-form-item>
        <el-form-item label="Old password" prop="Old password">
          <el-input v-model="passwordataForm.password" placeholder="Old password"></el-input>
        </el-form-item>
        <el-form-item label="New password" prop="New password">
          <el-input v-model="passwordataForm.passwordnew" placeholder="New password"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
      <el-button @click="passwordvisible = false">cancel</el-button>
      <el-button type="primary" @click="passworddataFormSubmit()">confirm</el-button>
    </span>
    </el-dialog>
    <el-dialog
      title="Profile"
      :close-on-click-modal="false"
      :visible.sync="uservisible">
      <el-form :model="UserdetailsdataForm" ref="dataForm" @keyup.enter.native="UserdetailsdataFormSubmit()" label-width="110px" class="demo-ruleForm">
        <el-form-item label="User Name" prop="User Name">
          <el-input v-model="UserdetailsdataForm.username" placeholder="User Name"></el-input>
        </el-form-item>
        <el-form-item label="email" prop="email">
          <el-input v-model="UserdetailsdataForm.email" placeholder="email"></el-input>
        </el-form-item>
        <el-form-item label="Instagram" prop="Instagram">
          <el-input v-model="UserdetailsdataForm.phone" placeholder="Instagram"></el-input>
        </el-form-item>
        <el-row>
          <el-col :span="8"><div class="grid-content bg-purple">
            <el-form-item label="Academic Year" prop="Academic Year">
              <el-select v-model="UserdetailsdataForm.sex" placeholder="Academic Year">
                <el-option label="1 Year" value="1 Year"></el-option>
                <el-option label="2 Year" value="2 Year"></el-option>
                <el-option label="3 Year" value="3 Year"></el-option>
              </el-select>
            </el-form-item>
          </div></el-col>
        </el-row>
        <el-form-item label="Description" prop="Description">
          <el-input
            type="textarea"
            :rows="2"
            placeholder="Description"
            v-model="UserdetailsdataForm.selfintroduction">
          </el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
      <el-button @click="uservisible = false">cancel</el-button>
      <el-button type="primary" @click="UserdetailsdataFormSubmit()">confirm</el-button>
    </span>
    </el-dialog>
    <el-dialog
      title="My code"
      :close-on-click-modal="false"
      :visible.sync="mycodevisible">
      <el-form :model="mycodedataForm"   label-width="110px" class="demo-ruleForm">
        <el-form-item label="code" prop="code">
          <el-input
            type="textarea"
            :autosize="{ minRows: 20}"
            v-model="mycodedataForm.code">
          </el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
      <el-button @click="mycodevisible = false">cancel</el-button>
      <el-button type="primary" @click="mycodedataFormSubmit()">confirm</el-button>
    </span>
    </el-dialog>
  </div>

</template>
<script>
  import common from "../../../common";
  import monaco from './monacoeditor'
  import axios from "axios"
  export default {
    data () {
      return {
        code:'',
        drawer: false,
        direction: 'rtl',
        value1: null,
        problem:'',
        textarea1:'Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse, aliquam nostrum tempora repudiandae eveniet numquam laborum modi distinctio veniam inventore sint fuga, itaque, dicta ipsam deserunt et quia veritatis voluptatem? Sint voluptas error ducimus, optio quod a facilis ab nisi cum. Eos fugiat et reprehenderit maxime quod ad id voluptatem totam ut, ullam quaerat ducimus doloribus ratione vero facilis, iure quidem eligendi hic consequatur quasi molestiae possimus? Doloremque, ut at asperiores error, modi vitae, iure officia odit nulla nihil saepe repellendus quaerat quod expedita accusamus soluta a placeat deleniti recusandae consequuntur? Quos ullam perspiciatis quisquam deserunt dolorem modi nemo sequi.',
        tags: [

        ],
        mycodes:true,
        passwordataForm: {
          username: '',
          password: '',
          passwordnew: ''
        },
        UserdetailsdataForm: {
          username: '',
          password: '',
          email: '',
          phone:'',
          sex:'',
          selfintroduction:''
        },
        mycodedataForm: {
          id:0,
          problem: '',
          code: '',
          username: '',
          lang:''
        },
        passwordvisible:false,
        uservisible:false,
        mycodevisible:false,
        problemvo:'',
        options: [{
          type: 'success',
          name: 'Array'
        }, {
          type: 'success',
          name: 'String'
        }, {
          type: 'success',
          name: 'Math'
        }, {
          type: 'success',
          name: 'Sorting'
        }, {
          type: 'success',
          name: 'Tree'
        },
          {
            type: 'success',
            name: 'Binary Search'
          }, {
            type: 'success',
            name: 'Matrix'
          }, {
            type: 'success',
            name: 'Binary Tree'
          }, {
            type: 'success',
            name: 'Bit Manipulation'
          }, {
            type: 'success',
            name: 'Stack'
          }, {
            type: 'success',
            name: 'Counting'
          },
          {
            type: 'success',
            name: 'Linked List'
          }, {
            type: 'success',
            name: 'Recursion'
          }, {
            type: 'success',
            name: 'Queue'
          }, {
            type: 'success',
            name: 'Merge Sort'
          }, {
            type: 'success',
            name: 'Bubble Sort'
          }, {
            type: 'success',
            name: 'Selection Sort'
          }],
        value1: [],
        res:'',
        difficulties:'Easy',
        topics:'AllTopics',
        mycodedataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        dataListSelections: [],
        addOrUpdateVisible: false,
        scoreForm: {
          id: 0,
          problemid: '',
          user: '',
          score: ''
        },
        sets: {
          language: {
            'c': 'c',
            'java': 'java',
            'python': 'python'
          },
          theme: {
            'vs': 'vs',
            'vs-dark': 'vs-dark',
            'hc-black': 'hc-black'
          }
        },
        opts: {
          value: '',
          readOnly: false,
          language: 'python',
          theme: 'vs-dark' ,
          autoClosingBrackets: 'always',
          autoClosingDelete: 'always',
          autoIndent: 'None'
        }
      }
    },
    components: {
      monaco
    },
    created() {
      this.mycodedataForm.problem=this.$route.query.id
      this.mycodedataForm.username=this.$store.state.user
      this.scoreForm.problemid=this.$route.query.id
      this.scoreForm.user=this.$store.state.user
      this.problem=this.$route.query.id
      this.getDataList()
      this.getproblemcodeDataList()
      this.getproblemcodeonet()
    },
    activated () {

    },
    methods: {
      home() {
        this.$router.push({ path: "/" });
      },
      getcode(){
        this.mycodedataForm.code=this.$refs.monaco.getVal()
        this.mycodedataForm.lang=this.opts.language
        this.axios({
          url: `http://localhost:8080/prloblemcode/problemcode/test`,
          method: 'post',
          data: this.mycodedataForm
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.$message({
              message: 'operate successfully',
              type: 'success',
              duration: 1500,

            })
            this.res = JSON.parse(data.res.data)
          } else {
            this.$message.error(data.msg)
          }
        })
      },
      changeLanguage (val) {
        this.opts.language = val
      },
      changeTheme (val) {
        this.opts.theme = val
      },

      changeValue (val) {
        this.mycodedataForm.code=this.$refs.monaco.getVal()
      },
      func6(code) {
        this.drawer = true
        this.code=code
      },
      handleClose(done) {
        this.$confirm('Confirm the shut down？')
          .then(_ => {
            done();
          })
          .catch(_ => {});
      },

      mycodedataFormSubmit () {
        this.axios({
          url: `http://localhost:8080/prloblemcode/problemcode/save`,
          method: 'post',
          data: this.mycodedataForm
        }).then(({data}) => {
          if (data && data.code === 0) {
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
      },
      getsubmitproblemcode () {
        this.dataListLoading = true
        this.axios.get(common.adress+'/problemdetaile/problemdetaile/creatorcode',{
          params:{
            problemid: this.mycodedataForm.problem,
            user: this.mycodedataForm.username
          }}).then(
          ({data}) => {
            if (data && data.code === 0) {
              this.drawer = true
              this.code=data.creatorcode
            } else {
              this.$message.error(data.msg)
            }
            this.dataListLoading = false
          }
        )
        this.dataListLoading = true
      },
      // get the list of data
      getproblemcodeDataList () {
        this.dataListLoading = true
        this.axios.get(common.adress+'/prloblemcode/problemcode/list',{
          params:{
            problemid: this.mycodedataForm.problem,
            user: this.mycodedataForm.username,
            page: this.pageIndex,
            limit: this.pageSize,
          }}).then(
          ({data}) => {
            if (data && data.code === 0) {
              this.mycodedataList = data.page.list
               this.mycodes = false
            } else {
              this.this.mycodedataList = []
            }
            this.dataListLoading = false
          }
        )
        this.dataListLoading = true
      },

      getproblemcodeonet () {
        this.dataListLoading = true
        this.axios.get(common.adress+'/prloblemcode/problemcode/getone',{
          params:{
            problemid: this.mycodedataForm.problem,
            user: this.mycodedataForm.username,
          }}).then(
          ({data}) => {
            if (data && data.code === 0) {
              this.mycodedataForm.code = data.codes
              this.$refs.monaco.setVal(this.mycodedataForm.code)
            } else {
              this.mycodedataForm.code =''
            }
            this.dataListLoading = false
          }
        )
        this.dataListLoading = true
      },

      sizeChangeHandle (val) {
        this.pageSize = val
        this.pageIndex = 1
        this.getDataList()
      },

      currentChangeHandle (val) {
        this.pageIndex = val
        this.getDataList()
      },
      func2() {
        this.$router.push({ path: "run"});
      },
      func1(id) {
        this.$router.push({ path: "discuss",query:{id:id} });
      },
      func4() {
        this.$router.push({ path: "problem"});
      },
      func5() {
        this.$router.push( {path: "Login",query:{name:this.$store.state.user,password:this.$store.state.password}});
      },
      func7() {
        this.$router.push({ path: "test"});
      },
      // Get the data list
      getDataList () {
        this.axios.get(common.adress+'problemdetaile/problemdetaile/getdetail',{
          params:{
            problemid: this.problem,
          }}).then(
          ({data}) => {
            if (data && data.code === 0) {
              this.problemvo = data.problemvo
               var s=this.problemvo.type.split(';')
              for (var i = 0; i < s.length-1; i++) {
                this.tags.push(this.options[i])
              }
              console.log(JSON.stringify(s))
            } else {
              this.dataList = []
            }
            this.dataListLoading = false
          }
        )
        this.dataListLoading = true
      },
      // The form submission
      dataFormSubmit () {

        var string = ''
        for (var i = 0; i < this.value1.length; i++) {
          this.value1.sort((x,y)=> x - y)
          string=string + this.value1[i]+';'
        }
        this.dataForm.type=string
        this.axios({
          url: `http://localhost:8080//problams/problem/save`,
          method: 'post',
          data: this.dataForm
        }).then(({data}) => {
          if (data && data.code === 0) {
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
      },
      // score
      scoreSubmit () {
        this.axios({
          url: `http://localhost:8080//score/score/save`,
          method: 'post',
          data: this.scoreForm
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.$message({
              message: data.msg,
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
      },
       mycode() {
        this.getproblemcodeonet()
        this.mycodevisible = true
      },
      userdetails () {
        this.uservisible = true
        this. UserdetailsdataForm.username = this.$store.state.user
        this.getuserdetail()
      },
      // change password
      updatePasswordHandle () {
        this.passwordvisible = true
        this.passwordataForm.username = this.$store.state.user
      },
      // quit
      logoutHandle () {
        this.$confirm(`Confirm to proceed with [Exit] operation?`, 'hint', {
          confirmButtonText: 'ensure',
          cancelButtonText: 'cancel',
          type: 'warning'
        }).then(() => {
          this.func5()
        }).catch(() => {})
      } ,
      // The form submission
      passworddataFormSubmit () {
        if(this.passwordataForm.username === ''||this.passwordataForm.password === ''){
          this.$message.error('Please enter the complete information')
          return
        }
        this.axios({
          url: `http://localhost:8080/login/user/passwordupdate`,
          method: 'post',
          data: this.passwordataForm
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.$message({
              message: 'operate successfully',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.visible = false
                this.$emit('refreshDataList')
              }
            })
            this.func5()
          } else {
            this.$message.error(data.msg)
          }
        })
      },
      UserdetailsdataFormSubmit() {
        this.axios({
          url: `http://localhost:8080/login/user/userupdate`,
          method: 'post',
          data: this.UserdetailsdataForm
        }).then(({data}) => {
          if (data && data.code === 0) {
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
      },
      // Get the data listthis.getuserdetail()
      getuserdetail () {
        this.axios.get(common.adress+'login/user/getdetail',{
          params:{
            user: this. UserdetailsdataForm.username,
          }}).then(
          ({data}) => {
            if (data && data.code === 0) {
              this.UserdetailsdataForm = data.user

            } else {
              this.UserdetailsdataForm = []
            }
          }
        )
      }
    }
  }
</script>
<style>
  #app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: left;
    color: #2c3e50;
    margin-top: 0px;
  }
  .item {
    margin-top: 10px;
    margin-right: 40px;
  }
  .login_form {
    padding-top: 10%;
    padding-left: 10%;
    padding-right: 10%;
  }
  .qxs-ic_user {
    background-size: 13px 15px;
    background-position: 3%;
  }
  .qxs-ic_password {
    background-size: 13px 15px;
    background-position: 3%;
    margin-bottom: 20px;
  }
  .login_logo {
    height: 100%;
  }
  .login_btn {
    width: 100%;
    font-size: 16px;
    background: -webkit-linear-gradient(left, #000099, #2154FA); /* Safari 5.1 - 6.0 */
    background: -o-linear-gradient(right, #000099, #2154FA); /* Opera 11.1 - 12.0 */
    background: -moz-linear-gradient(right, #000099, #2154FA); /* Firefox 3.6 - 15 */
    background: linear-gradient(to right, #000099 , #2154FA);
    filter: brightness(1.4);
  }
  * logo of website */
  #logo {
    width: 80px;
    height: 80px;
    display: inline-block;
  }
  /* gray line in the header */
  hr{
    border:none;
    color:#000000;
    background-color: #000000;
    height: 1px;

  }
  header{
    position: relative;
  }
  header p{
    position:relative;
    float:right;
    display: block;
    margin-top: -40px;
    margin-right: 60px;
    font-family: Inter,sans-serif;
  }
  /*user icon*/
  .user{
    position: relative;
    margin-top: -50px;
    margin-right: 20px;
    float:right;
  }
  .logo{
    position: absolute;
    margin-top: -63px;
    margin-left: 20px;
  }

  /*full page*/
  * {
    padding: 0;
    margin: 0;
    text-decoration: none;
    list-style: none;
    box-sizing: border-box;
  }

  body {
    font-family: 'Open Sans',Arial,sans-serif;
    margin: 0;
    padding: 0;
    min-height: 3000px;
    background-color: #f8f8f8;
  }

  /* div for nav bar, the whole nav bar */
  .navBar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #ffffff;
  }

  .container li a
  {
    size: 100px;
    text-decoration: none;
    margin: 0px 10px;
    padding: 10px 10px;
    position: relative;
    z-index: 0;
    cursor: pointer;
  }

  /* Highlight text out  */
  .highlightTextIn li a:before
  {
    position: absolute;
    color: #000000;
    top: 0px;
    left: 0px;
    padding: 10px;
    overflow: hidden;
    content: attr(alt);
    transition: all 0.3s;
    transform: scale(0.8);
    opacity: 0;
  }

  .highlightTextIn li a:hover:before
  {
    transform: scale(1);
    opacity: 1;
  }

  /* Highlight text in  */
  .highlightTextIn li a
  {
    color: rgba(0, 0, 0, 0.4);
  }

  .highlightTextIn li a:before
  {
    transform: scale(1.2);
  }

  /* Homepage, Problems, Create, Leader Board  */
  ul {
    padding-top: 18px;
    padding-bottom: 15px;
    list-style-type: none;
    text-align: center;
  }

  ul li {
    display: inline-block;
    margin-right:30px;
  }
  ul li a {
    margin: 0 10px;
    border-radius: 10px;
    padding: 8px;
    font-size: 100px;
    color: #929292;
    position: relative;
    text-decoration: none;
  }

  ul li a::after{
    position: absolute;
    content: "";
    width: 0%;
    height: 4px;
    background-color: #929292;
    left: 50%;
    bottom: -1px;
    transition: all 0.4s ease-in-out;
  }

  .navBar:hover ul li a::after {
    width: 100%;
    left: 0;
  }


  /* all buttons on nav bar */
  .navbar ul li a{
    color: #929292;
    font-size:  15px;
    letter-spacing: 2px;
    margin: -8px;
  }


  /*star image*/
  .star{
    max-width: 2.5rem;
    object-fit: cover;
    margin-bottom: 2rem;
    margin-top:4rem;
    display: block;
    margin-left: auto;
    margin-right: auto;
  }
  /*star image spinning*/
  /* .star {
      max-width: 2.5rem;
      object-fit: cover;
      margin-bottom: 2rem;
      margin-top:4rem;
      display: block;
      margin-left: auto;
      margin-right: auto;
      animation: spin 2s infinite;
    }

    @keyframes spin {
      0% {
        transform: rotate(0deg);
      }
      100% {
        transform: rotate(360deg);
      }
    } */


  /* div for all text on home page */
  #button span {
    color:#000000;
    border: 1px solid black;
    border-radius: 40px;
    padding: 12px 40px;
    margin-right: 5px;
    text-align: center;
    font-size: 1rem;
  }

  #button span:hover{
    background-color: rgb(0, 0, 0);
    color:#f8f8f8;
    transition: all 0.5s;
  }



  /* footer at bottom of page */
  #footer {
    text-align: center;
  }
  #footer p{
    color:#000000;
  }


  /* svg{
      margin-top: -500px;
  } */



  /* login box */
  #login {
    padding: 40px 40px 20px 40px;
    border-radius: 50px;
    text-align: center;
    margin-top:80px;
    margin-bottom: 100px;
  }

  /* login box title buttons */

  #label{
    margin-bottom: 10px;
  }
  #label a:hover {
    background-color:#f8f8f8;
    transition: all 0.5s;
    border-radius: 10px;
  }

  /* username input for both login and sign up page */
  #username {
    border-radius: 20px;
    border: 10px solid transparent;
    cursor: pointer;
    transition: all 1s;
    margin: 10px 0px;
    width: 250px;
  }

  /* password input for both login and sign up page */
  #password {
    border-radius: 20px;
    border: 10px solid transparent;
    cursor: pointer;
    transition: all 1s;
    margin: 10px 0px;
    width: 250px;
  }

  /* email input for sign up page only*/
  #email {
    border-radius: 20px;
    border: 10px solid transparent;
    cursor: pointer;
    transition: all 1s;
    margin: 10px 0px;
    width: 250px;
  }

  /* submit button for both login and sign up page */
  #submit {
    border-radius: 20px;
    width: 250px;
    border: 1px solid #000000;
    color: #000000;
    background-color: #f8f8f8;
    cursor: pointer;
    margin: 10px 0px;
    padding: 12px 40px;
    margin-right: 5px;
    text-align: center;
    font-size: 1rem;
  }

  #submit:hover {
    background-color: #000000;
    color:#ffffff;
    transition: all 0.5s;
  }

  /* align all text in input bux to center */
  ::placeholder {
    text-align: center;
  }

  /* check box for remember me */
  #checkbox {
    text-align: center;
    color: #000000;
  }

  /* link to sign up page in check box */
  #checkbox a {
    color: #000000;
  }

  #checkbox a:hover {
    color: #000000;
    transition: all 0.5s;
  }
  input[type="text"]{
    padding:2px;
  }
  input[type="password"]{
    padding:2px;
  }




  /* div for profile icon and user's Username */
  #profile {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 0px 10px;
  }

  /* profile icon */
  div#profile img {
    width: 40px;
    height: 40px;
    cursor: pointer;
  }








  div#profile a:hover {
    background-color: #000000;
    transition: all 0.5s;
    border-radius: 7px;
  }

  /* div for welcome box on loggedin page */
  #welcome {
    background-color: #000000;
    margin-right: 140px;
    padding: 40px 40px 50px 40px;
    border-radius: 50px;
    text-align: center;
    font-size: 30px;
    color: #30a379;
  }

  /* link to profile on welcome box */
  #welcome a {
    color: rgb(49, 36, 60);
    border: 2px solid black;
    border-radius: 40px;
    padding: 7px;
    background-color: lightgreen;
  }

  #welcome a:hover {
    background-color:#000000;
    transition: all 0.5s;
  }

  /*footer text style*/
  #footer h1{
    text-transform: uppercase;
  }
  #footer p{
    font-size:15px;
    margin-top:10px;
    letter-spacing: 3px;
  }
</style>
