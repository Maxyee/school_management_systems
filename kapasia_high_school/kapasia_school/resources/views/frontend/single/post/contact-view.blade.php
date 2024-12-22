 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h2 style="font-weight: bold;font-size:25px"> প্রতিষ্ঠানের ঠিকানা </h2>
	
	<hr>
	
    <div style="padding:10px;font-size:20px;font-weight:bold"> ঠিকানা :  {{ $contact->address }}</div>

    <div style="padding:10px;font-size:20px;font-weight:bold"> ইমেইল :  {{ $contact->email }}</div>

    <div style="padding:10px;font-size:20px;font-weight:bold"> মোবাইল :  {{ $contact->mobile }}</div>

    <div style="padding:10px;font-size:20px;font-weight:bold"> টেলিফোন :  {{ $contact->phone }}</div>

    <div style="padding:10px;font-size:20px;font-weight:bold"> ওয়েবসাইট :  <a href="http://www.tcplmc.com">www.tcplmc.com</a></div>


    <div style="padding-top: 50px"><iframe src="{{ $contact->map }}" width="700" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe></div> 


   </div>




 @endsection
