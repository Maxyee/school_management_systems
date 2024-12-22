 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">একাডেমিক প্রসপেক্টাস :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$paper->prospectus!!}</p>
        </div>


</div>

 @endsection
