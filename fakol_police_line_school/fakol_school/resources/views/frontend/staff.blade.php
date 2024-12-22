@extends('layouts.front')
@section('meta')
  <title>স্টাফ</title>
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
                <div class="container">
				
				 <div class="row">              
                    <div class="col-lg-12 col-md-12">
                        <div class="video-p-title">
                             স্টাফ 
                            <div class="icon-class">
                                <img src="wp-content/themes/ESchool/assets/images/icon-image.png" alt="">
                            </div>
                        
                        </div>
                    </div>
                </div>
				
				
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                   <th scope="col">Staff Name</th>
								   <th scope="col">Mobile Number</th>
                                  <th scope="col">Designation </th>
                                   <th scope="col">Image</th>
                                 </tr>
                                </thead>
                                <tbody>
                                    
																
		    @php
            $horizontal1=DB::table('ads')->where('type',2)->limit(1000)->get();
            @endphp
								
			                         @foreach($horizontal1 as $row)  
								 <tr>
								
								 
                                   <td  class="wrpper" scope="row" width="25%">{{ $row->link ??'' }}</td>
								   <td  class="wrpper" scope="row" width="25%">{{ $row->mobile ??'' }}</td>
         
                                     <td class="wrpper" width="10%"> {{ $row->designation ??'' }} </td>
                                     <td class="wrpper" width="15%">
									                                          <div class="image">
                                            <img src="{{ asset($row->ads ??'')}}">
                                         </div>
									                                     </td>
                                 </tr>
		                       @endforeach	




                                </tbody>
                            </table>
                    </div>

                    
      


                </div>
            </div>



@endsection