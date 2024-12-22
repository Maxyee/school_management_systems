 @extends('frontend.layouts.index')

 @section('content')
@include('frontend.layouts.notice')

<div class="row">
   {{--  <div id="box-1" class="six columns service-box box" style="height: auto;">
        <h4>স্বাধীনতার সুবর্ণজয়ন্তী</h4>
        <img src="{{ asset('frontend') }}/assets/images/icon/shuborno.png" width="100" height="">      
        <ul class="caption fade-caption" style="margin:0">
            <li><a href="/site/page/4a730099-0fcf-49ba-bb81-083f9919fd63/আদেশ--নোটিশ" title="আদেশ/ নোটিশ">আদেশ/ নোটিশ</a></li>
            <li><a href="" title="কার্যক্রম">কার্যক্রম</a></li>
            <li><a href="https://youtu.be/_j5Q6HIIwlA" title="ভিডিও">ইভেন্ট</a></li>
            <li><a href="/site/page/72f38217-505e-4533-aad9-7d993902db51/ছবি-গ্যালারি" title="ছবি গ্যালারি">ছবি গ্যালারি</a></li>
            <li><a href="https://youtu.be/_j5Q6HIIwlA" title="ভিডিও">ভিডিও</a></li>
            
            
        </ul>
    </div>

    <div id="box-1" class="six columns service-box box" style="height: auto;">
        <h4>তথ্য অধিকার</h4>
        <img src="{{ asset('frontend') }}/assets/images/icon/info.png" alt="তথ্য অধিকার" width="110" height="">        
        <ul class="caption fade-caption" style="margin:0">
            <li><a href="http://dshe.portal.gov.bd/site/page/21365154-0eda-4277-be90-34998bd4f9c7" title="তথ্য প্রদানকারী কর্মকর্তাবৃন্দ">তথ্য প্রদানকারী কর্মকর্তাবৃন্দ</a></li>
            <li><a href="http://dshe.portal.gov.bd/site/page/b68fc292-322f-4e81-aee0-f8ff77a30666" title="আবেদন ও আপিল ফরম">আবেদন ও আপিল ফরম</a></li>
            <li><a href="http://dshe.portal.gov.bd/site/page/4e299f61-f97c-4a50-bcf7-8813be3a13bf" title="আইন ও বিধি">আইন ও বিধি</a></li>
            <li><a href="/site/view/annual_reports/বার্ষিক-প্রতিবেদন" title="বার্ষিক প্রতিবেদন">বার্ষিক প্রতিবেদন</a></li>
            
        </ul>
    </div> --}}

</div>
 <div class="row">

		<div id="box-1" class="six columns service-box box" style="height: auto;">
		<h4>ক্যাম্পাস</h4>
		<img src="{{ asset('frontend') }}/assets/images/icon/campus.png" alt="" width="100" height=""/>
		<ul class="caption fade-caption" style="margin:0">
         <li><a href="{{ route('about') }}">আমাদের সম্পর্কে</a></li>
        <li><a href="{{ route('history') }}">ইতিহাস</a></li>
        <li><a href="{{ route('mission') }}">লক্ষ্য ও উদ্দেশ্য</a></li>
        <li><a href="{{ route('structure') }}">প্রাতিষ্ঠানিক কাঠামো </a></li>
        <li><a href="{{ route('infrastructure') }}">প্রাতিষ্ঠানিক অবকাঠামো</a></li>
        <li><a href="{{ route('purification') }}">শুদ্ধাচার সংক্রান্ত তথ্য</a></li>
                    
		</ul>
	</div>
			<div id="box-2" class="six columns service-box box" style="height: auto;">
		<h4>ভর্তি</h4>
		<img src="{{ asset('frontend') }}/assets/images/icon/admission512x512.png" alt="" width="100" height=""/>
		<ul class="caption fade-caption" style="margin:0">
            <li><a href="{{ route('admission.system') }}">কিভাবে আবেদন করতে হবে?</a></li>
            <li><a href="{{ route('admission.exam') }}">ভর্তি পরীক্ষা</a></li>
            <li><a href="{{ route('admission.rules') }}">ভর্তি নীতি</a></li>
            <li><a href="{{ route('registration') }}">রেজিস্ট্রেশন সিস্টেম</a></li>
            <li><a href="{{ route('curricullam') }}">বর্তমান শিক্ষা ব্যবস্থা</a></li>
            <li><a href="{{ route('semister') }}">সেমিস্টার পরিকল্পনা</a></li>
