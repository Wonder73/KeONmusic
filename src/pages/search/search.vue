<template>
	<div id="search">
		<ul class="nav">
			<router-link to="/Single" tag="li">单曲</router-link>
			<router-link to="/Singer" tag="li">用户/音乐人</router-link>
			<router-link to="/SongSheet" tag="li">歌单</router-link>
			<router-link to="/MV" tag="li">MV</router-link>
			<router-link to="/Lyric" tag="li">歌词</router-link>
		</ul>
		<Header :fixed="true"></Header>
		<InfoMenu></InfoMenu><!--左边用户信息栏-->
    <Minimize></Minimize>
		<router-view></router-view>
	</div>
</template>

<script>
import InfoMenu from '@/components/InfoMenu'
import Minimize from '@/components/Minimize'
import Header from '@/components/Header'
	export default {
		name:'search',
		components:{
			InfoMenu,
			Minimize,
			Header
		}
	}
</script>

<style lang="scss" scoped>
#search{
	padding-top:70px;
	.nav{
		display:flex;
		margin:10px auto;
		width:750px;
		li{
			flex-grow:1;
			position:relative;
			padding:6px 0;
			font-size:1.8rem;
			font-weight:400;
			color:#333;
			text-align:center;
			cursor:pointer;
			&:hover{
				color:#00bcd4;
			}
			&:hover:after{
				width:100%;
			}
			&:after{
				content:'';
				display:block;
				position:absolute;
				bottom:-3px;
				left:0;right:0;
				margin:0 auto;
				width:0;
				height:3px;
				background:#00bcd4;
				border-radius:3px;
				transition:width .2s linear;
			}
			&.active{
				color:#00bcde;
				&:after{
					width:100%;
				}
			}
		}
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
		@media only screen and (max-width:750px){
			width:95%;
		}
		@media only screen and (max-width:500px){
			overflow:auto;
			li{
				flex-shrink:0;
				width:90px;
			}
		}
	}/*nav 导航*/

}
</style>

<style lang="scss">
html{
    font-size:52.5% !important;
}
body {
    background: radial-gradient(#fafafa, #eeeeee) no-repeat center center/100% fixed;
}
</style>
