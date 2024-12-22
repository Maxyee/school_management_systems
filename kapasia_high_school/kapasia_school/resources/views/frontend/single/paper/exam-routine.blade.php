 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">পরীক্ষার সময়সূচি :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$paper->exam_routine!!}</p>
        </div>


</div>

 @endsection