</ul>
	</div>
		</div>

			<div class="row">
		<div id="box-3" class="six columns service-box box" style="height: auto;">
		<h4>একাডেমিক</h4>
		<img src="{{ asset('frontend') }}/assets/images/icon/scholarship.png" alt="" width="100" height=""/>
		<ul class="caption fade-caption" style="margin:0">
        <li><a href="{{ route('founder') }}">প্রতিষ্ঠাতা</a></li>
        <li><a href="{{ route('principal') }}">অধ্যক্ষ</a></li>
        <li><a href="{{ route('vice-principal') }}">উপাধ্যক্ষ</a></li>
        <li><a href="{{ route('teacher') }}">শিক্ষক</a></li>
        <li><a href="{{ route('office') }}">অফিস</a></li>
         <li><a href="{{ route('stuff') }}"> কর্মচারী</a></li>
		</ul>
	</div>
			<div id="box-4" class="six columns service-box box" style="height: auto;">
		<h4>একাডেমিক পেপার</h4>
		<img src="{{ asset('frontend') }}/assets/images/icon/academic_paper.png" alt="" width="100" height=""/>
		<ul class="caption fade-caption" style="margin:0">
            
    <li><a href="{{ route('class-routine') }}">শ্রেণীসূচি</a></li>
    <li><a href="{{ route('online-class-routine') }}">অনলাইন শ্রেণীসূচি</a></li>
    <li><a href="{{ route('class-routine') }}">পরীক্ষার সময়সূচি</a></li>
    <li><a href="{{ route('academic-syllabus') }}">একাডেমিক সিলেবাস</a></li>
    <li><a href="{{ route('calendar') }}">শিক্ষা বর্ষপঞ্জি</a></li>
    <li><a href="{{ route('prospectus') }}">একাডেমিক প্রসপেক্টাস</a></li>
