 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">আমাদের ছাত্র-ছাত্রী :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$student->our_student!!}</p>
        </div>


</div>

 @endsection
