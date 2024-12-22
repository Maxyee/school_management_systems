@extends('layouts.front')
@section('content')
@php
     $firstsectionbig=DB::table('posts')->where('first_section_thumbnail',1)->orderBy('id','DESC')->first();
	 $firstsectionsmall=DB::table('posts')->where('first_section',1)->orderBy('id','DESC')->limit(20)->get();
	 $firstsectionheding=DB::table('posts')->where('headline',1)->orderBy('id','DESC')->limit(12)->get();
     $setting=DB::table('settings')->first();
	 $social=DB::table('socials')->first();
	 
@endphp
 <!--============Scroll 03 start==============-->
    @php
	 $headline=DB::table('posts')
                        ->join('categories','posts.cat_id','categories.id')
                        ->join('subcategories','posts.subcat_id','subcategories.id')
                        ->select('posts.*','categories.category_bn','subcategories.subcategory_bn')
                        ->where('posts.headline',1)
                        ->orderBy('id','DESC')
                        ->limit(5)
                        ->get();  						
	 @endphp  
        
 
 
  <!--=========elitesDesign==============
                        Slider section Start
            =============elitesDesign=============-->  
        <div class="slider-section">
            <div class="slider-content">
                <div class="slider-active owl-carousel">
                    
														
					<div class="slider_wrpp">
					                        <div class="slide_image">
                            <a href="#"> <img src="{{ asset($setting->baner1 ??'') }}" /> </a>               
                        </div>
								                         <div class="slider-padding">
                            <div class="container">
                                <div class="slider-item">
                                    <h1 class="slider-title">
                                        {{$setting->baner1_text ??''}}                               </h1>                            
                                </div>
                            </div>
                        </div>
                    </div>
					
														
					<div class="slider_wrpp">
					                        <div class="slide_image">
                            <a href="#"> <img src="{{ asset($setting->baner2 ??'') }}" /> </a>               
                        </div>
								                         <div class="slider-padding">
                            <div class="container">
                                <div class="slider-item">
                                    <h1 class="slider-title">
                                         {{$setting->baner2_text ??''}}                          </h1>                            
                                </div>
                            </div>
                        </div>
                    </div>
					
														
					<div class="slider_wrpp">
					                        <div class="slide_image">
                            <a href="#"> <img src="{{ asset($setting->baner3 ??'') }}" /> </a>               
                        </div>
								                         <div class="slider-padding">
                            <div class="container">
                                <div class="slider-item">
                                    <h1 class="slider-title">
                                       {{$setting->baner3_text ??''}}                                </h1>                            
                                </div>
                            </div>
                        </div>
                    </div>
					
														
					
					
					
                  
                   
                
                </div>
            </div>
        </div>
            
            <!--=========elitesDesign==============
                Slider section End
            =============elitesDesign=============-->  
                                
                                                
 
   
 								
 <div class="top-scroll-section5">  
               
                    <div class="alert" role="alert">
                        <div class="scroll-section5">
                            <div class="row">
                            <div class="col-md-12">
	  @php

        $notice=DB::table('notices')->first();                
	 @endphp
                                <div class="top_scroll2"> 
                                    <div class="scroll5-left">
                                        <div id="scroll5-left">
                                            <span> জরুরী ঘোষণা : </span>
                                        </div>
                                
                                    </div>
                                
                                    <div class="scroll5-right">
                                        <marquee direction="left" scrollamount="5px" onmouseover="this.stop()" onmouseout="this.start()"> 
                                            
																
                                            <a href="#"> <i class="las la-bullseye"></i>{{ $notice->notice ??''}}</a>
											
                                                                                   
                                        </marquee>
                                    </div>
                                    <div class="scroolbar5">
                                        <button data-bs-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    </div>
    
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
              
            </div>
    
    <!--============Scroll 05 End==============-->   
	
	 	 
	 
	          
 
 
 




                    <!--=======================
                        elitesDesign_main_section start
                    ==========================--> 
        <section class="elitesDesign_main_section">

                <div class="row">
                    <div class="col-lg-9 col-md-9"><!-- col-9 start -->

                <!--=======================
                    About_section start
                ==========================-->
				 								
					
										
                        <div class="about_section">
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                   <h3 class="about-title">
                                    <i class="las la-address-card"></i> {{$setting->institute_history ??''}}                                    </h3>
													
				
                                    <div class="about_image">
                                        <img src="{{ asset($setting->institutehistoryimages ??'') }}" alt="">
                                    </div>
				

                                    <div class="about_content">
                                      <p>{{$setting->institute_info_short ??''}}.....</p>
  <a href="{{ URL::to('/institute') }}"> বিস্তারিত</a>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						   
						
												
						
                <!--=======================
                    About_section End
                ==========================-->

								
					
                <!--====================
                    speech section start
                ======================-->
                    <section class="speech-section">
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="speech-active owl-carousel">
                                    
									 @php
	                                 $seo=DB::table('seos')->first();
                                     @endphp						
									<div class="speech-wrpp">
                                        <h4 class="about-title">
                                            <i class="las la-address-book"></i>  {{ $seo->oddhakhorname ??''}}                                       </h4>
										                                        <div class="speech-image">
                                            <img src="{{ asset($setting->oddhakhorimg ??'') }}" alt="">
                                        </div>
										                                        
                                        <div class="speech-content">
                                         <p>{{ $seo->oddhakhorshortdetail ??''}}</p>
 <a href="{{ URL::to('/oddhakhor') }}"> বিস্তারিত</a>
                                        </div>
                                    </div>
									
									 									
									<div class="speech-wrpp">
                                        <h4 class="about-title">
                                            <i class="las la-address-book"></i>  {{ $seo->upodkahhoname ??''}}                                    </h4>
										                                        <div class="speech-image">
                                            <img src="{{ asset($setting->upodkahhoimg ??'') }}" alt="">
                                        </div>
										                                        
                                        <div class="speech-content">
                                         <div class="post_content">
