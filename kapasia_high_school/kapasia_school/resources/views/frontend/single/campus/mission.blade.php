 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">প্রতিষ্ঠানের লক্ষ্য ও উদ্দেশ্য :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$campus->mv!!}</p>
        </div>


</div>

 @endsection
