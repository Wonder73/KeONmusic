<template lang="html">
  <div class="app">
    <div class="firstScreen">
      <div class="firstScreen_header">
        <div class="search">
          <svg t="1527305545924" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2010" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="30" @click="searchShow = !searchShow"><path fill="#fff" d="M460.3 817.1c-196.9 0-357-160.1-357-357s160.1-357 357-357 357 160.1 357 357-160.1 357-357 357z m0-672c-173.7 0-315 141.3-315 315s141.3 315 315 315 315-141.3 315-315c0-173.6-141.3-315-315-315zM914.5 914.7c-8.2 8.2-21.5 8.2-29.7 0L736.4 766.2c-8.2-8.2-8.2-21.5 0-29.7s21.5-8.2 29.7 0L914.6 885c8.1 8.2 8.2 21.5-0.1 29.7z" p-id="2011"></path></svg>
          <transition name="searchShowWidth">
            <div class="search_input" v-show="searchShow">
              <i class="microphone fa fa-microphone fa-2x"></i>
              <input type="text" name="search" placeholder="搜索内容" autocomplete="off" v-model="search">
              <p><span><a :href="'./search.html?search='+search">搜索</a></span></p>
            </div>
          </transition>
        </div><!--search-->
        <div class="opeartion_btn">
          <p><router-link to="/Login" tag="span" class="login_btn">登录</router-link></p>
          <div class="upload">
              <img src="../../assets/upload_border.png" alt="">
              <img src="../../assets/upload.png" alt="">
          </div>
          <div class="menu_btn" @click="menu = !menu"><span></span><span></span></div>
        </div><!--opeartion_btn-->
      </div><!--firstScreen_header-->
      <div class="firstScreen_main">
        <div class="logo">
          <img src="../../assets/logo.gif" alt="">
          <h1>KeON<span>Music</span></h1>
          <p>聆听KeON，聆听你的世界</p>
        </div><!--logo-->
        <ul class="choice">
          <li class="recommend">
            <div class="shadow"></div>
            <h1>热门推荐</h1>
            <img src="../../assets/arrow.svg" alt="" @click="more">
          </li><!--recommend-->
          <li class="newSingle">
            <div class="shadow"></div>
            <h1>新歌速递</h1>
            <ul>
              <li>告白气球  - 周杰伦</li>
              <li>告白气球  - 周杰伦</li>
              <li>告白气球  - 周杰伦</li>
            </ul>
            <img src="../../assets/arrow.svg" alt="" @click="newSingle">
          </li><!--recommend-->
          <li class="album">
            <div class="shadow"></div>
            <h1>精选歌单</h1>
            <ul>
              <li>NO.1 周杰伦的床边故事</li>
              <li>NO.2 周杰伦的床边故事</li>
              <li>NO.3 周杰伦的床边故事</li>
            </ul>
            <img src="../../assets/arrow.svg" alt="" @click="album">
          </li><!--recommend-->
          <li class="ranking_list">
            <div class="shadow"></div>
            <h1>排行榜</h1>
            <ul>
              <li>
                <h3>类型</h3>
                <h2>原创 | 翻唱 | 伴奏</h2>
              </li>
              <li>
                <h3>日期</h3>
                <h2>昨日 | 今日 | 本周 | 本月</h2>
              </li>
              <li>......</li>
            </ul>
            <img src="../../assets/arrow.svg" alt="" @click="ranking">
          </li><!--recommend-->
        </ul><!--choice-->
        <div class="firstScreen_footer">
        <p @click="more">MORE</p>
        <svg @click="more" t="1528001066569" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6370" xmlns:xlink="http://www.w3.org/1999/xlink" width="19" height="19"><path d="M503.50707 531.238157l370.269022-368.614335-19.543102-19.455097L503.015883 492.820172 158.912801 145.31562l-19.323091 19.238157 362.557386 368.378975L503.50707 531.238157zM503.50707 531.238157" p-id="6371" fill="#EE2859"></path><path d="M503.50707 871.319645l370.269022-368.613312-19.543102-19.456121L503.015883 832.901661 158.912801 485.398132l-19.323091 19.237133 362.557386 368.379998L503.50707 871.319645zM503.50707 871.319645" p-id="6372" fill="#EE2859"></path></svg>
      </div>
      </div><!--firstScreen-->
    </div><!--firstScreen-->
    <div class="secondScreen">
      <Header :fixed="false"></Header>
      <div class="secondScreen_main">
        <div class="secondScreen_main-recommend">
          <h1 class="title">热门推荐<span>HOT</span></h1>
          <div class="category">
            <ul>
              <li class="active">原创</li>
              <li>翻唱</li>
              <li>伴奏</li>
            </ul>
            <div class="opeartion">
              <p><i class="fa fa-refresh"></i>换一批</p>
              <p><i class="fa fa-play"></i>播放全部</p>
            </div><!--opeartion-->
          </div><!--category-->
          <div class="secondScreen_main-recommend_content">
            <svg @click="prev" t="1528077989055" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5716" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="100"><path d="M475.928544 579.776127L830.519964 936.495947l-58.743837 58.743837a97.055035 97.055035 0 0 1-137.920312 0L220.520558 579.776127a97.906394 97.906394 0 0 1 0-137.920312L633.855815 28.520558a97.906394 97.906394 0 0 1 137.920312 0L830.519964 87.264395l-354.59142 354.59142a97.906394 97.906394 0 0 0 0 137.920312z" p-id="5717"></path></svg>
            <div class="content">
              <ul :style="{'marginLeft':-this.recommend*99+'%'}">
                <li>
                  <ul>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                  </ul>
                </li>
                <li>
                  <ul>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                  </ul>
                </li>
                <li>
                  <ul>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                  </ul>
                </li>
                <li>
                  <ul>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                    <li>
                      <div class="singer_name">
                        <div class="img"><img src="../../assets/u6.jpg"></div>
                        <p>告白气球 - 周杰伦</p>
                      </div>
                      <div class="opeartion">
                        <p>播放量：1234万</p>
                        <i class="fa fa-star"></i>
                        <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
            <svg @click="next" t="1528077989055" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5716" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="100"><path d="M475.928544 579.776127L830.519964 936.495947l-58.743837 58.743837a97.055035 97.055035 0 0 1-137.920312 0L220.520558 579.776127a97.906394 97.906394 0 0 1 0-137.920312L633.855815 28.520558a97.906394 97.906394 0 0 1 137.920312 0L830.519964 87.264395l-354.59142 354.59142a97.906394 97.906394 0 0 0 0 137.920312z" p-id="5717"></path></svg>
          </div>
        </div><!--secondScreen_main-recommend-->
        <div class="secondScreen_main-newBlumn">
          <div class="secondScreen_main-newBlumn_new">
            <div class="secondScreen_main-newBlumn_new-header">
              <h1 class="title">新歌速递<span>NEW</span></h1>
              <p><i class="fa fa-refresh"></i>换一批</p>
            </div><!--secondScreen_main-newBlumn_new-header-->
            <ul>
              <li>
                <div class="img"><img src="../../assets/u6.jpg"></div>
                <div class="singer_name">
                  <p>告白气球 - 周杰伦</p>
                  <p>5分钟前</p>
                </div>
                <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
              </li>
              <li>
                <div class="img"><img src="../../assets/u6.jpg"></div>
                <div class="singer_name">
                  <p>告白气球 - 周杰伦</p>
                  <p>5分钟前</p>
                </div>
                <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
              </li>
              <li>
                <div class="img"><img src="../../assets/u6.jpg"></div>
                <div class="singer_name">
                  <p>告白气球 - 周杰伦</p>
                  <p>5分钟前</p>
                </div>
                <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
              </li>
              <li>
                <div class="img"><img src="../../assets/u6.jpg"></div>
                <div class="singer_name">
                  <p>告白气球 - 周杰伦</p>
                  <p>5分钟前</p>
                </div>
                <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
              </li>
              <li>
                <div class="img"><img src="../../assets/u6.jpg"></div>
                <div class="singer_name">
                  <p>告白气球 - 周杰伦</p>
                  <p>5分钟前</p>
                </div>
                <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
              </li>
              <li>
                <div class="img"><img src="../../assets/u6.jpg"></div>
                <div class="singer_name">
                  <p>告白气球 - 周杰伦</p>
                  <p>5分钟前</p>
                </div>
                <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
              </li>
              <li>
                <div class="img"><img src="../../assets/u6.jpg"></div>
                <div class="singer_name">
                  <p>告白气球 - 周杰伦</p>
                  <p>5分钟前</p>
                </div>
                <svg t="1527306872593" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2436" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><path d="M512 896C299.922286 896 128 724.077714 128 512S299.922286 128 512 128 896 299.922286 896 512 724.077714 896 512 896z m0-36.571429a347.428571 347.428571 0 1 0 0-694.857142 347.428571 347.428571 0 0 0 0 694.857142z m155.428571-331.593142l-219.428571 126.683428a18.285714 18.285714 0 0 1-27.428571-15.835428v-253.366858a18.285714 18.285714 0 0 1 27.428571-15.835428l219.428571 126.683428a18.285714 18.285714 0 0 1 0 31.670858z" p-id="2437"></path></svg>
              </li>
            </ul>
          </div><!--secondScreen_main-newBlumn_new-->
          <div class="secondScreen_main-newBlumn_blumn">
            <div class="secondScreen_main-newBlumn_blumn-header">
              <h1 class="title">精选歌单<span>CHOICENESS</span></h1>
              <p><i class="fa fa-refresh"></i>换一批</p>
            </div><!--secondScreen_main-newBlumn_blumn-header-->
            <ul>
              <li>
                <div class="img">
                  <img src="../../assets/u6.jpg">
                  <div class="opeartion">
                    <p>888首</p>
                    <div class="opeartion_btn"><i class="fa fa-star"></i><i class="fa fa-play"></i></div>
                  </div>
                </div>
                <p>周杰伦的床边故事</p>
              </li>
              <li>
                <div class="img">
                  <img src="../../assets/u6.jpg">
                  <div class="opeartion">
                    <p>888首</p>
                    <div class="opeartion_btn"><i class="fa fa-star"></i><i class="fa fa-play"></i></div>
                  </div>
                </div>
                <p>周杰伦的床边故事</p>
              </li>
              <li>
                <div class="img">
                  <img src="../../assets/u6.jpg">
                  <div class="opeartion">
                    <p>888首</p>
                    <div class="opeartion_btn"><i class="fa fa-star"></i><i class="fa fa-play"></i></div>
                  </div>
                </div>
                <p>周杰伦的床边故事</p>
              </li>
              <li>
                <div class="img">
                  <img src="../../assets/u6.jpg">
                  <div class="opeartion">
                    <p>888首</p>
                    <div class="opeartion_btn"><i class="fa fa-star"></i><i class="fa fa-play"></i></div>
                  </div>
                </div>
                <p>周杰伦的床边故事</p>
              </li>
            </ul>
          </div>
        </div><!--secondScreen_main-newBlumn-->
        <div class="secondScreen_main-ranking">
          <h1 class="title">排行榜<span>RANKING</span></h1>
          <div class="time">
            <ul>
              <li>昨日</li>
              <li class="active">今日</li>
              <li>本周</li>
              <li>本月</li>
            </ul>
            <p>查看全部 > ></p>
          </div><!--time-->
          <ul class="secondScreen_main-ranking_main">
            <li>
              <h1><i class="fa fa-play-circle"></i>原创</h1>
              <div class="play_collection"><span class="active">播放量</span><span>收藏量</span></div>
              <ul>
                <li><span>1</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>2</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>3</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>4</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>5</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>6</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
              </ul>
              <p>更多 > ></p>
              <img src="../../assets/original.png" alt="">
            </li>
            <li>
              <h1><i class="fa fa-play-circle"></i>翻唱</h1>
              <div class="play_collection"><span class="active">播放量</span><span>收藏量</span></div>
              <ul>
                <li><span>1</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>2</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>3</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>4</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>5</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>6</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
              </ul>
              <p>更多 > ></p>
              <img src="../../assets/reversion.png" alt="">
            </li>
            <li>
              <h1><i class="fa fa-play-circle"></i>伴奏</h1>
              <div class="play_collection"><span class="active">播放量</span><span>收藏量</span></div>
              <ul>
                <li><span>1</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>2</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>3</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>4</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>5</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
                <li><span>6</span><p>告白气球 - 周杰伦</p><span>1234万</span></li>
              </ul>
              <p>更多 > ></p>
              <img src="../../assets/accompaniment.png" alt="">
            </li>
          </ul><!--secondScreen_main-ranking_main-->
        </div><!--secondScreen_main-ranking-->
        <div class="secondScreen_main-singer">
          <div class="secondScreen_main-singer_header">
            <h1 class="title">人气音乐人<span>MUSICIAN</span></h1>
            <p>更多 > ></p>
          </div><!--secondScreen_main-singer_header-->
          <ul class="secondScreen_main-singer_mian">
            <li>
              <div class="img"></div>
              <p>Inriye</p>
            </li>
            <li>
              <div class="img"></div>
              <p>Inriye</p>
            </li>
            <li>
              <div class="img"></div>
              <p>Inriye</p>
            </li>
            <li>
              <div class="img"></div>
              <p>Inriye</p>
            </li>
            <li>
              <div class="img"></div>
              <p>Inriye</p>
            </li>
            <li>
              <div class="img"></div>
              <p>Inriye</p>
            </li>
          </ul><!--secondScreen_main-singer_mian-->
        </div><!--secondScreen_main-singer-->
      </div><!--secondScreen_main-->
    </div><!--secondScreen-->
    <div class="footer">
      <img src="../../assets/top_border.png" alt="">
      <p>聆听KeON，聆听整个世界</p>
      <div class="middle">
        <div class="link_partnet">
          <div class="partnet">
            <p>合作伙伴</p>
            <ul>
              <li>QQ音乐</li>
              <li>网易云音乐</li>
              <li>5sing</li>
            </ul>
          </div><!--partnet-->
          <div class="link">
            <p>友情链接</p>
            <ul>
              <li><a href="https://y.qq.com/" target="_blank">QQ音乐</a></li>
              <li><a href="http://music.163.com/" target="_blank">网易云音乐</a></li>
              <li><a href="http://5sing.kugou.com/index.html" target="_blank">5sing</a></li>
              <li><a href="http://www.kugou.com/" target="_blank">酷狗音乐</a></li>
              <li><a href="https://dribbble.com/" target="_blank">Dribbble</a></li>
              <li><a href="https://www.behance.net/" target="_blank">Behance</a></li>
              <li><a href="https://www.lifeofpix.com/" target="_blank">LifeofPix</a></li>
              <li><a href="http://www.zcool.com.cn/" target="_blank">站酷</a></li>
              <li><a href="http://thestocks.im/" target="_blank">TheStock</a></li>
            </ul>
          </div>
        </div><!--linek_partnet-->
        <img src="../../assets/big_logo.png" alt="">
        <div class="client">
          <p>下载KeON音乐客户端</p>
          <ul>
            <li>
              <i class="fa fa-windows"></i>
              <p>Win版</p>
            </li>
            <li>
              <img src="../../assets/mac.png" alt="">
              <img src="../../assets/mac_hover.png" alt="">
              <i class="fa fa-apple"></i>
              <p>Mac版</p>
            </li>
            <li>
              <i class="fa fa-android"></i>
              <p>Android版</p>
            </li>
            <li>
              <i class="fa fa-apple"></i>
              <p>iOS版</p>
            </li>
          </ul>
        </div>
      </div>
      <div class="contact">
        <p>保持联系</p>
        <ul class="style">
          <li>
            <i class="fa fa-weibo"></i>
          </li>
          <li>
            <i class="fa fa-weixin"></i>
          </li>
          <li>
            <i class="fa fa-facebook"></i>
          </li>
          <li>
            <i class="fa fa-twitter"></i>
          </li>
        </ul>
        <ul class="relevant">
          <li>关于KeON音乐</li>
          <li>服务条款</li>
          <li>用户服务协议</li>
          <li>隐私政策</li>
          <li>权力声明</li>
          <li>消息推送</li>
          <li>意见或建议</li>
        </ul>
        <p>Copyright © 1998 - 2018 KeON.<span>All Rights Reserved</span></p>
        <p>KeON音乐网站研发团队<span>版权所有</span></p>
      </div><!--content-->
    </div>
    <div class="goTop" @click="gotTop" v-show="showGoTop"><svg t="1528001066569" class="icon" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6370" xmlns:xlink="http://www.w3.org/1999/xlink" width="200" height="200"><path d="M503.50707 531.238157l370.269022-368.614335-19.543102-19.455097L503.015883 492.820172 158.912801 145.31562l-19.323091 19.238157 362.557386 368.378975L503.50707 531.238157zM503.50707 531.238157" p-id="6371" fill="#ffffff"></path><path d="M503.50707 871.319645l370.269022-368.613312-19.543102-19.456121L503.015883 832.901661 158.912801 485.398132l-19.323091 19.237133 362.557386 368.379998L503.50707 871.319645zM503.50707 871.319645" p-id="6372" fill="#ffffff"></path></svg></div>
    <Menu v-show="menu"></Menu>
    <router-view></router-view>
  </div>
