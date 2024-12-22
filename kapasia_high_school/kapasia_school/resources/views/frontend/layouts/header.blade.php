<div class="container">
<div class="sixteen columns" style="background-color: #393232; box-shadow: 0 1px 5px #999999;height:40px;">
<div style="display: inline-block;float: left;width: 960px;border-bottom: 4px solid #e48257;">
<div class="col" id="div-lang" style="height: 25px;">
<div id="newNavigation"></div>
<div id="div-lang-sel" style="float: left;">
<div style="float: left;margin-left: 5px; font-size: 14px;text-align:center">
                            <a href="{{ route('public') }}">{{$setting->college_name}} </a>
                    </div>
</div>
</div>
</div>
</div>

<div class="sixteen columns">
<div class="callbacks_container" style="box-shadow: 0 1px 5px #999999;">
<ul class="rslides" id="front-image-slider">

 <li>
    @foreach($sliders as $slider)
<img src="{{ asset('upload/sliderimage') }}/{{ $slider->image }}" alt="Hi Tech Polytechnic Institute - Slide" width="960" height="220"/>
</li>
@endforeach
    </ul>
<style>.rslides img{height:220px}</style>
</div>

<div class="header-site-info" id="header-site-info">
<div>
<div id="logo">
<a title="Home" href="{{ route('public') }}"><img alt="Home" src="{{ asset('upload/settingimage') }}/{{ $setting->logo }}"></a>
</div>
<div class="clearfix" id="site-name-wrapper">
<span id="site-name">
<a title="Home" href="{{ route('public') }}">{{$setting->college_name}} </a>
</span>
</div>
<!-- /site-name-wrapper -->

</div>
<!-- /header-site-info-inner -->

</div>

</div>
﻿


<div class="sixteen columns" id="jmenu">
<div class="sixteen columns">
<a href="javascript:;" class="show-menu menu-head"> মেনু নির্বাচন করুন</a>
<div role="navigation" id="dawgdrops">
<ul class="meganizr mzr-slide mzr-responsive" >
<!-- Build The Menu -->
<li class="col0 "><a title="Home" href="{{ route('public') }}" style="background-image: url({{ asset('frontend') }}/assets/images/icon/home_dark.png);margin-top:5px;"></a></li>
<li class="col1 mzr-drop"><a href="#" class="submenu">ক্যাম্পাস</a>
<div class="mzr-content drop-one-columns">
    <div class="one-col">
        <ul class="mzr-links">
        <li><a href="{{ route('about') }}">আমাদের সম্পর্কে</a></li>
        <li><a href="{{ route('history') }}">ইতিহাস</a></li>
        <li><a href="{{ route('mission') }}">লক্ষ্য ও উদ্দেশ্য</a></li>
        <li><a href="{{ route('structure') }}">প্রাতিষ্ঠানিক কাঠামো </a></li>
        <li><a href="{{ route('infrastructure') }}">প্রাতিষ্ঠানিক অবকাঠামো</a></li>
        <li><a href="{{ route('purification') }}">শুদ্ধাচার সংক্রান্ত তথ্য</a></li>
        </ul>
    </div>
</div>
</li>
<li class="col2 mzr-drop"><a href="#" class="submenu">ভর্তি</a>
<div class="mzr-content drop-one-columns">
    <div class="one-col">
        <ul class="mzr-links">
            <li><a href="{{$setting->admission_link}}">অনলাইন এডমিশন</a></li>
            <li><a href="{{ route('admission.rules') }}">ভর্তি নীতি</a></li>
            <li><a href="{{ route('registration') }}">রেজিস্ট্রেশন সিস্টেম</a></li>
            <li><a href="{{ route('curricullam') }}">বর্তমান শিক্ষা ব্যবস্থা</a></li>
            <li><a href="{{ route('semister') }}">সেমিস্টার পরিকল্পনা</a></li>
</ul>
    </div>
