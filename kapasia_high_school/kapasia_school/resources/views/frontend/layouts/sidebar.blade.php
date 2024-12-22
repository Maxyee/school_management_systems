                <div class="four columns right-side-bar" id="right-content">
                {{-- <div class="column block">
                <h5 class="bk-org title">প্রতিষ্ঠাতা</h5>
                <p style="text-align:center"><img alt="Founder"
              src="{{ asset('frontend') }}/assets/images/speech/blank-profile60a4fdcff0797.jpg"
              style="border-style:solid; border-width:0px; height:176px; margin-left:40px; margin-right:40px; width:150px"/>
                </p>
                <p style="text-align:center"><strong><a href="speech48a6.html?page_id=5"><span style="color:#000000">আলহাজ্ব মজিবর রহমান মজনু</span></a></strong>
                </p>
                <p style="text-align:center">
                    <strong>প্রতিষ্ঠাতা <br> শেরপুর টাউন ক্লাব পাবলিক লাইব্রেরী মহিলা কলেজ বগুড়া।</strong>
                </p>
                <p>
                </p>
            </div>
            <style>#right-content .block {
             display: block !important
            }</style> --}}
            @foreach($principals as $principal)
             <div class="column block">
                <a href="{{ route('principal.details',$principal->id) }}">
                <h5 class="bk-org title" style="padding: 5px;">{{ $principal->designation }}</h5>
                <p style="text-align:center"><img alt="Principal"
              src="{{ asset('upload/principalimage') }}/{{ $principal->image }}"
              style="border-style:solid; border-width:0px; height:100px; margin-left:40px; margin-right:40px; width:100px"/>
                </p>
                <p style="text-align:center"><strong><span
                                style="color:#000000">{{ $principal->name }}</span></strong>
                </p>
                <p style="text-align:center">
                    <strong>{{ $principal->designation }} <br> {{ $principal->school_name }}</strong>
                </p>
                <p>
                </p>
                </a>
            </div>
            @endforeach
            {{-- <style>#right-content .block {
                    display: block !important
                }</style>

                <div class="column block">
                <h5 class="bk-org title">উপাধ্যক্ষ</h5>
                <p style="text-align:center"><img alt="Principal"
              src="{{ asset('frontend') }}/assets/images/speech/blank-profile60a4fdc5ea4ee.jpg"
              style="border-style:solid; border-width:0px; height:176px; margin-left:40px; margin-right:40px; width:150px"/>
                </p>
                <p style="text-align:center"><strong><a href="speech30d3.html?page_id=4"><span
                                style="color:#000000">মোঃ রুহুল আমীন</span></a></strong>
                </p>
                <p style="text-align:center">
                    <strong>উপাধ্যক্ষ <br> শেরপুর টাউন ক্লাব পাবলিক লাইব্রেরী মহিলা কলেজ বগুড়া।</strong>
                </p>
                <p>
                </p>
            </div> --}}
            <style>#right-content .block {
                    display: block !important
                }</style>
            

    <div class="column block">
        <h5 class="bk-org title">গুরুত্বপূর্ণ লিঙ্ক</h5>
        <ul>
                        <li><a href="http://www.moedu.gov.bd/">শিক্ষা মন্ত্রনালয়</a></li>
                        <li><a href="http://www.dhakaeducationboard.gov.bd/">মাধ্যমিক ও উচ্চমাধ্যমিক শিক্ষা বোর্ড, ঢাকা</a></li>
                        <li><a href="http://www.dshe.gov.bd/">মাধ্যমিক ও উচ্চশিক্ষা অধিদপ্তর</a></li>
                        <li><a href="http://www.nu.ac.bd/">জাতীয় বিশ্ববিদ্যালয়</a></li>
                        <li><a href="http://www.shed.gov.bd/">মাধ্যমিক ও উচ্চ শিক্ষা বিভাগ</a></li>
                        <li><a href="http://www.bteb.gov.bd/">বাংলাদেশ কারিগরি শিক্ষা বোর্ড</a></li>
                        <li><a href="http://www.pmeat.gov.bd/">প্রধানমন্ত্রীর শিক্ষা সহায়তা ট্রাস্ট</a></li>
                        <li><a href="http://www.pmo.gov.bd/">প্রধানমন্ত্রীর কার্যালয়</a></li>
                        <li><a href="http://www.cabinet.gov.bd/">মন্ত্রীপরিষদ বিভাগ</a></li>
                    </ul>
    </div>
	
	
		    <div class="column block">
        <h5 class="bk-org title">জরুরি হটলাইন</h5>
				
				<img alt=" জরুরি হটলাইন" src="{{ asset('frontend/hotline1.jpg') }}" style="width:220px">
    </div>
		    <div class="column block">
        <h5 class="bk-org title">জাতীয় সংগীত</h5>
<audio controls="" style="width:100%">
				 <source src="{{ asset('frontend') }}/bd_national_anthem.mp3" type="audio/mp3">
				</audio>
    </div>

    <div class="clearfix"></div>
    <style>.share-buttons img {
            width: 30px;
            padding: 2px;
            border: 0;
            box-shadow: 0;
            display: inline;
        }</style>
</div>    </div>
</div>