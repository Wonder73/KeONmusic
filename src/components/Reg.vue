<template lang="html">
  <transition name="fade">
  <div id="reg">
      <div class="reg_transparent">

        <transition :name="transitionName">

          <div class="reg_main" v-show="regShow">
            <transition-group name="list">
              <div class="content" v-show="step == 1" :key="1">

                <div class="header">
                  <img src="../assets/logo.png" alt="">
                  <div class="right_header"><span v-show="mode != 'phone'" @click="mode = 'phone'">手机注册</span><span v-show="mode != 'mail'" @click="mode = 'mail'">邮箱注册</span><span @click="login">登录</span></div>
                </div><!--header-->

                <h1>注册会员</h1>

                <div class="mail" v-show="mode == 'mail'">
                  <input type="text" name="email_login" v-model="mailLogin" placeholder="expample">
                  @
                  <input type="text" name="email_host" v-model="mailHost" placeholder="expample.com">
                  <i class="fa fa-caret-down"></i>
                </div><!--mail 邮箱的输入-->

                <div class="phone" v-show="mode == 'phone'">
                  <input type="text" name="email_host" value="+86">
                  <i class="fa fa-caret-down"></i>
                  <input type="text" name="email_login" value="" placeholder="输入你的手机号">
                </div><!--phone 手机的输入-->

                <div class="identifying">
                  <i class="fa fa-envelope-open-o"></i>
                  <input type="text" name="identifying" v-model="code">
                  <button id="getCode" @click="getCode" v-show="second==60">获取验证码</button>
                  <button v-show="second<60">{{second}}s</button>
                  <p class="err">{{errInfo}}</p>
                </div><!--identifying 验证码-->

                <button class="next_step" @click="nextStep">下一步</button>
              </div><!--content 内容部分 第一步获取验证码-->

              <div class="content" v-show="step == 2" :key="2">

                <div class="header">
                  <img src="../assets/logo.png" alt="">
                  <div class="right_header"><span @click="step = 1">上一步</span></div>
                </div><!--header-->

                <h1>建立资料</h1>

                <div class="username"><label for="">用户名<br/><span>KeON ID</span></label><input type="text" name="username" placeholder="6~12数字、字母" autocomplete="off" v-model="username"></div>
                <div class="password">
                  <div class="password_one"><label for="">密　码</label><input type="password" name="password" placeholder="6~18字符" v-model="password"></div>
                  <div class="password_one"><label for="">确认密码</label><input type="password" name="password" placeholder="确认密码" v-model="comfirmPwd"></div>
                </div>
                <p class="err">{{errInfo}}</p>
                <button class="next_step" @click="complete">完成</button>
              </div><!--content 内容部分 第二步填写资料-->

              <div class="content" v-show="step == 3" :key="3">
                <div class="header">
                  <img src="../assets/logo.png" alt="">
                </div><!--header-->

                <h1>{{username}}</h1>
                <p>账号注册成功！</p>
                <p>您现在可以使用该账号与密码登录。</p>
                <button class="next_step" @click="login">登录</button>

              </div><!--content 内容部分 第三步完成-->

            </transition-group>
            <div class="close" @click="close"></div>
          </div><!--reg_main 主体部分第一部分-->

        </transition>
      </div><!--reg_transparent 相当于遮罩-->
  </div><!--reg-->
</transition>
</template>

