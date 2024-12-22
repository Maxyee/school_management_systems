@extends('layouts.front')
@section('meta')
  <title>{{ $post->title_bn ??''}}</title>
  <meta property="og:url" content="{{Request::fullUrl()}}" />
  <meta property="og:type" content="website" />
  <meta property="og:title" content="{{ $post->title_bn ??''}}" />
  <meta property="og:image" content="{{URL::to($post->image ??'')}}" />
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

 <!--===================== Single page start ======================= -->
            
    <section class="single-page">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                   
				   				   
                        <div class="single-pageImage">
                            <img src="{{ asset($post->image ??'') }}" alt="">
                        </div>
				                            <div class="single-page-content">
                        <div class="single-page-date">
                            <ul>
                               	<li><a href="#"> <i class="fas fa-calendar-alt"></i> {{ $post->post_date  ??''}} </a></li>
																<li><a href="#"> <i class="fas fa-user"></i>  {{ $post->name  ??''}} </a></li>
								                                
                            </ul>
                        </div>
                        
                        <div class="single-page-title">
                           {{ $post->title_bn ??''}}   </div>
                        
                        
                        <div class="singel-details">
                             <p> {!! $post->details_bn ??'' !!}</p>
</div>
                        
                        
                    </div>
                    
                </div>

                    
                   
                    
                    
                </div>
                
                
            </div>
        </div>
    </section>


@endsection