<p>{{ $seo->upodkahhoshortdetails ??''}}</p>
 <a href="{{ URL::to('/upodkahho') }}"> বিস্তারিত</a>
                                        </div>
                                    </div>
									
									    


                               
                                </div>

                            </div>
                            
                           
                            
                        </div>
                    </section>

						
						     
                <!--====================
                    speech section End
                ======================-->

           

                    <div class="widget_area">			<div class="textwidget"><p><a href="index4df3.html?page_id=290" rel="noopener"><img decoding="async" class="aligncenter size-full wp-image-287" src="wp-content/uploads/2023/07/mujib_cornar.png" alt="" width="100%" height="auto" srcset="https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib_cornar.png 1000w, https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib_cornar-300x83.png 300w, https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib_cornar-768x212.png 768w, https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib_cornar-600x166.png 600w" sizes="(max-width: 1000px) 100vw, 1000px" /></a></p>
</div>
		</div>



                <!--=======================
                    Category_section Start
                ==========================-->
                        <section class="category_section">
                            
							
														<div class="row">
                                <div class="col-lg-6 col-md-6">
                                   <div class="category_item">
								                                          <h3 class="information-title1">
                                          <i class="las la-bars"></i> শিক্ষার্থী ও অভিভাবগদের কর্ণার                                       </h3>
								                                          <div class="cat_item_padding">
									                                               <div class="category_image">
                                                <img src="{{ asset('public/frontend/assets/images/menu01.png') }}" alt="">
                                            </div>
									                                               <div class="cat_menu">
                                                <div class="menu-student-information-container"><ul id="menu-student-information" class="menu"><li id="menu-item-185" class="menu-item menu-item-type-taxonomy menu-item-object-studentscat menu-item-185"><i class="las la-check"></i> <a href="{{$setting->studentlogin ??''}}">শিক্ষার্থী লগইন</a></li>
