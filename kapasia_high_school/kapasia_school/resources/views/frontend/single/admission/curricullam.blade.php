 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">বর্তমান শিক্ষা ব্যবস্থা :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$admission->curricullam!!}</p>
        </div>


</div>

 @endsection
