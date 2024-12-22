 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">শিক্ষার্থীদের সাফল্যের গল্প :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$student->student_success!!}</p>
        </div>


</div>

 @endsection