<li id="menu-item-186" class="menu-item menu-item-type-taxonomy menu-item-object-studentscat menu-item-186"><i class="las la-check"></i> <a href="{{ $seo->gurdinelogin ??''}}">অভিভাবগ লগইন</a></li>
<li id="menu-item-187" class="menu-item menu-item-type-taxonomy menu-item-object-studentscat menu-item-187"><i class="las la-check"></i> <a href="{{$setting->resultlink ??''}}">অনলাইন রেজাল্ট</a></li>
<li id="menu-item-188" class="menu-item menu-item-type-taxonomy menu-item-object-studentscat menu-item-188"><i class="las la-check"></i> <a href="{{$setting->onlineadmission ??''}}">অনলাইন এডমিশন</a></li>
<li id="menu-item-189" class="menu-item menu-item-type-taxonomy menu-item-object-studentscat menu-item-189"><i class="las la-check"></i> <a href="{{ $seo->admitcard ??''}}">এডমিট কার্ড</a></li>
</ul></div>                                            </div>
                                        </div>
                                    </div>
                                </div>
                                  
                                <div class="col-lg-6 col-md-6">
                                   <div class="category_item">
								                                           <h3 class="information-title2">
                                           <i class="las la-bars"></i> শিক্ষক ও স্টাফদের কর্ণার  
                                       </h3>
								                                          <div class="cat_item_padding">
                                                                                        <div class="category_image">
                                                <img src="{{ asset('public/frontend/assets/images/menu02.png') }}" alt="">
                                            </div>
									                                               <div class="cat_menu">
                                                <div class="menu-teacher-container"><ul id="menu-teacher" class="menu"><li id="menu-item-190" class="menu-item menu-item-type-taxonomy menu-item-object-teacherscat menu-item-190"><i class="las la-check"></i> <a href="{{$setting->teacherlogin ??''}}">শিক্ষক লগইন</a></li>
<li id="menu-item-191" class="{{$setting->teacherlogin ??''}}"><i class="las la-check"></i> <a href="{{$setting->teacherlogin ??''}}">স্টাফ লগইন</a></li>
<li id="menu-item-192" class="menu-item menu-item-type-taxonomy menu-item-object-teacherscat menu-item-192"><i class="las la-check"></i> <a href="{{ URL::to('/teacher') }}">শিক্ষক মণ্ডলীদের তালিকা</a></li>
<li id="menu-item-193" class="menu-item menu-item-type-taxonomy menu-item-object-teacherscat menu-item-193"><i class="las la-check"></i> <a href="{{ URL::to('/staff') }}">স্টাফদের তালিকা</a></li>
<li id="menu-item-194" class="menu-item menu-item-type-taxonomy menu-item-object-teacherscat menu-item-194"><i class="las la-check"></i> <a href="{{$setting->teacherlogin ??''}}">লাইব্রেরিয়ান লগইন</a></li>
</ul></div>                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                               							                               
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                   <div class="category_item">
								                                           <h3 class="information-title3">
                                            <i class="las la-bars"></i> সকল ডাউনলোড                                       </h3>
								                                          <div class="cat_item_padding">
                                                                                        <div class="category_image">
                                                <img src="{{ asset('public/frontend/assets/images/menu03.png') }}" alt="">
                                            </div>
									                                               <div class="cat_menu">
                                                <div class="menu-downlaod-container"><ul id="menu-downlaod" class="menu"><li id="menu-item-195" class="menu-item menu-item-type-taxonomy menu-item-object-informationcat menu-item-195"><i class="las la-check"></i> <a href="{{ $seo->admitcard ??''}}">এডমিট কার্ড ডাউনলোড</a></li>
