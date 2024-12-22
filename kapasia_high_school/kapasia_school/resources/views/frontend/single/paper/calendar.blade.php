 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">শিক্ষা বর্ষপঞ্জি :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$paper->calendar!!}</p>
        </div>


</div>

 @endsection
