 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">গ্রন্থাগার :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$resource->library!!}</p>
        </div>


</div>

 @endsection
