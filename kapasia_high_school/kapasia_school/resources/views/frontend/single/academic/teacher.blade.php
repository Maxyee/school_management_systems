 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h4 style="font-weight: bold;">শিক্ষকগণ :</h4>
	<hr>
  <div style="text-align: justify;">
            <p>{!!$academic->teacher!!}</p>
        </div>


</div>

 @endsection
