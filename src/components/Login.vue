<template lang="html">
  <transition name="fade">
  <div id="login">
      <div class="login_transparent">
        <transition :name="transitionName">
          <div class="login_main" v-show="loginShow">
          <div class="left_logo">
            <img src="../assets/logo.gif" alt="">
            <div class="logoFont">
              <h1>KeON</h1>
              <h2>Music</h2>
            </div>
          </div><!--left_logo-->
          <div class="right_form">
              <input type="text" name="username" placeholder="KeON ID/手机/邮箱" autocomplete="off" v-model="username">
              <input type="password" name="password" placeholder="在此输入密码" v-model="password">
              <p><router-link to="/Login/Reg" tag="span">注册</router-link><span>忘记密码</span></p>
              <transition name="heightSlide">
                <div class="verification" v-show="this.errNum>=5">
                  <canvas id="canvas" width="100" height="25" @click="verification"></canvas>
                  <input type="text" name="code" autocomplete="off" v-model="code" :style="{'color':activeColor,'border-color':activeColor}" @focus="placeholderFocus" @blur="placeholerBlur">
                </div><!--verification-->
              </transition>
              <button id="login_btn" @click="login">登录</button>
              <p class="err">{{errInfo}}</p>
        </div><!--login_main 主体部分-->
        <div class="close" @click="close"></div>
      </div><!--right_form 表单-->
        </transition>
      </div><!--login_transparent 相当于遮罩-->
      <router-view></router-view>
  </div><!--login-->
</transition>
</template>

<script>
import axios from 'axios';
import qs from 'qs'
export default {
  mounted(){
    this.loginShow = true;
    this.transitionName = this.$route.params.mode?this.$route.params.mode:'slide';
    this.errNum = sessionStorage.getItem('errNum');
    this.verification();
  },
  data(){
    return {
      loginShow:false,             //登录框显示
      showVerification:false,       //验证码显示
      transitionName:'slide',       //进入动画效果
      activeColor:'',              //验证码动态颜色
      code:'在此输入验证码',        //验证码内容
      username:'',                //用户名
      password:'',                //密码
      errNum:0,                  //错误次数
      errInfo:'',                //错误信息
    }
  },
  watch:{
    errNum(newV,oldV){
      sessionStorage.setItem('errNum',newV);
    }
  },
  methods:{
    close(){   //关闭登录框效果
      this.loginShow = false;
      this.transitionName = 'slide';
      setTimeout(()=>{
        this.$router.push({path:'/'})
      },100);
    },
    placeholderFocus(){   //验证码获取焦点
      if(this.code == '在此输入验证码'){
        this.code = '';
      }
    },
    placeholerBlur(){   //验证码失去焦点
      if(this.code == ''){
        this.code = '在此输入验证码';
      }
    },
    login(){       //登录方法
      //this.showVerification = !this.showVerification;
      document.getElementById('login_btn').disabled=true;
      if(this.username && this.password){
        var session = sessionStorage.getItem('verification');
        if(this.errNum>=5 && session != this.code.toLowerCase()){
          this.errInfo = '验证码输入错误';
          document.getElementById('login_btn').disabled=false;
          return;
        }
        axios({
          method:'post',
          url:'./static/php/index.php?p=login&c=login&a=login',
          data:qs.stringify({username:this.username,password:this.password}),
          headers:{'Content-Type':'application/x-www-form-urlencoded'}
        }).then((res)=>{
          var data = res.data;
          // console.log(data);
          // console.log(typeof data);
          // console.log(typeof data == 'object');
          document.getElementById('login_btn').disabled=false;
          if(data == '1'){
            this.errNum++;
            this.errInfo = '没有该用户！！！';
          }else if(data == '2'){
            this.errNum++;
            this.errInfo = '密码输入错误！！！';
          }else if(typeof data == 'object'){
            this.errInfo = '';
            localStorage.setItem('username',data.username);
            localStorage.setItem('password',data.password);
            this.close();
          }
        });
      }else{
        this.errNum++;
        this.errInfo = '用户名或密码不得为空';
        document.getElementById('login_btn').disabled=false;
      }
    },
    verification(){
      var canvas = document.getElementById('canvas');
      var ctx = canvas.getContext('2d');
      var color = ['rgb(238, 40, 89)','rgb(249, 231, 76)','rgb(0, 192, 187)'];   //颜色在三种颜色中
      var str = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
      var length = 4;   //字符串长度
      var temp = 0;      //中间变量
      var session = '';
      var backColor = random(0,color.length-1);
      ctx.fillStyle = this.activeColor = color[backColor];
      ctx.fillRect(0,0,100,25);

      //绘制字体
      while(true){
        let Random = random(0,color.length-1);
        if(Random == backColor){
          continue;
        }
        let text = str[random(0,str.length-1)];
        session += text;
        let x = 20+temp*15;
        let y = random(20,23);
        let deg = random(-45,45);
        ctx.translate(x,y);
        ctx.rotate(deg*Math.PI/180);
        ctx.fillStyle = color[Random];
        ctx.font = random(20,25)+'px SimHei';
        ctx.fillText(text,0,0);
        ctx.rotate(-deg*Math.PI/180);
        ctx.translate(-x,-y);
        if(++temp === length){
          sessionStorage.setItem('verification',session.toLowerCase());
          break;
        }
      }

      function random(min,max){
        return Math.round(Math.random()*(max-min)+min);
      }
    }
  }
}
</script>

