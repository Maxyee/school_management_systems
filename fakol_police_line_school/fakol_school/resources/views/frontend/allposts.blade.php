@extends('layouts.front')
@section('content')
@php
     $firstsectionbig=DB::table('posts')->where('first_section_thumbnail',1)->orderBy('id','DESC')->first();
	 $firstsectionsmall=DB::table('posts')->where('first_section',1)->orderBy('id','DESC')->limit(20)->get();
	 $firstsectionheding=DB::table('posts')->where('headline',1)->orderBy('id','DESC')->limit(12)->get();
	 $post=DB::table('posts')->first();
	 $setting=DB::table('settings')->first();
	 
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



 <!--================================
							Blog-Page-start
                      ===============================-->        
        <div class="blog-page">
                <div class="container">
                    <div class="row">              
                        <div class="col-lg-12 col-md-12">
                            <div class="video-p-title">
                               সকল পোস্ট
                                <div class="icon-class">
                                    <img src="{{ asset('public/frontend/assets/images/icon-image.png') }}" alt="">
                                </div>
                            
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    
					 	@foreach($posts as $row)
					    @php
						$slug=preg_replace('/\s+/u', '-', trim($row->title_bn ??''));
					    @endphp
						
						<div class="elitesDesign-3 elitesDesign-m2">
                        <div class="blog-wrpp">
						                            <figure class="blog-image">
                                <img class="lazyload" src="{{ asset($row->image ??'') }}" data-src="{{ asset($row->image ??'') }}">	
                            </figure>
							
                            <div class="blog-item">
                                <div class="blog-date">
                                    <ul>
                                       <li> <i class="las la-calendar"></i> {{$post->post_date ??''}} </li>
                                    </ul>
                                </div>

                                <h1 class="blog-title">
                                    <a href="{{ URL::to('view-post/'.$row->id.'/'.$slug ??'') }}">{{ $row->title_bn ??'' }} </a>
                                </h1>

                                <div class="blog-details">
                                   Lorem Ipsum is simply dummy text of the printing                                </div>

                                <div class="blog-btn">
                                     <a href="{{ URL::to('view-post/'.$row->id.'/'.$slug ??'') }}"> <i class="las la-angle-right"></i> বিস্তারিত </a>
                                </div>
                            </div>
                        </div>
                    </div>
                   @endforeach

                    
                    

                    
                   

                    

                    </div>
                           
                    
                    <div class="row">
						 <div class="col-lg-12 col-md-12"></div>
						</div>
                            
                    
                    
            </div>
        </div>
					<!--================================
							Archive-Page-End
                      ===============================-->

@endsection