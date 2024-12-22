 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">ভর্তি পরীক্ষা :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$admission->admission_exam!!}</p>
        </div>


</div>

 @endsection
