 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">সহ-পাঠক্রম সংক্রান্ত কার্যক্রম :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$resource->co_education!!}</p>
        </div>


</div>

 @endsection
