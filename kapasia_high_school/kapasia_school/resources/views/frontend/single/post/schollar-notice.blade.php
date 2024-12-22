 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h2 style="font-weight: bold;font-size:25px"> বৃত্তি সংক্রান্ত </h2>
	
	<hr>
	
  <div >
  	<style>
		nav svg{
			height: 20px;

		}
		nav .hidden{
			display: block !important ;
		}
	</style>

    @if($schollars->isEmpty())
     <h4 style="color:red">Data Not Found!!!</h4>
      @else

  	 <table class="table table-bordered table-hover" id="example" width="100%">
                <thead>
                <tr style="background-color: #001f3f;color: white;font-weight:bold;">
                    <td width="5%">Sl</td>
                    <td width="15%">Notice Date</td>
                    <td width="65%">Title</td>
                    <td width="15%">Notice Files</td>
                </tr>
                </thead>
                <tbody>
                	@foreach($schollars as $key=> $post)
                   <tr>
                   <td>{{ $key+1 }}</td>
                   <td style="font-weight: bold;">{{ date('d-M-Y',strtotime($post->post_date)) }}</td>
                   <td>
                      <h5 style="font-weight: bold;"><a href="{{ route('post.details',$post->id) }}">{!! Str::words($post->title, 20) !!}</a></h5>
                      {{-- <p>{{ date('d-M-Y',strtotime($post->post_date)) }}</p> --}}
                   </td>
                      <td><a style="color:blue" href="{{ asset('upload/postfile/'.$post->post_file) }}"><i  class="fa fa-file-pdf" style="color:red;font-size:20px;margin-right: 5px;"></i>ডাউনলোড</a>

                    </td>
                  </tr>
                      @endforeach      
                 </tbody>
            </table>

            {{ $schollars->links() }}
    @endif
   </div>


</div>

 @endsection
