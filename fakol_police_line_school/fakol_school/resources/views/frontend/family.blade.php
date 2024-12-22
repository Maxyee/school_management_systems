@php
	$category=DB::table('categories')->orderBy('id','ASC')->get();
	$seo=DB::table('seos')->first();
	$social=DB::table('socials')->first();
	$horizontal1=DB::table('ads')->where('type',2)->first();
	$setting=DB::table('settings')->first();
@endphp
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="{{ $seo->meta_author }}">
        <meta name="keyword" content="{{ $seo->meta_keyword }}">
        <meta name="description" content="{{ $seo->meta_description }}">
        <meta name="google-verification" content="{{ $seo->google_verification }}">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        @yield('meta')
     
        <title>{{ $seo->meta_title }} | প্রাইভেসি অ্যান্ড পলিসি</title>
         
     <link rel="icon" href="{{ asset($setting->favicon) }}">

    <!-- Css Link Start    -->
    <!-- <link rel="stylesheet" href="assets/css/all.min.css"> -->
    <link rel="stylesheet" href="{{ asset('public/frontend/assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/frontend/assets/css/line-awesome.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/frontend/assets/css/stellarnav.css') }}">
    <link rel="stylesheet" href="{{ asset('public/frontend/assets/css/jquery-ui.css') }}">
    <link rel="stylesheet" href="{{ asset('public/frontend/assets/css/gallery5.html') }}">
    <link rel="stylesheet" href="{{ asset('public/frontend/assets/css/magnific-popup.css') }}">
    <link rel="stylesheet" href="{{ asset('public/frontend/assets/css/owl.carousel.min.css') }}">
     <link rel="stylesheet" href="{{ asset('public/frontend/assets/css/responsive.css') }}">
     <link rel="stylesheet" href="{{ asset('public/frontend/assets/css/slick.css') }}">
     <link rel="stylesheet" href="{{ asset('public/frontend/assets/css/all.css') }}">
    <link rel="stylesheet" href="{{ asset('public/frontend/style.css') }}">


    
    
    
    

</head>