</template>

<script>
import Menu from '@/components/Menu.vue'
import Header from '@/components/Header.vue'
export default {
  mounted(){
    $(window).off('scroll');
    $(window).on('scroll',()=>{
      var scrollTop = document.documentElement.scrollTop;
      var clientHeight = document.documentElement.clientHeight;
      var i = 1;
      if(document.documentElement.scrollTop > 0){
        this.showGoTop = true;
      }else{
        this.showGoTop = false;
      }
      if(scrollTop-this.originScrollTop > 0 && scrollTop < clientHeight){
        var timer = setInterval(() => {
          document.documentElement.scrollTop += (i++);
          if(document.documentElement.scrollTop >= clientHeight){
            clearInterval(timer);
            document.documentElement.scrollTop = this.originScrollTop = clientHeight;
            i = 0;
          }
        },50)
      }else if(scrollTop-this.originScrollTop < 0 ){
        var timer = setInterval(() => {
          document.documentElement.scrollTop -= (i++);
          if(document.documentElement.scrollTop <= 0){
            clearInterval(timer);
            document.documentElement.scrollTop = this.originScrollTop = 0;
            this.showGoTop = false;
            i = 0;
          }
        },50)
      }
    })
  },
  data(){
    return {
      menu:false,
      searchShow:false,
      recommend:0,
      originScrollTop:0,
      micr:false,
      search:'',
      showGoTop:false
    }
  },
  components:{
    Menu,
    Header
  },
  methods:{
    more(){
      var scrollTop = document.documentElement.scrollTop;
      var clientHeight = document.documentElement.clientHeight;
      var i = 1;
      var timer = setInterval(() => {
        document.documentElement.scrollTop += (i++);
        if(document.documentElement.scrollTop >= clientHeight){
          clearInterval(timer);
          document.documentElement.scrollTop = this.originScrollTop = clientHeight;
          i = 0;
        }
      },50)
    },
    newSingle(){
      var scrollTop = document.documentElement.scrollTop;
      var clientHeight = $('.secondScreen_main-newBlumn_new').offset().top;;
      var i = 1;
      var timer = setInterval(() => {
        document.documentElement.scrollTop += (i++);
        if(document.documentElement.scrollTop >= clientHeight){
          clearInterval(timer);
          document.documentElement.scrollTop = clientHeight;
          i = 0;
        }
      },10)
    },
    album(){
      var scrollTop = document.documentElement.scrollTop;
      var clientHeight = $('.secondScreen_main-newBlumn_blumn').offset().top;;
      var i = 1;
      var timer = setInterval(() => {
        document.documentElement.scrollTop += (i++);
        if(document.documentElement.scrollTop >= clientHeight){
          clearInterval(timer);
          document.documentElement.scrollTop = clientHeight;
          i = 0;
        }
      },10)
    },
    ranking(){
      var scrollTop = document.documentElement.scrollTop;
      var clientHeight = $('.secondScreen_main-ranking').offset().top;;
      var i = 1;
      var timer = setInterval(() => {
        document.documentElement.scrollTop += (i++);
        if(document.documentElement.scrollTop >= clientHeight){
          clearInterval(timer);
          document.documentElement.scrollTop = clientHeight;
          i = 0;
        }
      },10)
    },
    next(){
      if(this.recommend < 3){
        this.recommend++;
        console.log(this.recommend);
      }
    },
    prev(){
      if(this.recommend > 0){
        this.recommend--;
        console.log(this.recommend);
      }
    },
    gotTop(){
      var i = 1;
      var timer = setInterval(()=>{
        var scrollTop = document.documentElement.scrollTop;
        document.documentElement.scrollTop = scrollTop - i++;
        if(scrollTop-i <= 0){
          clearInterval(timer);
        }
      },10)
    }
  }
}
</script>