<li id="menu-item-196" class="menu-item menu-item-type-taxonomy menu-item-object-informationcat menu-item-196"><i class="las la-check"></i> <a href="{{ $seo->marksheet ??''}}">মার্কশিট ডাউনলোড</a></li>
<li id="menu-item-197" class="menu-item menu-item-type-taxonomy menu-item-object-informationcat menu-item-197"><i class="las la-check"></i> <a href="{{ $seo->certificate ??''}}">সার্টিফিকেট ডাউনলোড</a></li>
<li id="menu-item-198" class="menu-item menu-item-type-taxonomy menu-item-object-informationcat menu-item-198"><i class="las la-check"></i> <a href="{{ $seo->examroutine ??''}}">পরীক্ষার রুটিন</a></li>
<li id="menu-item-199" class="menu-item menu-item-type-taxonomy menu-item-object-informationcat menu-item-199"><i class="las la-check"></i> <a href="{{ $seo->admissionform ??''}}">ভর্তি ফরম ডাউনলোড</a></li>
</ul></div>                                            </div>
                                        </div>
                                    </div>
                                </div>
                                  
                                <div class="col-lg-6 col-md-6">
                                   <div class="category_item">
								   										<h3 class="information-title4">
                                             <i class="las la-bars"></i> একাডেমিক তথ্য                                       </h3>
								   									   
                                       <div class="cat_item_padding">
                                                                                        <div class="category_image">
                                                <img src="{{ asset('public/frontend/assets/images/menu04.png') }}" alt="">
                                            </div>
									                                               <div class="cat_menu">
                                                <div class="menu-academic-information-container"><ul id="menu-academic-information" class="menu"><li id="menu-item-204" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-204"><i class="las la-check"></i> <a href="{{ URL::to('/institute') }}">প্রতিষ্ঠানের ইতিহাস</a></li>
<li id="menu-item-200" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-200"><i class="las la-check"></i> <a href="{{$setting->resultlink ??''}}">পরীক্ষার ফলাফল</a></li>
<li id="menu-item-201" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-201"><i class="las la-check"></i> <a href="{{ URL::to('/post/15/নোটিশ') }}">নোটিশ</a></li>
<li id="menu-item-202" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-202"><i class="las la-check"></i> <a href="{{ URL::to('/photo') }}">ফোটো গ্যালারী</a></li>
<li id="menu-item-203" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-203"><i class="las la-check"></i> <a href="{{ URL::to('/gallery') }}">ভিডিও গ্যালারী</a></li>
</ul></div>                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
							                        </section>




                <!--=======================
                    Category_section End
                ==========================-->


                    </div><!-- col-9 End -->




                    <!-- col-3 start -->
                    <div class="col-lg-3 col-md-3">
                        <!-- ========= academic_information start ========== -->
                         	<div class="academic_information">
                            <div class="menu-sidebar-one-container"><ul id="menu-sidebar-one" class="menu"><li id="menu-item-205" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-205"><a href="{{$setting->resultlink ??''}}"><i class="lar la-arrow-alt-circle-right"></i> পরীক্ষার ফলাফল</a></li>
<li id="menu-item-206" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-206"><a href="{{ URL::to('/post/15/নোটিশ') }}"><i class="lar la-arrow-alt-circle-right"></i> নোটিশ</a></li>
<li id="menu-item-207" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-207"><a href="{{ URL::to('/institute') }}"><i class="lar la-arrow-alt-circle-right"></i>প্রতিষ্ঠানের ইতিহাস</a></li>
<li id="menu-item-208" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-208"><a href="{{ URL::to('/photo') }}"><i class="lar la-arrow-alt-circle-right"></i>ফটো গ্যালারী</a></li>
<li id="menu-item-209" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-209"><a href="{{ URL::to('/gallery') }}"><i class="lar la-arrow-alt-circle-right"></i> ভিডিও গ্যালারী</a></li>
</ul></div>                        </div>
						                         <!-- ========= academic_information start ========== -->
                         
                               
                        <!-- ============notic board start==================== -->
                        
                        
                    <div class="widget_area">			<div class="textwidget"><p><a href="index4df3.html?page_id=290"><img decoding="async" class="aligncenter size-full wp-image-288" src="wp-content/uploads/2023/07/mujib100.png" alt="" width="100%" height="auto" srcset="https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib100.png 800w, https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib100-300x222.png 300w, https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib100-768x569.png 768w, https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib100-600x445.png 600w" sizes="(max-width: 800px) 100vw, 800px" /></a></p>
