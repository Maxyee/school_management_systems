 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">শুদ্ধাচার সংক্রান্ত তথ্য :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$campus->purification!!}</p>
        </div>


</div>

 @endsection
