 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">
<style>
    nav svg{
      height: 20px;

    }
    nav .hidden{
      display: block !important ;
    }
  </style>
	<div class="twelve columns" id="left-content">
	<br>
	
	<h2 style="font-weight: bold;font-size:25px"> ভিডিও গ্যালারী </h2>
	
	<hr>

         <div class="row">
                   
        @foreach($videos as $video)
         <div class="four columns columns" style="text-align: center;">
            <div class="row">
        <div style="padding: 5px;" class="col-md-4">
            <iframe frameborder="0"  width="100%"  src="{{ $video->link }}"></iframe>
        </div>
        </div>
        </div>
        @endforeach

         {{ $videos->links() }}
      </div>
	
</div>


 @endsection
