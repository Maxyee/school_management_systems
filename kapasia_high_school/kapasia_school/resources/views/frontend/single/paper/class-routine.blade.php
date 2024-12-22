 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">ক্লাস রুটিন :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$paper->class_routine!!}</p>
        </div>


</div>

 @endsection
