@extends('layouts.front')
@section('meta')
  <title>ভিডিও টিউটোরিয়াল</title>
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
							Video-Page-start
                    =================================-->        
        <div class="video-page">
            <div class="container">
                <div class="row">              
                    <div class="col-lg-12 col-md-12">
                        <div class="video-p-title">
                            ভিডিও টিউটোরিয়াল
                            <div class="icon-class">
                                <img src="{{ asset('public/frontend/assets/images/icon-image.png') }}" alt="">
                            </div>
                        
                        </div>
                    </div>
                </div>

                <div class="row">
                    
			    @php
				$videobig=DB::table('videos')->where('type',1)->orderBy('id','DESC')->first();
				$videosmall=DB::table('videos')->where('type',0)->orderBy('id','DESC')->limit(5)->get();
				$videosmall2=DB::table('videos')->where('type',0)->orderBy('id','DESC')->limit(100000)->get();
				@endphp	


				@foreach($videosmall2 as $row)
					<div class="elitesDesign-3 elitesDesign-m2">
                         <div class="video-page-wrpp">
                             <figure class="video-page-thumbnails">
                                                                     <img src="https://img.youtube.com/vi/{{  $row->embed_code ??''}}/mqdefault.jpg" />
												                                 <a class="video-page-icon popup" href="https://www.youtube.com/watch?v={{  $row->embed_code ??''}}"> <i class="las la-play"></i> </a>
                                 <h5 class="video-caption">
                                     <a href="https://www.youtube.com/watch?v={{  $row->embed_code ??''}}">{{ $row->title ??''}}</a>
                                 </h5>
                             </figure>
                         </div>
                     </div>
					 @endforeach
					  
                     
				
 
                  
                    </div>

                   <div class="col-lg-12 col-md-12"></div>
						</div>
              
            </div>



@endsection