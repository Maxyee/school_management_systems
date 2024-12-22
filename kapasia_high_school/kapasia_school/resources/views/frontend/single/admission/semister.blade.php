 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">সেমিস্টার পরিকল্পনা :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$admission->semister!!}</p>
        </div>


</div>

 @endsection