<body>
<script src="https://bangla.plus/scripts/bangladatetoday.min.js"></script>
<script>dateToday('date-today', 'bangla');</script>
@php
    function bn_date($str)
        {
         $en = array(1,2,3,4,5,6,7,8,9,0);
        $bn = array('১','২','৩','৪','৫','৬','৭','৮','৯','০');
        $str = str_replace($en, $bn, $str);
        $en = array( 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' );
        $en_short = array( 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' );
        $bn = array( 'জানুয়ারী', 'ফেব্রুয়ারী', 'মার্চ', 'এপ্রিল', 'মে', 'জুন', 'জুলাই', 'অগাস্ট', 'সেপ্টেম্বর', 'অক্টোবর', 'নভেম্বর', 'ডিসেম্বর' );
        $str = str_replace( $en, $bn, $str );
        $str = str_replace( $en_short, $bn, $str );
        $en = array('Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday');
         $en_short = array('Sat','Sun','Mon','Tue','Wed','Thu','Fri');
         $bn_short = array('শনি', 'রবি','সোম','মঙ্গল','বুধ','বৃহঃ','শুক্র');
         $bn = array('শনিবার','রবিবার','সোমবার','মঙ্গলবার','বুধবার','বৃহস্পতিবার','শুক্রবার');
         $str = str_replace( $en, $bn, $str );
         $str = str_replace( $en_short, $bn_short, $str );
         $en = array( 'am', 'pm' );
        $bn = array( 'পূর্বাহ্ন', 'অপরাহ্ন' );
        $str = str_replace( $en, $bn, $str );
         $str = str_replace( $en_short, $bn_short, $str );
         $en = array( '১২', '২৪' );
        $bn = array( '৬', '১২' );
        $str = str_replace( $en, $bn, $str );
         return $str;
        }
@endphp
           
<script>
                        setInterval(displayTime, 1000);

function displayTime() {

    const timeNow = new Date();

    let hoursOfDay = timeNow.getHours();
    let minutes = timeNow.getMinutes();
    let seconds = timeNow.getSeconds();
    let weekDay = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let today = weekDay[timeNow.getDay()];
    let months = timeNow.toLocaleString("default", {
        month: "long"
    });
    let year = timeNow.getFullYear();
    let period = "AM";

    if (hoursOfDay > 12) {
        hoursOfDay-= 12;
        period = "PM";
    }

    if (hoursOfDay === 0) {
        hoursOfDay = 12;
        period = "AM";
    }

    hoursOfDay = hoursOfDay < 10 ? "0" + hoursOfDay : hoursOfDay;
    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;

    let time = hoursOfDay + ":" + minutes + ":" + seconds + " " + period;

   document.getElementById('Clock').innerHTML = time ;
    
    var chars = {'1':'১','2':'২','3':'৩','4':'৪','5':'৫','6':'৬','7':'৭','8':'৮','9':'৯','0':'০','A':'এ','P':'পি','M':'এম'};
    let str = document.getElementById("Clock").innerHTML; 
    let res = str.replace(/[1234567890AMP]/g, m => chars[m]);
    document.getElementById("Clock").innerHTML = res;

}
displayTime();

                        </script>
                            
                     

   

    
    <header class="header2">
        <div class="container">
            <div class="header-border2">
                <div class="row">
                    <div class="col-lg-7 col-md-7">
                        <div class="header-date2">
                            <i class="las la-map-marker"></i> ঢাকা <i class="lar la-calendar-minus"></i> 
                                                                                                      
                                    <span id ="Clock" onload="displayTime()"></span> | <span id="date-today"></span> বঙ্গাব্দ

                                     
                            
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <div class="header2-social">
                                                                                                    <a href="{{ $social->facebook }}" target="_blank" title="facebook"><i class="lab la-facebook-f"></i> </a>
                                                                                                            <a href="{{ $social->twitter }}" target="_blank" title="twitter"><i class="lab la-twitter"> </i> </a>
                                                                                                            <a href="{{ $social->linkedin }}" target="_blank" title="linkedin"><i class="lab la-linkedin-in"> </i> </a>
                                                                                                            <a href="{{ $social->youtube }}" target="_blank" title="youtube"><i class="lab la-youtube"> </i> </a>
                                                            
                        </div>
                    </div>
                </div>

            </div>

                <div class="hader2-logoBanner">
                    <div class="row">
                        <div class="col-lg-4 col-md-4">
                            <div class="logo2">
                              <a href="{{ URL::to('/') }}"> <img src="{{ asset($setting->logo) }}" alt="{{ $seo->meta_title }}"> </a>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-8">
                            <div class="banner2">
                                                                        <a href="{{ $horizontal1->link }}" target="_blank"><img src="{{ asset($horizontal1->ads) }}" alt="{{ $seo->meta_title }}"></a>
                                         
                            </div>
                        </div>
                    </div>
                </div>

          
        </div>
    </header>

       

                    <!--=========Elitedesign==============
                        Menu-section-Start
                    =============Elitedesign=============-->           
        <div class="menu-section" id="myHeader">
            <div class="container">
                <div class="row">
                    <div class="col-lg-11 col-md-11">
                        <div class="mobile_logo">
                            <a href="{{ URL::to('/') }}"> <img src="{{ asset($setting->mobilelogo) }}" alt="{{ $seo->meta_title }}"> </a>
                        </div>
                        <div class="stellarnav">
                            <ul>
                                <li class="active"><a href="{{ URL::to('/') }}"> <i class="las la-home"></i> প্রচ্ছদ</a></li>
				              @foreach($category as $row)
										     @php
										       $subcategory=DB::table('subcategories')->where('category_id',$row->id)->get();
										     @endphp
											<li class="dropdown">
												<a href="{{ URL::to('post/'.$row->id.'/'.$row->category_bn)}}" class="dropdown-toggle" data-toggle="dropdown">
													@if(session()->get('lang') == 'english')
													   {{ $row->category_en }} 
													@else
													  {{ $row->category_bn }} 
													 @endif
												</a>
											<ul class="dropdown-menu">
												@foreach( $subcategory as $row)
												<li><a href="{{ URL::to('posts/'.$row->id.'/'.$row->subcategory_bn)}}">
													@if(session()->get('lang') == 'english')
													   {{ $row->subcategory_en }} 
													@else
													  {{ $row->subcategory_bn }} 
													 @endif
												</a></li>
												@endforeach	
											</ul>
											</li>
										@endforeach
                                                                                    
                            </ul>
                        </div><!-- .stellarnav -->
                    </div>
                    
                    <div class="col-lg-1 col-md-1">
                        <div id="wrapper">
                            <div class="menuIcon">
                            ‍<span>  </span> 
                                <div class="circle icon">
                                        
                                    </div>
                            </div>
                        </div>

                        <div class="searchIcon">
                            <i class="las la-search"></i>
                        </div>
                        
                        <form class="searchBar" method="get" action="https://eliteDesign.xyz/laratemplate/news/post/search">
                            <input type="hidden" name="_token" value="t0US1pRhVVSNz7peRHyH30u5qHtW7B8YMqojyRJD">                             <input type="text" name="search"  placeholder="এখানে লিখুন">
                            <button><input type="submit" value="খুজুন"></button>
                            
                            <div class="remove">
                                <i class="las la-times"></i>
                            </div>

                        </form>

                    </div>         
                    
                    
                </div>

            

            </div>
            
        </div>

                    <!--==========Elitedesign=============
                        Menu-section-End
                    ==============Elitedesign============-->

<div class="all-section" style="overflow: hidden;"><!-- All Section-->
                        <section class="team-section">
                            <div class="container">
                                <div class="row">
                                    

                                                                        <div class="themesBazar-4 themesBazar-m2">
                                        <div class="team-wrpp">
                                            <div class="team-image">
                                                <img src="https://themebazar.xyz/laratemplate/public/reporter/63baa9da74a52.jpg" alt="মো. হেলাল উদ্দিন">
                                            </div>
                                            <h1 class="team-name">
                                                <a href="https://themebazar.xyz/laratemplate/reporter/details/1"> মো. হেলাল উদ্দিন  </a>
                                            </h1>
                                            <h6 class="team-deg">
                                                সম্পাদক ও প্রকাশক 
                                            </h6>
                                        </div>
                                        
                                    </div>
                                                                        <div class="themesBazar-4 themesBazar-m2">
                                        <div class="team-wrpp">
                                            <div class="team-image">
                                                <img src="https://themebazar.xyz/laratemplate/public/reporter/63baaa576669a.png" alt="রাজিব আহমেদ">
                                            </div>
                                            <h1 class="team-name">
                                                <a href="https://themebazar.xyz/laratemplate/reporter/details/2"> রাজিব আহমেদ  </a>
                                            </h1>
                                            <h6 class="team-deg">
                                                স্টাফ রিপার্টার 
                                            </h6>
                                        </div>
                                        
                                    </div>
                                                                        <div class="themesBazar-4 themesBazar-m2">
                                        <div class="team-wrpp">
                                            <div class="team-image">
                                                <img src="https://themebazar.xyz/laratemplate/public/reporter/63baaaa189cba.jpg" alt="হুমায়ূন আহমেদ">
                                            </div>
                                            <h1 class="team-name">
                                                <a href="https://themebazar.xyz/laratemplate/reporter/details/3"> হুমায়ূন আহমেদ  </a>
                                            </h1>
                                            <h6 class="team-deg">
                                                ঢাকা জেলা প্রতিনিধি 
                                            </h6>
                                        </div>
                                        
                                    </div>
                                                                        <div class="themesBazar-4 themesBazar-m2">
                                        <div class="team-wrpp">
                                            <div class="team-image">
                                                <img src="https://themebazar.xyz/laratemplate/public/reporter/63baaad50a665.jpg" alt="জাকারিয়া আহমেদ">
                                            </div>
                                            <h1 class="team-name">
                                                <a href="https://themebazar.xyz/laratemplate/reporter/details/4"> জাকারিয়া আহমেদ  </a>
                                            </h1>
                                            <h6 class="team-deg">
                                                সিলেট প্রতিনিধি 
                                            </h6>
                                        </div>
                                        
                                    </div>
                                    
                        <div style="text-align: center; display: ruby; margin:20px">  </div>
                                    
            
            
            
                                </div>
                                
                            
                            </div>
                        </section>
                      
                      
                
                  
                     
                    </div>


                                
                            
        
        
                
       
                    <!--=======================
                        Elitedesign_Footer_section_Start
                    ==========================-->    

                            
            <footer class="footer-area">
                <div class="container">
                    <div class="footerMenu-content">
                        
                    <div class="footerMenu-wrpp">
                            <ul>
                                      @foreach($category as $row)
											<li class="dropdown">
												<a href="{{ URL::to('post/'.$row->id.'/'.$row->category_bn)}}" class="dropdown-toggle" data-toggle="dropdown">
													@if(session()->get('lang') == 'english')
													   {{ $row->category_en }} 
													@else
													  {{ $row->category_bn }} 
													 @endif
												</a>
											</li>
										@endforeach
										<li><a href="all/video/gallery.html" > ভিডিও গ্যালারী </a></li>
                                                                 <li><a href="all/photo/gallery.html" > ফটোগ্যালারী </a></li>

                            </ul>                    
                                         
                    </div>
                    <div class="editorial_content">
                        <div class="row">
                            <div class="col-lg-4 col-md-4">
                                                                <h3 class="footer-title">
                                সম্পাদকীয়ঃ
                                </h3>
                                                                <div class="footer-contentLeft">
                                    <p align="left">প্রধান উপদেষ্টাঃ     {{ $setting->chiefadvisor }}</p><p align="left">সম্পাদক ও প্রকাশকঃ    {{ $setting->publisher }} </p><p align="left">ব্যবস্থাপনা সম্পাদকঃ    {{ $setting->managingeditor }}<br></p><p align="left">বার্তা সম্পাদকঃ     {{ $setting->messageeditor }}</p><p align="left"><br></p>
                                </div>
                            </div>
    
                            <div class="col-lg-4 col-md-4">
                                                                <h3 class="footer-title">
                                বার্তা ও বানিজ্যিক কার্যালয়ঃ
                                </h3>
                                                                <div class="footer-contentRight">
                                    <p align="left">{{$setting->address_bn}}</p><p align="left">ইমেইলঃ {{ $setting->email }}</p><p align="left">মোবাইলঃ  {{ $setting->phone_bn }}<br></p>
                                </div>
                            </div>
    
                            <div class="col-lg-4 col-md-4">                        
                            
                                                                <h3 class="footer-title">
                                    ফুটার মেনুঃ
                                </h3>
                                                                <div class="footer-menu2">
                                    <ul>
                                                                                        <li><a href="#" >আমাদের সম্পর্কে</a></li>
                                                                                                <li><a href="#" >সাইটম্যাপ</a></li> 
                                                                                                <li><a href="#" >ভিডিও গ্যালারী</a></li>
                                                                                                <li><a href="#" >ফটোগ্যালারী</a></li>
                                                 
                                                                
                                </ul>                
                                
                            </div>
    
    
    
    
                        </div>
                        <div class="copy_right_section">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="copy-right">
                                        © সকল কিছুর স্বত্বাধিকারঃ {{ $seo->meta_title }} | আমাদের সাইটের কোন বিষয়বস্তু অনুমতি ছাড়া কপি করা দণ্ডনীয় অপরাধ
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="design-developed">
                                      সকল কারিগরী সহযোগিতায়  <a href="https://www.elitedesign.com.bd/" target="_blank" title="Elitedesign.com.bd"> এলিট ডিজাইন </a>
                                </div>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="scrollToTop"><i class="las la-long-arrow-alt-up"></i></a>
    
                        </div>
                    </div>  
            </footer>     
                                        
    @php

        $notice=DB::table('notices')->first();                
	 @endphp	
            
             <div class="footer-scrool">
                <div class="footer-scrool-1">
                    <span> নোটিশ </span>
                </div>
                 

                 

                

                <div class="footer-scrool-2">
                     

                    <marquee direction = "left" scrollamount="5px" onmouseover="this.stop()" onmouseout="this.start()"> 


                        <a href="{{ URL::to('/') }}">
                    <i class="lar la-dot-circle"></i>{{ $notice->notice }}</a>
        
                    </marquee>
                </div>


            </div>
             
            
          
    



        <script src="{{ asset('public/frontend/assets/js/jquery-3.6.0.min.js') }}"></script>
        <script src="{{ asset('public/frontend/assets/js/bootstrap.min.js') }}"></script>
        <script src="{{ asset('public/frontend/assets/js/bootstrap.bundle.min.js') }}"></script>
        <script src="{{ asset('public/frontend/assets/js/stellarnav.min.js') }}"></script>
        <script src="{{ asset('public/frontend/assets/js/owl.carousel.min.js') }}"></script>
        <script src="{{ asset('public/frontend/assets/js/jquery.magnific-popup.min.js') }}"></script>
        <script src="{{ asset('public/frontend/assets/js/jquery-ui.js') }}"></script>
        <script src="{{ asset('public/frontend/assets/js/lazyload.min.js') }}"></script>
        <script src="{{ asset('public/frontend/assets/js/slick.min.js') }}"></script>
        <script src="{{ asset('public/frontend/assets/js/main.js') }}"></script>
    </body>
</html>