<style lang="scss" scoped>
#login{
  position:fixed;
  top:0;left:0;
  display:flex;
  justify-content: center;
  align-items:center;
  width:100%;
  height:100%;
  background:rgba(51,51,51,0.6);
  z-index:101;
  .login_transparent{
    overflow:hidden;
    width:500px;
    height:360px;
    //主体
    .login_main{
      position:relative;
      top:0;
      display:flex;
      justify-content:space-around;
      align-items:center;
      width:100%;
      height:100%;
      background:#fff url(../assets/login_background.png) no-repeat top right;
      &>div{
        // border:1px solid;
      }
      //左边logo
      .left_logo{
        display:flex;
        flex-flow:column;
        justify-content:center;
        align-items:center;
        width:180px;
        height:300px;
        img{
          margin:2rem 0;
          width:70%;
          height:auto;
        }
        .logoFont{
          text-align:right;
          h1{
            font-size:2.8rem;
            font-weight:700;
            color:#EE2859;
          }
          h2{
            font-size:2rem;
            font-weight:700;
            color:#F9E74C;
          }
        }
        @media only screen and (max-width:350px){
          display:none;
        }
      }
      //右边表单
      .right_form{
        display:flex;
        flex-flow:column;
        justify-content:center;
        align-items:center;
        padding:20px 0;
        margin:0 10px;
        width:230px;
        // height:300px;
        border-radius:10px;
        background:rgba(255,255,255,0.6);
        &>input{
          width:180px;
          height:34px;
          font-size:1.6rem;
          border-bottom:1px solid rgb(102, 102, 102);
          background:none;
          &:nth-child(2){
            margin:10px 0;
          }
        }
        p{
          display:flex;
          justify-content:space-between;
          margin:5px 0;
          width:180px;
          font-size:1.6rem;
          font-weight:400;
          color:#333;
          // text-align:right;
          span{
            cursor:pointer;
            &:first-child{
              margin:0 5px;
            }
            &:hover{
              color:rgb(238,50,89);
            }
          }
        }/*p*/
        .verification{
          overflow:hidden;
          // height:104px;
          margin:5px 0;
          display:flex;
          flex-flow:column;
          #canvas{
            margin:5px 0;
            border-radius:4px;
            cursor:pointer;
          }
          input{
            width:100px;
            height:25px;
            font-size:1.6rem;
            //color:rgb(0, 192, 187);
            text-align:center;
            background:none;
            border:1px solid rgb(0, 192, 187);
            border-radius:4px;
          }
        }/*verification*/
        button{
          margin:10px 0;
          width:156px;
          height:24px;
          color:#fafafa;
          background:rgba(228, 38, 85, 1);
          border:none;
          border-radius:4px;
          cursor:pointer;
        }
        .err{
          display:block;
          margin:0 auto;
          font-size:1.6rem;
          font-weight:400;
          color:red;
          text-align:center;
        }
        input:focus{
          outline:none;
        }

      }
    }/*login_main*/
    .close{
      position:absolute;
      top:8px;
      right:8px;
      width:20px;
      height:20px;
      border-radius:20px;
      background:#ff0000;
      cursor:pointer;
    }
  }/*login_transparent*/
}/*#loing*/

//动画效果
//登录框下拉
.slide-enter-active,.slide-leave-active{
  transition:transform 0.5s ease-out;
}
.slide-enter,.slide-leave-to{
  transform:translateY(-100%);
}
.slide-leave,.slide-enter-to{
  transform:translateY(0);
}
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

//验证码的动画效果
.heightSlide-enter-active,.heightSlide-leave-active{
  transition:height 0.3s linear;
}
.heightSlide-enter,.heightSlide-leave-to{
  height:0;
}
.heightSlide-leave,.heightSlide-enter-to{
  height:62px;
}
</style>