</div>
</li>
<li class="col2 mzr-drop"><a href="#" class="submenu">ক্লাস সমূহ</a>
<div class="mzr-content drop-one-columns">
    <div class="one-col">
        <ul class="mzr-links">
         <li><a href="{{ route('kg') }}">কিন্ডার গার্টেন</a></li>
            <li><a href="{{ route('primary') }}">প্রাথমিক</a></li>
            <li><a href="{{ route('high') }}">৬ষ্ঠ - দশম</a></li>
            <li><a href="{{ route('hsc') }}">একাদশ-দ্বাদশ</a></li>
            <li><a href="{{ route('degree') }}">ডিগ্রী</a></li>
            <li><a href="{{ route('honours') }}">অনার্স</a></li>
    </ul>
    </div>
</div>
</li>
<li class="col3 mzr-drop"><a href="#" class="submenu">ব্যবস্থাপনা</a>
<div class="mzr-content drop-one-columns">
    <div class="one-col">
        <ul class="mzr-links">
            <li><a href="{{ route('founder') }}">প্রতিষ্ঠাতা</a></li>
        <li><a href="{{ route('principal') }}">অধ্যক্ষ</a></li>
        <li><a href="{{ route('vice-principal') }}">উপাধ্যক্ষ</a></li>
        <li><a href="{{ route('teacher') }}">শিক্ষক</a></li>
        <li><a href="{{ route('office') }}">অফিস</a></li>
         <li><a href="{{ route('stuff') }}"> কর্মচারী</a></li>
        </ul>
    </div>
</div>
</li>
<li class="col4 mzr-drop"><a href="#" class="submenu">একাডেমিক</a>
<div class="mzr-content drop-one-columns">
    <div class="one-col">
        <h6> </h6>
        <ul class="mzr-links">
            
      <li><a href="{{ route('class-routine') }}">শ্রেণীসূচি</a></li>
    <li><a href="{{ route('online-class-routine') }}">অনলাইন শ্রেণীসূচি</a></li>
    <li><a href="{{ route('class-routine') }}">পরীক্ষার সময়সূচি</a></li>
    <li><a href="{{ route('academic-syllabus') }}">একাডেমিক সিলেবাস</a></li>
    <li><a href="{{ route('calendar') }}">শিক্ষা বর্ষপঞ্জি</a></li>
    <li><a href="{{ route('prospectus') }}">একাডেমিক প্রসপেক্টাস</a></li>
       </ul>
    </div>
</div>
</li>
<li class="col5 mzr-drop"><a href="#" class="submenu">শিক্ষার্থী</a>
<div class="mzr-content drop-one-columns">
    <div class="one-col">
        <h6> </h6>
        <ul class="mzr-links">
        <li><a href="{{ route('tution') }}">শিক্ষার্থীদের বেতন</a></li>
        <li><a href="{{ route('uniform') }}">শিক্ষার্থীদের ইউনিফর্ম</a></li>
        <li><a href="{{ route('exam-manage') }}">পরীক্ষার ব্যবস্থা</a></li>
        <li><a href="{{ route('student-rules') }}">নিয়ম এবং প্রবিধান</a></li>
        <li><a href="{{ route('our-student') }}">আমাদের ছাত্র-ছাত্রী</a></li>
        <li><a href="{{ route('student-success') }}">শিক্ষার্থীদের সাফল্যের গল্প</a></li>
        </ul>
    </div>
</div>
</li>
<li class="col6 mzr-drop"><a href="#" class="submenu">রেজাল্ট ও এডমিন কার্ড</a>
<div class="mzr-content drop-one-columns">
    <div class="one-col">
        <h6> </h6>
        <ul class="mzr-links">
    <li><a href="{{$setting->admit_card}}">এডমিট কার্ড ডাউনলোড</a></li>
	<li><a href="{{$setting->result}}">রেজাল্ট ডাউনলোড</a></li>
	<li><a href="{{$setting->certificate}}">সার্টিফিকেট ডাউনলোড</a></li>
            <li><a href="https://eboardresults.com/v2/home">বোর্ড পরীক্ষার ফলাফল</a></li>
