@extends('layouts.front')
@section('meta')
  <title>ফটো গ্যালারী</title>
@endsection
@section('content')

@php
     $firstsectionbig=DB::table('posts')->where('first_section_thumbnail',1)->orderBy('id','DESC')->first();
	 $firstsectionsmall=DB::table('posts')->where('first_section',1)->orderBy('id','DESC')->limit(5)->get();
	 $firstsectionheding=DB::table('posts')->where('headline',1)->orderBy('id','DESC')->limit(5)->get();
	 $user=DB::table('users')->first();
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
                        Archive-Page-Start
                ===============================-->

            <div class="archive-page">
			
				<div class="row">              
                        <div class="col-lg-12 col-md-12">
                            <div class="video-p-title">
                              ফটো গ্যালারী
                                <div class="icon-class">
                                    <img src="{{ asset('public/frontend/assets/images/icon-image.png') }}" alt="">
                                </div>
                            
                            </div>
                        </div>
                    </div>
                    

                    
					
                <div class="container">
            <div class="row">
                @php
				$photobig=DB::table('photos')->where('type',1)->orderBy('id','DESC')->limit(8)->get();
				$photosmall=DB::table('photos')->where('type',1)->orderBy('id','DESC')->limit(100000)->get();
				@endphp
				 	

					@foreach($photosmall as $row)
				<div class="elitesDesign-3 elitesDesign-m2">
                    <div class="photo-gallery-wrpp">
                        <div class="photo-image">
                                                        
                            <a href="{{ asset($row->photo ??'')}}">
                            <img class="lazyload" src="{{ asset($row->photo ??'')}}" data-src="{{ asset($row->photo ??'')}}">	
                            </a> 
                            	                        </div>
                        <div class="photo-title">
                            <a href="{{ asset($row->photo ??'')}}" style="color:white">{{ $row->title ??''}}</a>
                        </div>
                    </div>
                </div>                             
                @endforeach
								
				    
                
				  
  
                
            </div>
			
       </div>
						
					
                    



                </div>
      
                <!--================================
                        Archive-Page-End
                ===============================-->



@endsection