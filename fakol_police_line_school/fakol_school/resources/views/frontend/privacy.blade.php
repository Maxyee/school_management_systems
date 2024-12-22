@extends('layouts.front')
@section('meta')
  <title>  প্রাইভেসি অ্যান্ড পলিসি   </title>
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
							Create Page-css start
                    =================================-->        
        <div class="create-page">
            <div class="container">
                <div class="col-lg-12 col-md-12">
                   <div class="page-title">
                       প্রাইভেসি অ্যান্ড পলিসি                <div class="icon-image">
                           <img src="{{ asset('public/frontend/assets/images/icon-image.png') }}" alt="">
                       </div> 
                    </div>
                    
                     
                    <div class="page-content">		
                        <p>{!! $setting->privacy ??'' !!}</p>
                    </div>
                    
                </div>
            </div>
            
        </div>
        
					<!--================================
							Create-Page-End
                    =================================-->



@endsection