</ul>
    </div>
</div>
</li>
<li class="col7 mzr-drop"><a href="#" class="submenu">রিসোর্স</a>
<div class="mzr-content drop-one-columns">
    <div class="one-col">
        <h6> </h6>
        <ul class="mzr-links">
            <li><a href="{{ route('class-content') }}">ডিজিটাল ক্লাস কনটেন্ট</a></li>
             <li><a href="{{ route('library') }}">গ্রন্থাগার</a></li>
            <li><a href="{{ route('labrotory') }}">গবেষণাগার</a></li>
            <li><a href="{{ route('sports-yard') }}">খেলার মাঠ</a></li>
            <li><a href="{{ route('co-education') }}">সহ-পাঠক্রম সংক্রান্ত কার্যক্রম</a></li>
</ul>
    </div>
</div>
</li>
<li class="col8 mzr-drop"><a href="#" class="submenu">নোটিশ</a>
<div class="mzr-content drop-one-columns">
    <div class="one-col">
        <h6>  </h6>
        <ul class="mzr-links">
               <li><a href="{{ route('recent.notice') }}">সাম্প্রতিক নোটিশ</a></li>
               <li><a href="{{ route('admission.notice') }}">ভর্তি নোটিশ</a></li>
                <li><a href="{{ route('exam.notice') }}">পরীক্ষার নোটিশ</a></li>
                <li><a href="{{ route('result.notice') }}">ফলাফলের নোটিশ</a></li>
                 <li><a href="{{ route('schollar.notice') }}">বৃত্তি সংক্রান্ত নোটিশ</a></li>
            <li><a href="{{ route('stipend.notice') }}">উপবৃত্তি সংক্রান্ত নোটিশ</a></li>
                <li><a href="{{ route('event.notice') }}">ইভেন্টস নোটিশ</a></li>
                <li><a href="{{ route('admin.notice') }}">প্রশাসনিক নোটিশ</a></li>
                <li><a href="{{ route('national.notice') }}">জাতীয় কর্মসূচী</a></li>
                <li><a href="{{ route('sport.notice') }}">খেলাধুলা সংক্রান্ত</a></li>
        </ul>
    </div>
</div>
</li>
<li class="col8 mzr-drop"><a href="#" class="submenu">গ্যালারী</a>
<div class="mzr-content drop-one-columns">
    <div class="one-col">
        <h6>  </h6>
        <ul class="mzr-links">
            <li><a href="{{ route('photo.gallery') }}">ফটো গ্যালারী</a></li>
            <li><a href="{{ route('video.gallery') }}">ভিডিও গ্যালারী</a></li>
        </ul>
    </div>
</div>
</li>
<li class="col8 mzr-drop"><a href="#" class="submenu">লগইন</a>
<div class="mzr-content drop-one-columns">
    <div class="one-col">
        <h6>  </h6>
        <ul class="mzr-links">
            <li><a href="{{$setting->teacher_login}}">শিক্ষক লগইন</a></li>
             <li><a target="_blank" href="{{$setting->student_login}}">শিক্ষার্থী লগইন</a></li>
        </ul>
    </div>
</div>
</li>


</ul>
</div>
</div>
</div>

<script>
        /* Responsive Design*/
        $(document).ready(function () {
            var wi = $( window ).width();
            if(wi < 980){

                $('#jmenu .show-menu').click(function () {
                    //$('.mzr-responsive').show();
                    $(".mzr-responsive").slideToggle(400,"linear", function () {

                    });
                });

                $("#jmenu a.submenu").click(function() {

                    $('#jmenu a.submenu').siblings().addClass('sibling-toggle');
                    $(this).parent().find(".mzr-content").removeClass('sibling-toggle').addClass('slide-visible').slideToggle(400,"linear", function() {
                        return false;
                    });
                    // return false;
                });
            }

        });

    </script>