</div>
		</div>                        
                        
                        <div class="notic_board">
						
							
                            							<div class="notic_board_title">
                              <i class="las la-bars"></i> নোটিশ বোর্ড                            </div>
							                            
                            <div class="noitc_board_item">
                            <div class="noitc_board_item">
                           <marquee direction = "up" height="200" scrollamount="3px" onmouseover="this.stop()" onmouseout="this.start()">       
                                    
                                     <ul>
                    @php
					$firstcat=DB::table('categories')->first();
					$firstcatpostbig=DB::table('posts')->where('cat_id',$firstcat->id)->where('bigthumbnail',1)->orderBy('id','DESC')->first();
					$firstcatpostsmall=DB::table('posts')->where('cat_id',$firstcat->id)->where('categoryhomepage',1)->orderBy('id','DESC')->limit(10)->get();
					@endphp					
					
					
							
							             @foreach($firstcatpostsmall as $row) 
										 								@php
								$slug=preg_replace('/\s+/u', '-', trim($row->title_bn ??''));
							    @endphp
										 <li><i class="lar la-arrow-alt-circle-right"></i> 
										 <a href="{{ URL::to('view-post/'.$row->id.'/'.$slug ??'') }}"> {{ $row->title_bn ??'' }}</a></li>
 								
										 @endforeach	
										    
                                         
                                     </ul>
                                 
                                 </marquee>
                            </div>
                            
                        </div>
						
						                        
							
                           <!-- =========== notic board End ================= -->
                            							<div class="notic_board_title">
                              <i class="las la-bars"></i> ফেসবুকে আমরা                            </div>
							                            <div class="facebook-content">
                                                        <iframe
              src="https://www.facebook.com/plugins/page.php?href=https://www.facebook.com/{{$setting->facebookpage ??''}}&amp;tabs=time&amp;width=260&amp;height=150&amp;small_header=false&amp;adapt_container_width=true&amp;hide_cover=false&amp;show_facepile=true&amp;appId=334182264340964"
              width="260" height="150" style="border:none;overflow:hidden" scrolling="no" frameborder="0"
              allowfullscreen="true"
              allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
			  </div>
                            
                            
                        <!-- ======= Offical Link start ========== -->
                        
						                          
							
                           <!-- =========== notic board End ================= -->
                                                    <div class="official_link">
                            <div class="oLink_litle">
                                 <i class="las la-bars"></i> গুরুত্বপূর্ণ লিংক                            </div>
							                        
                           <div class="oLink_menu">
				 @php
				 	$website=DB::table('websites')->get();
				 @endphp
				 @foreach($website as $row)
                               <div class="menu-sidebar-two-container"><ul id="menu-sidebar-two" class="menu"><li id="menu-item-210" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-210"><a target="_blank" rel="noopener" href="{{ $row->website_link ??''}}"><i class="lar la-arrow-alt-circle-right"></i> {{ $row->website_name ??''}}</a></li>
                             
</ul></div> 
  @endforeach                          </div>
                             
                        </div>
						                        
                        
                        
                        
                        <!-- ======= Offical Link End ========== -->
                             
                             
                        <!-- ======= Offical Link start ========== -->
                        
                        <div class="official_link">
						                            <div class="oLink_litle">
                             <i class="las la-bars"></i> অফিসিয়াল লিংক                            </div>
						                        
                           <div class="oLink_menu">
                               <div class="menu-sidebar-three-container"><ul id="menu-sidebar-three" class="menu"><li id="menu-item-213" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-213"><a target="_blank" rel="noopener" href="http://www.educationboardresults.gov.bd/"><i class="lar la-arrow-alt-circle-right"></i> এডুকেশন ফলাফল</a></li>
