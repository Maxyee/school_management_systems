 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">প্রতিষ্ঠাতা মহেোদয়:</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$academic->founder!!}</p>
        </div>


</div>

 @endsection
