 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<hr id="print_div_hr" />
<div style="text-align: center;">
<img style="border-style:solid; border-width:0px; height:220px; margin-left:40px; margin-right:40px; width:200px" src="{{ asset('upload/principalimage') }}/{{ $principal->image }}" alt="{{ $principal->name }}" width="200">
<h4 style="font-weight:bold">{{ $principal->name }}</h4>
<h5 style="font-weight:bold">{{ $principal->designation }}</h5>
<h5 style="font-weight:bold">{{ $principal->school_name }}</h5>
</div>
<br>
<div style="text-align: justify;">
<p>{!! $principal->details !!}</p>
</div>
 

</div>


 @endsection
