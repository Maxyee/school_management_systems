<style>
        .right-side-bar .block ul li a {
            font-size: 14px;
        }

        #notice-board ul a {
            font-size: 14px;
        }

        @media screen and (min-width: 1400px) {
            .mainwrapper .box {
                margin-right: 13px
            }
        }
    </style>
    <div id="contents" class="sixteen columns">
        <div class="twelve columns" id="left-content">
            <div class="row mainwrapper">
                <div class="pm">
                                        <a href="https://www.youtube.com/watch?v=v1R-CB3e-pw" target="_blank">
                        <img src="{{ asset('frontend') }}/assets/images/banner/National-Portal-Card-PM605c6e0b26125.jpg" width="100%" align="banner">
                    </a>
                </div>
  
<div class="scroll" style="height:40px;font-size:20px"> 
      

<marquee direction="left" scrollamount="4" onmouseover="this.stop()" onmouseout="this.start()">
 
  <ul style="display: inline-flex;" >
 @foreach($slides as $slide)
<li style="display: inline-block;font-size:20px;color:blue"> <a  href="{{ route('post.details',$slide->id) }}">   {!! $slide->title !!}</a></li>
@endforeach

</ul>

   </marquee>
  
	
     
</div>

<style>.pm > a > img {
	width: 100%;
	height: 380px;
}
.scroll {
	background: #E6E7E8;
	padding: 5px 0 0 0;
}

.scroll > h3 {
	font-weight: bold;
	font-size: 22px;
    line-height: 22px;
}

marquee {
	padding: 5px;
}

@media(max-width: 480px){
	iframe {
		height: 215px !important;
	}
	.scroll {
		margin: 0 0 40px 0;
	}
	.pm > a > img {
		width: 100%;
		height: 215px;
	}
}

</style>

<script></script>
                <div class="row" id="notice-board">
                    <div class="notice-board-bg">
                        <h2>নোটিশ</h2>
		<div id="notice-board-ticker">

	<ul>
    @foreach($posts as $post)      
      <li>
<a href="{{ route('post.details',$post->id) }}">{!!Str::words($post->title , 20)!!}...</a>
    </li>
       @endforeach
     </ul>	
			<a class="btn right" href="{{ route('all.posts') }}">সকল নোটিশ</a>
		</div>
	</div>
</div>
<style>#notice-board-ticker ul li{
list-style:none;
}
</style>