<style lang="scss" scoped>
.app{
  width:100%;
  height:100%;
  .firstScreen{
    display:flex;
    flex-flow:column;
    width:100%;
    height:100%;
    background: url(../../assets/left-bottom_background.png) no-repeat bottom left/100%;
    div.firstScreen_header{
      position:relative;
      display:flex;
      flex-flow:row;
      justify-content:flex-end;
      align-items:stretch;
      width:100%;
      height:60px;
      background:#ee2859 url(../../assets/right-top_background.png) no-repeat top right/100% fixed;
      box-sizing:border-box;
      .search{
        position:absolute;
        top:0;
        left:10px;
        display:flex;
        justify-content:center;
        align-items:center;
        width:60px;
        height:60px;
        transition:background .1s linear;
        background:rgba(0,0,0,0);
        svg{
          cursor:pointer;
        }/*svg*/
        .search_input{
          overflow:hidden;
          position:absolute;
          left:60px;
          display:flex;
          align-items:center;
          height:100%;
          i{
            flex-shrink: 0;
            width:40px;
            height:100%;
            color:rgba(255,255,255,0.2);
            text-align:center;
            line-height:60px;
            background:rgba(51,51,51,0.1);
            &:hover{
              color:rgba(255,255,255,1);
            }
          }/*i*/
          input{
            width:200px;
            height:100%;
            font-size:1.6rem;
            font-weight:400;
            color:#fff;
            border:none;
            background:rgba(51,51,51,0.1);
            &::-webkit-input-placeholder{
              color:#fff;
            }
            &:focus{
              outline:none;
            }
            @media only  screen and (max-width:470px){
              width:150px;
            }
            @media only  screen and (max-width:400px){
              width:100px;
            }
          }/*input*/
          p{
            flex-shrink: 0;
            display:flex;
            justify-content:center;
            align-items: center;
            width:60px;
            height:60px;
            border-radius:60px;
            transition:background .1s linear;
            background:rgba(0,0,0,0);
            cursor:pointer;
            span{
              font-size:1.6rem;
              font-weight:250;
              a{
                color:#fff;
              }
            }
            &:hover{
              background:rgba(0,0,0,0.1);
            }
          }

        }/*search*/
        &:hover{
          background:rgba(0,0,0,0.1);
        }
      }/*search*/
      .opeartion_btn{
        display:flex;
        align-items:center;
        p{
          display:flex;
          justify-content:center;
          align-items: center;
          width:60px;
          height:60px;
          border-radius:60px;
          transition:background .1s linear;
          background:rgba(0,0,0,0);
          cursor:pointer;
          span{
            font-size:1.8rem;
            font-weight:250;
            color:#fff;
          }
          &:hover{
            background:rgba(0,0,0,0.1);
          }
          @media only  screen and (max-width:600px){
            display:none;
          }
        }
        .upload{
          position:relative;
          display:flex;
          justify-content:center;
          align-items:center;
          // margin:0 10px 0 0;
          width:60px;
          height:60px;
          border-radius:60px;
          transition:background .1s linear;
          background:rgba(0,0,0,0);
          cursor:pointer;
          img{
            position:absolute;
            &:last-child{
              transform:rotate(180deg);
            }
          }/*img*/
          &:hover{
            background:rgba(0,0,0,0.1);
          }
          @media only  screen and (max-width:600px){
            display:none;
          }
        }/*upload*/
        .menu_btn{
          position:relative;
          margin:0 29px;
          width:32px;
          height:32px;
          border:2px solid #eee;
          border-radius:32px;
          box-shadow:1px 1px 1px #999,1px 1px 1px #999 inset;
          cursor:pointer;
          z-index:99;
          background:none;
          span{
            display:block;
            position:absolute;
            left:0;right:0;
            margin:0 auto;
            &:first-child{
              top:14px;
              width:18px;
              height:2px;
              background:#eee;
            }
            &:last-child{
              top:7px;
              width:2px;
              height:18px;
              background:#eee;
            }
          }
          @media only screen and (max-width:400px){
            margin:0 20px;
            width:30px;
            height:30px;
          }
        }/*menu_btn*/
      }/*opeartion_btn*/
    }/*firstScreen_header*/
    div.firstScreen_main{
      flex:1;
      display:flex;
      flex-flow:column;
      .logo{
        display:flex;
        flex-flow:column;
        align-items: center;
        padding:10px 0;
        width:100%;
        img{
          margin:0 auto;
          width:180px;
          height:auto;
          @media only screen and (max-width:750px){
            width:100px;
          }
          @media only screen and (max-width:380px){
            width:90px;
          }
        }/*img*/
        h1{
          font-size:2.6rem;
          font-weight:bold;
          color:#EE2859;
          line-height:1.5;
          span{
            font-weight: 700;
            font-size: 1.8rem;
            color: #F9E74C;
          }
        }/*h1*/
        p{
          font-weight: 250;
          font-size: 1.6rem;
          color: #EE2859;
        }/*p*/
      }/*logo*/
      ul.choice{
        flex:1;
        display:flex;
        justify-content:center;
        align-items:center;
        &>li{
          position:relative;
          flex-shrink:0;
          display:flex;
          flex-flow:column;
          justify-content:center;
          align-items:center;
          margin:15px 20px;
          width:230px;
          height:230px;
          background:url(../../assets/u6.jpg) no-repeat center center/cover;
          cursor:pointer;
          div.shadow{
            position:absolute;
            top:0;left:0;
            width:100%;
            height:100%;
            background:rgba(0,0,0,0.5);
            transition:all .2s linear;
          }/*shadow*/
          &>h1{
            margin-bottom:10px;
            font-size:4.0rem;
            font-weight:400;
            color:#00dbd6;
            z-index:2;
            transition:all .2s linear;
            @media only screen and (max-width:900px){
              font-size:3.0rem;
            }
            @media only screen and (max-width:380px){
              font-size:2.8rem;
            }
          }
          img{
            margin-top:6px;
            width:50px;
            height:50px;
            z-index:2;
            transition:all .2s linear;
            @media only screen and (max-width:900px){
              width:40px;
              height:40px;
            }
            @media only screen and (max-width:380px){
              width:30px;
              height:30px;
            }
          }
          &>ul{
            overflow:hidden;
            position:absolute;
            display:flex;
            flex-flow:column;
            justify-content:space-between;
            padding:10px 0;
            box-sizing:border-box;
            height:80px;
            transform:scaleY(0);
            opacity:0;
            transition:all .2s linear;
            border:1px solid;
            li{
              font-size:1.6rem;
              font-weight:400;
              color:#fff;
              @media only screen and (max-width:900px){
                font-size:1.4rem;
              }
            }/*li*/
            z-index:2;
            @media only screen and (max-width:750px){
              padding:5px 0;
            }
            @media only screen and (max-width:380px){
              height:60px;
            }
          }
          &.ranking_list{
            border:1px solid;
            ul{
              height:85px;
              li{
                text-align:center;
                &>h3{
                  line-height:1.5 !important;
                }
              }/*li*/
            }/*ul*/
          }/*li.ranking_list*/
          &:hover{
            h1{
              color:#fff;
              transform: translateY(-100%);
            }
            img{
              transform:translateY(100%) scale(0.7);
              // transform:;
            }
            &>ul{
              opacity:1;
              transform:scaleY(1);
            }
            .shadow{
              background:rgba(0,0,0,0.75);
            }/*shadow*/
          }
          @media only screen and (max-width:1100px){
            width:200px;
            height:200px;
          }
          @media only screen and (max-width:1000px){
            margin:15px 14px;
          }
          @media only screen and (max-width:900px){
            width:180px;
            height:180px;
          }
          @media only screen and (max-width:800px){
            width:150px;
            height:150px;
          }
          @media only screen and (max-width:380px){
            width:130px;
            height:130px;
          }
        }/*li*/
        @media only screen and (max-width:750px){
          margin:0 auto;
          width:370px;
          flex-wrap:wrap;
          justify-content:space-between;
          &>li{
            margin:10px;
          }
        }
        @media only screen and (max-width:380px){
          width:310px;
          &>li{
            margin:5px;
          }
        }
      }/*ul.choice*/
    }/*firstScreen_main*/
    div.firstScreen_footer{
      padding:10px 0;
      display:flex;
      flex-flow:column;
      justify-content:center;
      align-items:center;
      width:100%;
      p{
        font-size:1.8rem;
        font-weight:250;
        color:#EE2859;
        cursor:pointer;
      }
    }
  }/*firstScreen*/
  div.secondScreen{
    padding-bottom:40px;
    width:100%;
    background: url(../../assets/right-top_background.png) no-repeat top right/100%,
                url(../../assets/left-bottom_background.png) no-repeat bottom left/100%,
                url(../../assets/bg1.png) no-repeat -40% 20%/50%,
                url(../../assets/bg2.png) no-repeat 105% 50%/20%,
                url(../../assets/bg1.png) no-repeat 105% 90%/20%;
    div.secondScreen_main{
      margin:0 auto;
      width:1120px;
      min-height:100px;
      &>div{
        display:flex;
        flex-flow:column;
        margin:40px 0;
        width:100%;
        background:rgba(255,255,255,0.85);
        transition:all .2s linear;
        border:1px solid #efefef;
        &.secondScreen_main-recommend{
          display:flex;
          flex-flow:column;
          height:765px;
          h1{
            padding:30px 0;
            font-size:4.2rem;
            font-weight:400;
            color:#999;
            text-align:center;
            transition:all .2s linear;
            box-sizing:border-box;
            span{
              font-size:3rem;
              font-weight:400;
              color:#00dbd6;
              transition:all .2s linear;
            }
            @media only screen and (max-width:800px){
              font-size:3.8rem;
            }
            @media only screen and (max-width:550px){
              padding:20px 0;
              font-size:3.6rem;
              span{
                font-size:2.8rem;
              }
            }
          }/*h1*/
          div.category{
            margin:0 auto;
            padding:0 0 10px 0;
            width:70%;
            display:flex;
            justify-content:space-between;
            align-items:center;
            border-bottom:3px solid #00dbd6;
            ul{
              display:flex;
              align-items:center;
              li{
                margin:0 10px;
                font-size:2.0rem;
                font-weight:400;
                color:#666;
                cursor:pointer;
                &.active{
                  color:#00dbd6;
                }
                @media only screen and (max-width:550px){
                  font-size:1.8rem;
                  margin:0 5px;
                }
              }/*li*/
            }/*ul*/
            .opeartion{
              display:flex;
              align-items:center;
              p{
                &:first-child{
                  margin-right:10px;
                  font-size:2.0rem;
                  font-weight:400;
                  color:#666;
                  cursor:pointer;
                  i{
                    margin-right:10px;
                  }
                  &:hover{
                    color:#00dbd6;
                  }
                  @media only screen and (max-width:550px){
                    font-size:1.8rem;
                  }
                }/*first-child*/
                &:last-child{
                  padding:8px 10px;
                  font-size:1.8rem;
                  font-weight:400;
                  color:#666;
                  border-radius:7px;
                  border:1px solid #666;
                  cursor:pointer;
                  transition:background .1s linear;
                  i{
                    margin-right:5px;
                  }
                  &:hover{
                    background:#00dbd6;
                    border:1px solid #00dbd6;
                    color:#fff;
                  }
                  @media only screen and (max-width:550px){
                    font-size:1.6rem;
                  }
                }/*last-child*/
              }/*p*/
            }
            @media only screen and (max-width:800px){
              width:80%
            }
            @media only screen and (max-width:550px){
              width:98%;
            }
          }/*category*/
          .secondScreen_main-recommend_content{
            display:flex;
            justify-content:center;
            align-items:center;
            margin:0 auto;
            width:100%;
            flex:1;
            &>svg{
              margin:0 20px;
              padding:10px;
              border-radius:8px;
              cursor:pointer;
              path{
                fill:#ccc;
              }
              &:last-child{
                transform:rotate(180deg);
              }
              &:hover{
                background:#00dbd6;
                path{
                  fill:#fff;
                }
              }
              @media only screen and (max-width:800px){
                margin:0 10px;
              }
              @media only screen and (max-width:550px){
                margin:0 10px;
                padding:5px;
                width:30px;
                height:60px;
              }
              @media only screen and (max-width:380px){
                margin:0 5px;
                width:25px;
                height:50px;
              }
              @media only screen and (max-width:350px){
                width:20px;
                height:40px;
              }
            }/*svg*/
            &>.content{
              width:70%;
              overflow:hidden;
              &>ul{
                width:100%;
                display:flex;
                transition:all .6s linear;
                &>li{
                  flex-shrink:0;
                  display:inline-block;
                  width:99%;
                  height:100%;
                  ul{
                    li{
                      display:flex;
                      justify-content: space-between;
                      align-items:center;
                      padding:10px;
                      box-sizing:border-box;
                      transition:all .2s linear;
                      .singer_name{
                        display:flex;
                        align-items:center;
                        .img{
                          flex-shrink:0;
                          margin:0 30px 0 0;
                          width:75px;
                          height:75px;
                          img{
                            width:100%;
                            height:auto;
                          }
                          @media only screen and (max-width:800px){
                            margin:0 20px 0 0;
                            width:65px;
                            height:65px;
                          }
                          @media only screen and (max-width:550px){
                            margin:0 10px 0 0;
                            width:50px;
                            height:50px;
                          }
                          @media only screen and (max-width:350px){
                            width:45px;
                            height:45px;
                          }
                        }/*img*/
                        p{
                          font-size:2.0rem;
                          color:#999;
                          @media only screen and (max-width:800px){
                            font-size:1.8rem;
                          }
                          @media only screen and (max-width:550px){
                            font-size:1.6rem;
                          }
                          @media only screen and (max-width:350px){
                            font-size:1.4rem;
                          }
                        }/*p*/
                      }/*singer_name*/
                      .opeartion{
                        display:flex;
                        align-items:center;
                        p{
                          font-size:2.0rem;
                          color:#999;
                          @media only screen and (max-width:800px){
                            font-size:1.8rem;
                          }
                          @media only screen and (max-width:800px){
                            display:none;
                          }
                        }
                        i{
                          margin:0 10px 0 20px;
                          font-size:3.0rem;
                          color:#999;
                          @media only screen and (max-width:550px){
                            margin:0 5px 0 10px;
                            font-size:2rem;
                          }
                        }
                        svg{
                          cursor:pointer;
                          path{
                            fill:#999;
                          }
                          @media only screen and (max-width:550px){
                            width:30px;
                            height:30px;
                          }
                        }
                      }/*opeartion*/
                      &:hover{
                        background:#00dbd6;
                        box-shadow:0 0 20px rgba(0,0,0,0.2);
                        .singer_name{
                          p{
                            color:#fff;
                          }/*p*/
                        }/*singer_name*/
                        .opeartion{
                          p{
                            color:#fff;
                          }
                          i{
                            color:#fff;
                          }
                          svg{
                            path{
                              fill:#fff;
                            }
                          }
                        }/*opeartion*/
                      }
                    }/*li*/
                  }/*ul*/
                }/*li*/
              }/*ul*/
              @media only screen and (max-width:800px){
                width:80%;
              }
              @media only screen and (max-width:550px){
                width:90%;
              }
            }
          }/*secondScreen_main-recommend_content*/
          @media only screen and (max-width:800px){
            height:665px;
          }
          @media only screen and (max-width:550px){
            height:565px;
          }
        }/*secondScreen_main-recommend*/
        &.secondScreen_main-newBlumn{
          flex-flow:row;
          justify-content:space-between;
          width:100%;
          min-height:665px;
          background:none;
          border:none;
          &>div{
            flex-shrink:0;
            display:flex;
            flex-flow:column;
            width:545px;
            max-height:665px;
            background:rgba(255,255,255,0.85);
            border:1px solid #efefef;
            transition:all .2s linear;
            &>div:first-child{
              display:flex;
              justify-content:space-between;
              align-items:center;
              align-items:center;
              position:relative;
              padding:0 20px;
              box-sizing:border-box;
              h1{
                padding:20px 0 10px 0;
                font-size:3rem;
                font-weight:400;
                color:#666;
                transition:all .2s linear;
                span{
                  font-size:2rem;
                  font-weight:400;
                  color:#00dbd6;
                  transition:all .2s linear;
                }
              }/*h1*/
              &:after{
                position:absolute;
                bottom:0;left:0;
                content:'';
                display:block;
                width:50%;
                height:3px;
                background:#00dbd6;
              }
              p{
                font-size:1.8rem;
                font-weight:400;
                color:#999;
                cursor:pointer;
                i{
                  margin-right:10px;
                }
                &:hover{
                  color:#00dbd6;
                }
              }/*p*/
            }/*secondScreen_newBlumnheader*/
            &.secondScreen_main-newBlumn_new{
              margin:0 10px 0 0;
              ul{
                flex:1;
                padding:20px 30px;
                overflow:auto;
                li{
                  display:flex;
                  align-items:center;
                  justify-content:space-between;
                  padding:10px;
                  transition:all .3s linear;
                  .img{
                    width:75px;
                    height:75px;
                    img{
                      width:100%;
                      height:auto;
                    }
                    @media only screen and (max-width:900px){
                      width:60px;
                      height:60px;
                    }
                  }/*img*/
                  div.singer_name{
                    p{
                      color:#666;
                      font-size:2rem;
                      font-weight:400;
                      text-align:center;
                      line-height:1.5;
                      cursor:pointer;
                      &:last-child{
                        margin-top:10px;
                        font-size:1.6rem;
                        cursor:default;
                      }
                      @media only screen and (max-width:900px){
                        font-size:1.8rem;
                        &:last-child{
                          margin-top:10px;
                          font-size:1.6rem;
                        }
                      }
                    }/*p*/
                  }/*singer_name*/
                  svg{
                    cursor:pointer;
                    path{
                      fill:#666;
                    }
                    @media only screen and (max-width:900px){
                      width:40px;
                      height:40px;
                    }
                  }/*svg*/
                  &:hover{
                    background:#00dbd6;
                    box-shadow:0 0 20px rgba(0,0,0,0.2);
                    .singer_name{p{color:#fff}};
                    svg{path{fill:#fff;}}
                  }
                }/*li*/
              }/*ul*/
            }/*secondScreen_main-newBlumn_new*/
            &.secondScreen_main-newBlumn_blumn{
                margin:0 10px 0 0;
                ul{
                  display:flex;
                  justify-content:center;
                  flex-wrap: wrap;
                  flex:1;
                  overflow:auto;
                  padding:20px 30px;
                  width:100%;
                  border-top:1px solid #ccc;
                  box-sizing:border-box;
                  &>li{
                    display:flex;
                    flex-flow:column;
                    align-items:center;
                    padding:10px;
                    transition:all .3s linear;
                    width:200px;
                    height:255px;
                    border-bottom:1px solid #efefef;
                    .img{
                      overflow:hidden;
                      position:relative;
                      margin:10px auto;
                      width:200px;
                      height:200px;
                      border:1px solid #efefef;
                      background:#00dbd6;
                      transition:all .3s linear;
                      img{
                        width:100%;
                        height:auto;
                      }
                      div.opeartion{
                        position:absolute;
                        left:0;bottom:0;
                        display:flex;
                        justify-content:space-around;
                        align-items:center;
                        width:100%;
                        height:58px;
                        font-size:1.8rem;
                        font-weight:400;
                        color:#fff;
                        background:rgba(0,0,0,0.6);
                        transform:translateY(100%);
                        transition:transform .3s cubic-bezier(0.39, 0.58, 0.57, 1);
                        div.opeartion_btn{
                          i{
                            font-size:2.4rem;
                            cursor:pointer;
                            &:first-child{
                              margin-right:10px;
                              color:#00dbd6;
                            }
                            &:last-child{
                              margin-left:10px;
                            }
                          }/*i*/
                        }/*opeartion_btn*/
                      }/*div.opeartion*/
                      &:hover{
                          box-shadow:1px 1px 20px rgba(0,0,0,0.3);
                        div.opeartion{

                          transform:translateY(0);
                        }

                      }
                    }/*img*/
                    &>p{
                      margin:10px 0 0 0;
                      font-size:1.8rem;
                      font-weight:400px;
                      color:#666;
                      text-align:center;
                    }
                    @media only screen and (max-width:1100px){
                      width:175px;
                      height:210px;
                      .img{
                        width:170px;
                        height:170px;
                      }
                    }
                    @media only screen and (max-width:1000px){
                      width:200px;
                      height:250px;
                      .img{
                        width:200px;
                        height:200px;
                      }
                    }
                    @media only screen and (max-width:800px){
                      width:175px;
                      height:210px;
                      .img{
                        width:170px;
                        height:170px;
                      }
                    }
                  }/*li*/
                }/*ul*/
            }/*secondScreen_main-newBlumn_blumn*/
            &:hover{
              background:rgba(255,255,255,1);
              box-shadow:0 0 20px rgba(0,0,0,0.2);
              h1.title{
                color:#00dbd6 !important;
                span{
                  color:#ee2859 !important;
                }
              }
            }/*hover*/
            @media only screen and (max-width:1125px){
              width:48%;
            }
          }/*div*/
          @media only screen and (max-width:700px){
            flex-flow:column;
            &>div{
              margin:20px 0 !important;
              width:100%;
              &.secondScreen_main-newBlumn_blumn{
                ul{
                  padding:0 !important;
                }
              }
            }
          }
        }/*secondScreen_main-newBlumn*/
        &.secondScreen_main-ranking{
          height:765px;
          h1{
            padding:30px 0;
            font-size:4.2rem;
            font-weight:400;
            color:#666;
            text-align:center;
            transition:all .2s linear;
            box-sizing:border-box;
            span{
              font-size:3rem;
              font-weight:400;
              color:#00dbd6;
              transition:all .2s linear;
            }
          }/*h1*/
          div.time{
            position:relative;
            margin:0 auto;
            display:flex;
            align-items:center;
            justify-content:center;
            width:60%;
            border-bottom:1px solid #efefef;
            ul{
              display:flex;
              justify-content:center;
              align-items:center;
              li{
                position:relative;
                padding:10px 0;
                margin:0 10px;
                font-size:2.2rem;
                font-weight:400;
                color:#666;
                cursor:pointer;
                &.active{
                  font-weight:bold;
                  &:after{
                    position:absolute;
                    bottom:0;left:0;
                    display:block;
                    content:'';
                    width:100%;
                    height:3px;
                    background:#00dbd6;
                  }
                }
              }/*li*/
            }/*ul*/
            p{
              position:absolute;
              right:0;
              font-size:1.8rem;
              font-weight:400;
              color:#999;
              cursor:pointer;
              &:hover{
                color:#00dbd6;
              }
            }/*p*/
            @media only screen and (max-width:700px){
              width:80%;
              p{display:none;}
            }
          }/*.time*/
          ul.secondScreen_main-ranking_main{
            flex:1;
            display:flex;
            justify-content:space-around;
            align-items:center;
            &>li{
              position:relative;
              flex-shrink:0;
              margin:0 15px;
              width:320px;
              height:580px;
              background:rgba(0,219,214,0.85);
              transition:all .2s linear;
              img{
                position:absolute;
                top:0;left:0;
                max-width:100%;
                height:auto;
                opacity:0;
                transition:opacity .2s linear;
                z-index:1;
              }/*img*/
              h1{
                position:relative;
                padding-bottom:15px;
                z-index:2;
                color:#fff;
                i{
                  margin:0 10px 0 0;
                  display:none;
                }
              }/*h1*/
              div.play_collection{
                position:relative;
                margin:0 auto;
                width:130px;
                height:30px;
                border-radius:40px;
                border:1px solid #fff;
                z-index:2;
                span{
                  display:inline-block;
                  width:50%;
                  height:100%;
                  text-align:center;
                  line-height:30px;
                  font-size:1.4rem;
                  font-weight:400;
                  color:#fff;
                  border-radius:40px;
                  cursor:pointer;
                  &.active{
                    background:#fff;
                    color:#00dbd6;
                  }
                }/*span*/
              }/*.play_collection*/
              ul{
                position:relative;
                z-index:2;
                margin:10px 0;
                li{
                  display:flex;
                  align-items:center;
                  padding:15px 0;
                  font-size:1.6rem;
                  font-weight:400;
                  color:#fff;
                  cursor:pointer;
                  background:none !important;
                  border-bottom:1px solid rgba(0, 198, 192, 1);
                  transition:all .2s linear;
                  span{
                    margin:0 10px;
                    &:first-child{
                      display:block;
                      width:30px;
                      height:30px;
                      text-align:center;
                      line-height:30px;
                      border-radius:30px;
                      border:1px solid #fff;
                    }/*first-child(1)*/
                  }/*span*/
                  p{
                    flex:1;
                  }
                  &:hover{
                    background:#fff !important;
                    p,span:last-child{
                      color:#666;
                    }
                    span:first-child{
                      color:#fff;
                      background:#00dbd6;
                    }
                  }
                }/*li*/
              }/*ul*/
              &>p{
                position:absolute;
                bottom:30px;right:20px;
                z-index:2;
                font-size:1.8rem;
                font-weight:400;
                color:#fff;
                cursor:pointer;
              }/*p*/
              &:hover{
                box-shadow:0 0 20px rgba(0,0,0,0.2);
                img{
                  opacity:0.2;
                }
                h1{
                  i{display:inline-block;}
                }
              }/*hover*/
              @media only screen and (max-width:1000px){
                width:280px;
                height:500px;
                ul{
                  li{padding:10px !important;}
                }
              }
              @media only screen and (max-width:900px){
                width:250px;
                height:500px;
                ul{
                  li{padding:10px !important;}
                }
              }
            }/*li*/
            @media only screen and (max-width:800px){
              overflow:auto;
              justify-content:flex-start;
              &::-webkit-scrollbar {
          		}

          		&::-webkit-scrollbar-track-piece {
          		    background-color: rgba(0, 0, 0, 0);
          		}

          		&::-webkit-scrollbar-thumb:vertical {
          		    background-color: rgba(125, 125, 125, 0);
          		}

          		&::-webkit-scrollbar-thumb:horizontal {
          		    background-color: rgba(125, 125, 125, 0);
          		}
            }
          }/*secondScreen_main-ranking_mian*/
        }/*secondScreen_main-ranking*/
        &.secondScreen_main-singer{
          height:300px;
          margin:0 auto;
          box-sizing:border-box;
          .secondScreen_main-singer_header{
            display:flex;
            justify-content:space-between;
            align-items:center;
            align-items:center;
            position:relative;
            padding:0 20px;
            box-sizing:border-box;
            h1{
              padding:20px 0 10px 0;
              font-size:3rem;
              font-weight:400;
              color:#666;
              transition:all .2s linear;
              span{
                font-size:2rem;
                font-weight:400;
                color:#00dbd6;
                transition:all .2s linear;
              }
            }/*h1*/
            &:after{
              position:absolute;
              bottom:0;left:0;
              content:'';
              display:block;
              width:30%;
              height:3px;
              background:#00dbd6;
            }
            p{
              font-size:1.8rem;
              font-weight:400;
              color:#999;
              cursor:pointer;
              &:hover{
                color:#00dbd6;
              }
            }/*p*/
          }/*secondScreen_main-singer_header*/
          .secondScreen_main-singer_mian{
            flex:1;
            display:flex;
            justify-content:space-around;
            align-items:center;
            li{
              flex-shrink:0;
              margin:0 10px;
              div.img{
                width:120px;
                height:120px;
                border-radius:120px;
                border:1px solid #efefef;
                background:#00dbd6;
                opacity:0.85;
                transition:all .2s linear;
                @media only screen and(max-width:900px){
                  width:100px;
                  height:100px;
                }
              }/*img*/
              p{
                margin-top:10px;
                font-size:1.8rem;
                font-weight:400;
                color:#666;
                text-align:center;
              }
            }/*li*/
            @media only screen and(max-width:750px){
              overflow:auto;
              justify-content:flex-start !important;
              &::-webkit-scrollbar {
          		}

          		&::-webkit-scrollbar-track-piece {
          		    background-color: rgba(0, 0, 0, 0);
          		}

          		&::-webkit-scrollbar-thumb:vertical {
          		    background-color: rgba(125, 125, 125, 0);
          		}

          		&::-webkit-scrollbar-thumb:horizontal {
          		    background-color: rgba(125, 125, 125, 0);
          		}
            }
          }/*secondScreen_main-singer_mian*/
        }/*secondScreen_main-singer*/
        &:not(.secondScreen_main-newBlumn):hover{
          background:rgba(255,255,255,1);
          box-shadow:0 0 20px rgba(0,0,0,0.2);
          h1.title{
            color:#00dbd6 !important;
            span{
              color:#ee2859 !important;
            }
          }
          &.secondScreen_main-singer{
            .secondScreen_main-singer_mian{
              li{div.img{opacity:1;}}
            }/*secondScreen_main-singer_mian*/
          }/*secondScreen_main-singer*/
          &.secondScreen_main-ranking{
            .secondScreen_main-ranking_main{
                li{
                  background:rgba(0,219,214,1);
                }
            }
          }/*secondScreen_main-ranking*/
        }/*hover*/
      }/*div*/
      @media only screen and (max-width:1200px){
        width:98%;
      }
    }/*secondScreen_main*/
  }/*secondScreen*/
  div.footer{
    position:relative;
    display:flex;
    flex-flow:column;
    align-items:center;
    width:100%;
    min-height:200px;
    color:rgba(255, 255, 255, 0.298039215686275);
    font-weight:400;
    font-size:2rem;
    background:rgba(53, 56, 62, 1);
    &>img{
      position:absolute;
      top:0;left:0;
      width:100%;
    }/*img*/
    &>p{
      margin:30px 0 30px 0;
    }
    .middle{
      display:flex;
      justify-content:space-around;
      align-items:center;
      width:100%;
      .link_partnet{
        .partnet{
          margin-bottom:30px;
          text-align:center;
          ul{
            display:flex;
            justify-content:center;
            margin:10px 0;
            li{
              margin:0 10px;
              padding:5px 15px;
              font-size:1.6rem;
              border:1px solid rgba(255, 255, 255, 0.298039215686275);
              border-radius:5px;
            }
          }
        }/*.partnet*/
        .link{
          margin-top:30px;
          text-align:center;
          ul{
            display:flex;
            flex-wrap:wrap;
            margin:10px 0;
            width:430px;
            li{
              margin:0 5px;
              padding:5px 5px;
              font-size:1.6rem;
              cursor:pointer;
              &:hover{
                a{
                  color:#00dbd6;
                }
              }/*hover*/
            }/*li*/
          }/*ul*/
        }/*link*/
      }/*link_partnet*/
      img{
        width:82px;
        height:auto;
      }/*img*/
      .client{
        width:430px;
        height:100%;
        p{
          margin:0 0 30px 0;
        }
        ul{
          display:flex;
          justify-content:space-between;
          margin:20px 0;
          li{
            display:flex;
            flex-flow:column;
            justify-content:space-between;
            align-items:center;
            cursor:pointer;
            i{
              flex:1;
              font-size:7rem;
            }
            p{
              margin:10px 0 0 0;
              text-align:center;
            }
            &:nth-child(2){
              position:relative;
              img:nth-child(2){
                display:none;
              }
              i{
                position:absolute;
                top:16%;left:38%;
                font-size:3rem;
              }
            }
            &:hover{
              i{
                color:#00dbd6;
              }
              p{
                color:#00dbd6;
              }
              &:nth-child(2){
                img:nth-child(2){
                  display:block;
                }
                img:nth-child(1){
                  display:none;
                }
              }
            }
          }/*li*/
        }/*ul*/
      }/*client*/
      @media only screen and (max-width:1100px){
        display:none;
      }
    }/*middle*/
    .contact{
      p{
        margin-top:10px;
        text-align:center;
        &:first-child{
          letter-spacing:2px;
        }
      }
      .style{
        display:flex;
        justify-content:center;
        align-items:center;
        margin:20px 0;
        li{
          margin:0 20px;
          cursor:pointer;
          i{
            font-size:3rem;
          }
          &:nth-child(1):hover i{color:#cd281e;}
          &:nth-child(2):hover i{color:#09bb07;}
          &:nth-child(3):hover i{color:#4267b2;}
          &:nth-child(4):hover i{color:#1da1f2;}
        }/*li*/
      }/*.style*/
      .relevant{
        display:flex;
        justify-content:center;
        align-items:center;
        flex-wrap:wrap;
        font-size:1.6rem;
        line-height:1.5;
        li{
          flex-shrink:0;
          padding:0 10px;
          border-right:1px solid rgba(255, 255, 255, 0.298039215686275);
          cursor:pointer;
          &:last-child{border:none;}
          &:hover{color:#00dbd6;}
        }
      }/*relevant*/
      p:last-child,p:nth-last-child(2){
        font-size:1.6rem;
        margin:10px 0;
        letter-spacing:1px;
        span{cursor:pointer;}
        span:hover{
          color:#00dbd6;
        }
      }/*p*/
    }/*contact*/
  }/*footer*/
  .goTop{
    position:fixed;
    right:5%;
    bottom:10%;
    display:flex;
    justify-content:center;
    align-items:center;
    width:40px;
    height:40px;
    border-radius:10px;
    background:rgba(255,255,255,0.85);
    cursor:pointer;
    transition:all .3s linear;
    svg{
      width:30px;
      height:30px;
      transform:rotate(180deg);
      path{
        fill:#00dbd6;
      }
    }
    &:hover{
      background:rgba(255,255,255,1);
      box-shadow:0 0 10px rgba(0,0,0,0.2);
    }
  }
}/*index*/
.searchShowWidth-enter-active,.searchShowWidth-leave-active{
  transition:width .3s linear;
}
.searchShowWidth-enter,.searchShowWidth-leave-to{
  width:0;
}
.searchShowWidth-leave,.searchShowWidth-enter-to{
  width:300px;
}
</style>

<style lang="scss">
html{
  width:100%;
  height:100%;
    font-size:52.5% !important;
}
body {
  width:100%;
  height:100%;
    background:radial-gradient(#fafafa, #eeeeee) no-repeat center center/100% fixed;
}
</style>