<li id="menu-item-214" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-214"><a target="_blank" rel="noopener" href="http://www.banbe.gov.bd/"><i class="lar la-arrow-alt-circle-right"></i> বেনবেইজ</a></li>
</ul></div>                           </div>
                            
                        </div>
                        
                                                
                        
                        <!-- ======= Offical Link End ========== -->
                            
                        
                    </div>
                </div>
            </div>
        </section>  
                       
                       
                    <!--=======================
                        elitesDesign_main_section End
                    ==========================--> 
                    
                    
                                                               
     								
                    <!--=======================
                        Teacher_section Start
                    ==========================--> 
        <section class="teacher_section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
					                       <div class="teacher_title">
							Our Teacher                            <div class="icon_image">
                               <img src="{{ asset('public/frontend/assets/images/icon-image.png') }}" alt="">
                            </div>
                       </div>
					                       
                        <div class="teacher_list owl-carousel">
                
                            			@php
                                        $horizontal1=DB::table('ads')->where('type',1)->limit(10)->get();
                                        @endphp
								
			                         @foreach($horizontal1 as $row)  
								
							<div class="teacher_wrpp">
							                                <div class="teacher_image">
                                     <img src="{{ asset($row->ads ??'')}}" alt="">
                                </div>
								                                <div class="teacher_content">
                                    <h4 class="teacher_name">
										<a href="#"> {{ $row->link ??'' }} </a>	
                                    </h4>
									
									                                    <h6 class="teacher_deg">
                                       {{ $row->designation ??'' }}                          </h6>
										
                                </div>
                                
                                <div class="teacher-social">
                                                                            <a href="{{ $social->facebook ??''}}"><i class="lab la-facebook-f"></i></a>
																			                                        <a href="{{ $social->twitter ??''}}">
                                    <i class="lab la-twitter"></i></a>
																			                                        <a href="{{ $social->linkedin ??''}}">
										<i class="lab la-linkedin-in"></i></a>
		                                </div>
                                
                            </div>
							
										 @endforeach							
							
							
												                            
                                                    
                                                  
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
                                       
                    <!--=======================
                        Teacher_section End
                    ==========================--> 
					   
 
 
 								
                    <!--=========elitesDesign==============
                        Course section Start
                    =============elitesDesign=============-->    
        <section class="course-section">
            <div class="container">
						
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="sec-content">
                            <h1 class="sec-title">
                                Our Course                            </h1>
                            <div class="secIcon">
                                <img src="{{ asset('public/frontend/assets/images/heading-line.png') }}" alt="">
                            </div>
                        </div>
                    </div>
                </div><!--End row-->
			                <div class="row">
                    <div class="col-lg-12">
                        <div class="coures-active owl-carousel">
                            
													@php
			$secondcat=DB::table('categories')->skip(1)->first();
			$secondcatpostbig=DB::table('posts')->where('cat_id',$secondcat->id)->where('bigthumbnail',1)->orderBy('id','DESC')->first();
			$secondcatpostsmall=DB::table('posts')->where('cat_id',$secondcat->id)->where('categoryhomepage',1)->orderBy('id','DESC')->limit(3)->get();
			@endphp

			
							@foreach($secondcatpostsmall as $row)
							@php
							$slug=preg_replace('/\s+/u', '-', trim($secondcatpostbig->title_bn));
							@endphp
							<div class="course-wrpp">
							                                <figure class="course-image"><!--Image Crop: w:800px H:475px-->
                                    <img src="{{ asset($row->image ??'')}}" alt="">
                                </figure>
								                                <h4 class="course-title">
                                    <a href="{{ URL::to('view-post/'.$row->id.'/'.$slug ??'') }}">{{ $row->title_bn ??'' }} </a>	
                                </h4>
                                <div class="course-priceContent">
								                                    <div class="course-price">
                                        {{ $row->title_en ??'' }} taka                                    </div>
								
                                    									<div class="course-btn">
                                       <a href="{{ $row->tags_en ??'' }}"> Start Course </a>
                                    </div>
									                                </div><!--End Price-->
                            </div><!--End wrpp-->

                               @endforeach
									
									
							

					          

                        </div><!--End owl-carousel-->
                    </div><!--End col-12-->
                </div><!--Edn row-->
            </div><!--End container-->
        </section><!--End section-->
            
                
                <!--=========elitesDesign==============
                    Course section End
                =============elitesDesign=============-->    

               
                            <!--==========================
                              Video section Start
                            ===========================--> 
    <div class="video-seciton">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="video-section-wrpp">
                        <div class="video-seciton-title">
							 Video Gallery                        </div>

                        <div class="video-seciton-img">
                            <img src="wp-content/themes/ESchool/assets/images/icon-image.png" alt="">
                        </div>
                    </div>
                        
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="video-list owl-carousel">                        
                        
																													
				@php
				$videobig=DB::table('videos')->where('type',1)->orderBy('id','DESC')->first();
				$videosmall=DB::table('videos')->where('type',0)->orderBy('id','DESC')->limit(5)->get();
				$videosmall2=DB::table('videos')->where('type',1)->orderBy('id','DESC')->limit(8)->get();
				@endphp	
                         
                        @foreach($videosmall2 as $row)						 
						<div class="video-wrpp">
                            <div class="video-item">
                            <img src="https://img.youtube.com/vi/{{  $row->embed_code ??''}}/mqdefault.jpg" />
																								
                                <a href="https://www.youtube.com/watch?v={{  $row->embed_code ??''}}" class="video-icon popup "><i class="la la-play"></i></a>
                            </div>
                            <div class="video-title">
                                <a href="https://www.youtube.com/watch?v={{  $row->embed_code ??''}}" class="popup"> {{ $row->title ??''}} </a> 
                            </div>                             
                        </div>  

                         @endforeach

																		
									
						



														
                                           
                                          
         
                    </div>
                </div>
            </div>
        </div>
    </div>   
	                             <!--==========================
                                Video Section End
                            ===========================--> 
                                                                                         
                                  
                                      
                                      
                                     
 
 								

                    <!--=========elitesDesign==============
                        Blog section Start
                    =============elitesDesign=============-->    
        <section class="blog-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="sec-content">
                            <h1 class="sec-title">
                                Blog                            </h1>
                            <div class="secIcon">
                                <img src="{{ asset('public/frontend/assets/images/heading-line.png') }}" alt="">
                            </div>
                        </div>
                    </div>
                </div><!--End row-->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="blog-active owl-carousel">
                            
								         @php
			$thirdcat=DB::table('categories')->skip(2)->first();
			$thirdcatpostbig=DB::table('posts')->where('cat_id',$thirdcat->id)->where('bigthumbnail',1)->orderBy('id','DESC')->first();
			$thirdcatpostsmall=DB::table('posts')->where('cat_id',$thirdcat->id)->where('categoryhomepage',1)->orderBy('id','DESC')->limit(3)->get();
			@endphp
														
											
																
							@foreach($thirdcatpostsmall as $row)	
						    @php
						    $slug=preg_replace('/\s+/u', '-', trim($row->title_bn ??''));
							@endphp	
							<div class="blog-wrpp">
							    <figure class="blog-image">
                                    <img class="lazyload" src="{{ asset($row->image ??'')}}" data-src="{{ asset($row->image ??'')}}">	
                                </figure>
							    
                                <div class="blog-item">
                                       
                                    <h1 class="blog-title">
                                        <a href="{{ URL::to('view-post/'.$row->id.'/'.$slug ??'') }}">{{ $row->title_bn ??'' }} </a>
                                    </h1>
    
                                    <div class="blog-btn">
                                        <a href="{{ URL::to('view-post/'.$row->id.'/'.$slug ??'') }}"> <i class="las la-angle-right"></i> বিস্তারিত </a>
                                    </div>
                                </div>
                            </div><!--End wrpp-->
                            
                            	@endforeach								
							
							
                            
                                                        
                    

                        </div><!--End owl-carousel-->
                    </div><!--End col-12-->
                </div><!--Edn row-->
            </div><!--End container-->
        </section><!--End section-->
            
            
                <!--=========elitesDesign==============
                    Blog section End
                =============elitesDesign=============-->    

 
				@endsection