</ul>
	</div>
		</div>
			<div class="row">
		<div id="box-5" class="six columns service-box box" style="height: 100%;">
		<h4>শিক্ষার্থী</h4>
		<img src="{{ asset('frontend') }}/assets/images/icon/Examination_ex.png" alt="" width="100" height=""/>
		<ul class="caption fade-caption" style="margin:0">
         <li><a href="{{ route('tution') }}">শিক্ষার্থীদের বেতন</a></li>
        <li><a href="{{ route('uniform') }}">শিক্ষার্থীদের ইউনিফর্ম</a></li>
        <li><a href="{{ route('exam-manage') }}">পরীক্ষার ব্যবস্থা</a></li>
        <li><a href="{{ route('student-rules') }}">নিয়ম এবং প্রবিধান</a></li>
        <li><a href="{{ route('our-student') }}">আমাদের ছাত্র-ছাত্রী</a></li>
        <li><a href="{{ route('student-success') }}">শিক্ষার্থীদের সাফল্যের গল্প</a></li>
   </ul>
	</div>


			<div id="box-6" class="six columns service-box box" style="height: 100%;"   >
		<h4>ফলাফল</h4>
		<img src="{{ asset('frontend') }}/assets/images/icon/GPA-512.png" alt="" width="100" height=""/>
		<ul class="caption fade-caption" style="margin:0">
        <li><a href="{{ route('result.notice') }}">একাডেমিক পরীক্ষার ফলাফল</a></li>
                <li><a target="_blank" href="https://eboardresults.com/v2/home">বোর্ড পরীক্ষার ফলাফল</a></li>
                <li><a href="{{ route('student-rules') }}"></a></li>
        <li><a href="{{ route('our-student') }}"></a></li>
        <li><a href="{{ route('student-success') }}"></a></li>
        <li><a href="{{ route('student-success') }}"></a></li>
	</ul>
	</div>
		</div>


    <div class="row">
        <div id="box-7" class="six columns service-box box" style="height: auto;">
            <h4>নোটিশ</h4>
            <img src="{{ asset('frontend') }}/assets/images/icon/notice%26download.png" alt="" width="100" height=""/>
            
            <ul class="caption fade-caption" style="margin:0">
                <li><a href="{{ route('admission.notice') }}">ভর্তি নোটিশ</a></li>
                <li><a href="{{ route('exam.notice') }}">পরীক্ষার নোটিশ</a></li>
                <li><a href="{{ route('result.notice') }}">ফলাফলের নোটিশ</a></li>
                <li><a href="{{ route('event.notice') }}">ইভেন্টস নোটিশ</a></li>
                <li><a href="{{ route('admin.notice') }}">প্রশাসন নোটিশ</a></li>
                <li><a href="{{ route('national.notice') }}">জাতীয় কর্মসূচী</a></li>

                
            </ul>
        </div>

        <div id="box-8" class="six columns service-box box" style="height: auto;">
            <h4>কোর্সসমূহ</h4>
            <img src="{{ asset('frontend') }}/assets/images/icon/course-list.png" alt="" width="100" height=""/>
            <ul class="caption fade-caption" style="margin:0">
            <li><a href="{{ route('kg') }}">কিন্ডার গার্টেন</a></li>
            <li><a href="{{ route('primary') }}">প্রাথমিক</a></li>
            <li><a href="{{ route('high') }}">৬ষ্ঠ - দশম</a></li>
            <li><a href="{{ route('hsc') }}">একাদশ-দ্বাদশ</a></li>
            <li><a href="{{ route('degree') }}">ডিগ্রী</a></li>
            <li><a href="{{ route('honours') }}">অনার্স</a></li>
            </ul>
        </div>
    </div>

     <div class="row">
        <div id="box-7" class="six columns service-box box" style="height: auto;">
            <h4>বৃত্তি ও উপবৃত্তি</h4>
            <img src="{{ asset('frontend') }}/assets/images/icon/notice%26download.png" alt="" width="100" height=""/>
            
            <ul class="caption fade-caption" style="margin:0">
             <li><a href="{{ route('schollar.notice') }}">বৃত্তি সংক্রান্ত নোটিশ</a></li>
            <li><a href="{{ route('stipend.notice') }}">উপবৃত্তি সংক্রান্ত নোটিশ</a></li>
            

                
            </ul>
        </div>

        <div id="box-8" class="six columns service-box box" style="height: auto;">
            <h4>যোগাযোগ</h4>
            <img src="{{ asset('frontend') }}/assets/images/icon/course-list.png" alt="" width="100" height=""/>
            <ul class="caption fade-caption" style="margin:0">
            <li><a  href="{{ route('contact.view') }}">প্রতিষ্ঠানের ঠিকানা</a></li>
            <li><a target="_blank" href="{{$setting->facebook}}">ফেজবুক পেইজ</a></li>
            <li><a target="_blank" href="{{$setting->youtube}}">ইউটিউব চ্যানেল</a></li>
            
            </ul>
        </div>
    </div>

    <div class="row">
<div id="box-7" class="six columns service-box box" style="height: auto;">
<h4>রিসোর্স</h4>
<img src="{{ asset('frontend') }}/assets/images/icon/resources-.png" alt="" width="100" height=""/>
<ul class="caption fade-caption" style="margin:0">
            <li><a href="{{ route('class-content') }}">ডিজিটাল ক্লাস কনটেন্ট</a></li>
             <li><a href="{{ route('library') }}">গ্রন্থাগার</a></li>
            <li><a href="{{ route('labrotory') }}">গবেষণাগার</a></li>
            <li><a href="{{ route('sports-yard') }}">খেলার মাঠ</a></li>
            <li><a href="{{ route('co-education') }}">সহ-পাঠক্রম সংক্রান্ত কার্যক্রম</a></li>
</ul>
</div>
    <div id="box-8" class="six columns service-box box" style="height: auto;">
<h4>গ্যালারী</h4>
<img src="{{ asset('frontend') }}/assets/images/icon/gallery-44-267592.png" alt="" width="100" height=""/>
<ul class="caption fade-caption" style="margin:0">
<li><a href="{{ route('photo.gallery') }}">ফটো গ্যালারী</a></li>
<li><a href="{{ route('video.gallery') }}">ভিডিও গ্যালারী</a></li>
</ul>
    </div>
</div>




    @include('frontend.layouts.gallery')

 @endsection