<script>
import axios from 'axios';
import qs from 'qs';
export default {
  mounted(){
    this.regShow = true;
    //验证码的倒计时
    this.second = localStorage.getItem('sceond');
    if(this.second != '60'){
      var timer = setInterval(()=>{
        this.second--;
        localStorage.setItem('sceond',this.second);
        if(this.second <= 0){
          clearInterval(timer);
          this.second=60;
          localStorage.setItem('sceond',this.second);
        }
      },1000);
    }
  },
  data(){
    return {
      regShow:false, //第一次加载是的动画
      transitionName:'fade',    //dialog的动画效果，默认fade
      mode:'mail',     //手机或邮箱注册，默认邮箱
      step:1,        //第几步
      second:60,
      mailLogin:'',   //邮件名的双向绑定
      mailHost:'',   //邮箱域名的双向绑定
      username:'',   //用户名的双向绑定
      password:'',    //密码的双向绑定
      comfirmPwd:'',  //确认密码的双向绑定
      code:'',         //验证码
      errInfo:''          //错误信息
    }
  },
  methods:{
    close(){   //关闭登录框效果
      this.transitionName = 'slide'
      this.regShow = false;
      setTimeout(()=>{
        this.$router.push({path:'/'})
      },100);
    },
    login(){   //跳转登录框
      this.regShow = false;
      setTimeout(()=>{
        this.$router.push({name:'Login',params:{'mode':'fade'}})
      },100);
    },
    //获取验证码
    getCode(){
      var mailLogin = this.mailLogin;    //获取主机名
      var mailHost = this.mailHost;     //获取域名
      document.getElementById('getCode').disabled = true;   //点击时禁用按钮
      if(mailLogin && mailHost){
        var mail = this.mailLogin+'@'+this.mailHost;    //合成邮箱
        axios({
          method:'post',
          url:'./static/php/index.php?p=login&c=login&a=reg',
          data:qs.stringify({mail:mail}),
          headers:{'Content-Type':'application/x-www-form-urlencoded'}
        }).then((res)=>{
          var data = res.data;
          document.getElementById('getCode').disabled = false;  //启用按钮
          if(data.toString() != '1' && data.toString() != '2'){
            this.errInfo = '';
            sessionStorage.setItem('code',this.stringToHex(data.toLowerCase()));
            this.second--;
            localStorage.setItem('sceond',this.second);
            var timer = setInterval(()=>{   //按钮倒计时
              this.second--;
              localStorage.setItem('sceond',this.second);
              if(this.second <= 0){
                clearInterval(timer);
                this.second=60;
                localStorage.setItem('sceond',this.second);
              }
            },1000);
          }else{
            if(data.toString() == '2'){
              this.errInfo = '邮箱已被注册';
            }else if(data.toString() == '1'){
              this.errInfo = '邮箱不存在';
            }
          }
        })
      }
    },
    //下一步
    nextStep(){
      var sessionCode = sessionStorage.getItem('code');
      if(this.code && sessionCode == this.stringToHex(this.code.toLowerCase())){
        this.step = 2;
        this.code='';
        sessionStorage.removeItem('code');
      }
    },
    //完成输入
    complete(){
      if(!this.username || !this.password){
        this.errInfo = '用户名或密码不得为空';
      }else if(!/^[0-9A-Za-z]{6,12}$/.test(this.username)){
        this.errInfo = '请输入6~12数字、字母的用户名';
      }else if(!/^[0-9A-Za-z._!@#$%^&*?]{6,18}$/.test(this.password)){
        this.errInfo = '请输入6~18字符的密码';
      }else if(this.password != this.comfirmPwd){
        this.errInfo = '两次密码输入不正确';
      }else{
        axios({
          method:'post',
          url:'./static/php/index.php?p=login&c=login&a=regInfo',
          data:qs.stringify({
            mail:this.mailLogin+'@'+this.mailHost,
            username:this.username,
            password:this.password,
          }),
          headers:{'Content-Type':'application/x-www-form-urlencoded'}
        }).then((res)=>{
          var data = res.data;
          if(data){
            this.errInfo = '';
            this.step = 3;
          }else{
            this.errInfo = '用户名已存在';
          }
        })


      }
    },
    //转化为16进制
    stringToHex(str){
　　　　var val1="";
　　　　var val2="";
　　　　var val3="";
　　　　for(var i = 0; i < str.length; i++){
　　　　　　val1 += str.charCodeAt(i).toString(16);
　　　　}
        for(var i = 0; i < val1.length; i++){
　　　　　　val2 += val1.charCodeAt(i).toString(8);
　　　　}
        for(var i = 0; i < val2.length; i++){
　　　　　　val3 += val2.charCodeAt(i).toString(2);
　　　　 }
　　　　return val3;
　　}
  }
}
</script>

<style lang="scss" scoped>
#reg{
  position:fixed;
  top:0;left:0;
  display:flex;
  justify-content: center;
  align-items:center;
  width:100%;
  height:100%;
  background:rgba(51,51,51,0.6);
  z-index:101;
  //特效用
  .reg_transparent{
    overflow:hidden;
    width:500px;
    height:360px;
    //主体
    .reg_main{
      position:relative;
      top:0;
      display:flex;
      justify-content:space-around;
      align-items:center;
      width:100%;
      height:100%;
      background:#fff url(../assets/right_background.png) no-repeat bottom left;
      .content{
        // border:1px solid;
        @media only screen and(max-width:400px){
          width:95%;
        }
        position:absolute;
        top:30px;
        left:0;right:0;
        margin:0 auto;
        width:380px;
        height:300px;
        //内容头部
        .header{
          display:flex;
          flex-flow:row;
          justify-content:space-between;
          img{
            max-width:100%;
            height:40px;
          }
          //注册方式切换和登录按钮
          .right_header{
            span{
              font-size:1.6rem;
              font-weight:400;
              color:#666;
              letter-spacing:2px;
              cursor:pointer;
              &:first-child{
                &:hover{
                  color:rgb(238, 40, 89);
                }
              }
              &:last-child{
                margin:0 15px;
                &:hover{
                  color:rgb(0, 192, 187);
                }
              }
            }/*span*/
          }/*right_header*/
        }/*header*/
        h1{
          margin:25px 0;
          font-size:2.8rem;
          font-weight:700;
          color:#333;
          letter-spacing:1px;
        }
        //输入号码框
        .mail,.phone{
          width:100%;
          height:34px;
          font-size:2rem;
          border-bottom:1px solid rgb(102, 102, 102);
          input{
            width:50%;
            height:100%;
            font-size:2rem;
            background:none;
            &:nth-last-child(2){
              width:30%;
              @media only screen and(max-width:320px){
                width:20%;
              }
            }
            @media only screen and(max-width:400px){
              font-size:1.8rem;
            }
          }
          i{
            margin:0 10px;
            cursor:pointer;
          }
        }/*email_phone*/
        .phone{
          input{
            &:nth-child(1){width:10%;text-align:center;}
          }
        }
        //获取并输入验证码
        .identifying{
          position:relative;
          margin:20px 0;
          i{
            font-size:2.3rem;
          }
          input{
            margin:0 10px;
            width:40%;
            height:34px;
            font-size:2rem;
            background:none;
            border-bottom:1px solid rgb(102, 102, 102);
          }
          button{
            position:absolute;
            right:0;
            width:110px;
            height:34px;
            font-size:2rem;
            color:#fafafa;
            background:rgba(238, 40, 89, 1);
            border:none;
            border-radius:3px;
            cursor:pointer;
          }
        }/*identifying*/

        //下一步按钮
        .next_step{
          position:absolute;
          right:0;
          bottom:20px;
          width:75px;
          height:40px;
          font-size:2rem;
          color:#fafafa;
          background:rgba(238, 40, 89, 1);
          border:none;
          border-radius:3px;
          cursor:pointer;
        }

        //取消input获取焦点时的默认操作
        input:focus{
          outline:none;
        }

        //第二步填写资料
        label{
          font-size:2rem;
          font-weight:400;
          color:#333;
          letter-spacing:1px;
          vertical-align: middle;
          span{
            font-size:1.6rem;
            @media only screen and(max-width:400px){
              font-size:1.4rem;
            }
          }
          @media only screen and(max-width:400px){
            font-size:1.6rem;
          }
        }
        .username{
          display:flex;
          flex-flow:row;
          align-items:center;
          margin-bottom:20px;
        }
        .username>input,.password input{
          margin:0 10px;
          width:130px;
          height:24px;
          font-size:1.8rem;
          border-bottom:1px solid rgb(102, 102, 102);
        }
        .password{
          display:flex;
          &>div{
            margin:5px 0;
          }
          @media only screen and(max-width:370px){
            margin:0;
            flex-flow:column;
          }

        }
        .password input{
          width:100px;
        }
        //最后一步的两句话
        p{
          font-size:1.8rem;
          color:#333;
          line-height:1.5;
        }
        .err{
          display:block;
          margin:20px auto;
          font-size:1.6rem;
          font-weight:400;
          color:red;
          text-align:center;
        }
      }/*content*/
      .close{
        position:absolute;
        top:25px;
        right:10%;
        width:20px;
        height:20px;
        border-radius:20px;
        background:#ff0000;
        cursor:pointer;
        @media only screen and (max-width:500px){
          right:5%;
        }
        @media only screen and (max-width:450px){
          right:1%;
        }
      }
    }/*reg_main*/
  }/*reg_transparent*/
}/*#loing*/

//动画效果
//渐变出现
.fade-enter-active,.fade-leave-active{
  transition:opacity 0.5s linear;
}
.fade-enter,.fade-leave-to{
  opacity:0;
}
.fade-leave,.fade-enter-to{
  opacity:1;
}

//列表过渡
.list-enter-active,.list-leave-active{
  transition:opacity 0.5s linear;
}
.list-enter,.list-leave-to{
  opacity:0;
}
.list-leave,.list-enter-to{
  opacity:1;
}

//下拉
.slide-enter-active,.slide-leave-active{
  transition:transform 0.5s ease-out;
}
.slide-enter,.slide-leave-to{
  transform:translateY(-100%);
}
.slide-leave,.slide-enter-to{
  transform:translateY(0);
}
</style>
