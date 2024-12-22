@php
	$category=DB::table('categories')->orderBy('id','ASC')->get();
	$seo=DB::table('seos')->first();
	$social=DB::table('socials')->first();
	$horizontal1=DB::table('ads')->where('type',2)->first();
	$setting=DB::table('settings')->first();
@endphp
<link rel="stylesheet" href="{{ asset('public/frontend/fonts/css/stellarnav.html')}}">

<style type="text/css">

	@font-face {

    font-family: 'SolaimanLipiNormal';

    src: url("{{ asset('public/frontend/fonts/solaiman-lipi.eot')}}");
    src: url("{{ asset('public/frontend/fonts/solaiman-lipi.eot')}}") format('embedded-opentype'),
    	url("{{ asset('public/frontend/fonts/solaiman-lipi.woff')}}"),
    	url("{{ asset('public/frontend/fonts/solaiman-lipi.ttf')}}") format('truetype'),
    	url("{{ asset('public/frontend/fonts/solaiman-lipi.html#SolaimanLipiNormal')}}") format('svg');

	

	font-weight:normal;font-style:normal;

}


	.eliteDesign_extrapage {
	padding : 1%;
	margin: 0 auto;
	width: 96%;
    height: auto;
    overflow: hidden;
    font-family: SolaimanLipiNormal;
    font-size: 20px;
}

.print-padding {
	border: 1px solid #ddd;
	padding: 2%;
}


.print-logo img {
	max-width: 40%;
	height: auto;
}

.print-title {
	font-size: 30px;
	color: #000;
	line-height: auto;
	margin: 11px 0 8px;
}

.print-sub-title {
	font-size: 20px;
	color: #000;
	line-height: auto;
	margin: 11px 0 8px;
}

.print-date {
    font-size: 17px;
    margin-bottom: 10px;
    color: #000;
    text-align: center;
    background: #eaefef;
    padding: 5px 0px;
    border-bottom: 2px solid #ddd;
}

.main_content{
	overflow: hidden;
}


.print-image img {
    width: 50%;
    height: auto;
    float: left;
    margin-right: 20px;
}

.print-details {
	text-align: justify;
	color: #000;
}

.eliteDesignPrinet_footer {
	display: flex;
	margin: 17px 0 16px;
	border-top: 2px solid #030026;
	padding-top: 16px;
}

.printFooter-title {
	color: #000;
	font-size: 20px;
	padding-bottom: 7px;
	position: relative;
	border-bottom: 1px solid #d9d9d9;
	margin-bottom: 13px;
}

.printFooter-title::before {
	position: absolute;
	left: 0;
	bottom: -2px;
	content: '';
	height: 3px;
	width: 10%;
	background: #030026;
}
.print-wrpp {
	padding: 0 10px 0;
	width: 50%;
}

.printFooter-address {
	font-size: 16px;
	color: #000;
}

</style>

<script type="text/javascript">
    function printpage() {
        //Get the print button and put it into a variable
        var printButton = document.getElementById("printpagebutton");
        //Set the print button visibility to 'hidden' 
        printButton.style.visibility = 'hidden';
        //Print the page content
        window.print()
        //Set the print button to 'visible' again 
        //[Delete this line if you want it to stay hidden after printing]
        printButton.style.visibility = 'visible';
    }
</script>

<input id="printpagebutton" type="button" value="Print This Page" onclick="printpage()"/>

<div class="eliteDesign_extrapage">
        <div class="print-padding">
            <div class="print-logo">
                <img src="{{ URL::to('/') }}"> <img src="{{ asset($setting->logo) }}">
            </div>
                        <h1 class="print-title">
               {{ $post->title_bn }}
            </h1>
            <h2 class="print-sub-title">
                সাব হেডিং সাব হেডিং সাব হেডিং সাব হেডিং সাব হেডিং সাব হেডিং সাব হেডিং
            </h2>
            <div class="print-date">
                   আপলোড সময় : 
                                                      
                                                                                                              ০৮-০১-২০২৩ ০৬:৪৬:০৬ অপরাহ্ন
                                                       , 
                                                       আপডেট সময় : 
                                                                                                            ০৮-০১-২০২৩ ০৬:৪৬:০৬ অপরাহ্ন
                                                        
            </div>
        </hr>
            <div class="main_content">
            <div class="print-image">
                <img src="../../public/postimages/63babb0e2acb4.jpg">
            </div>
            <div class="print-details">
                এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ।<br />
<br />
এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ।<br />
<br />
এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ। এটা একটা ডেমো নিউজ।
            </div>
            </div>


            <!-- footer -->

            

            <div class="eliteDesignPrinet_footer">
                <div class="print-wrpp">
                	                    <h3 class="printFooter-title">
                        সম্পাদকীয় : 
                    </h3>
                                        <div class="printFooter-address">
                        <p align="left">সম্পাদক ও প্রকাশক : আব্দুল হাসিম চৌধুরী</p><p align="left">নির্বাহী সম্পাদক : আবু রায়হান<br></p><p align="left">বার্তা সম্পাদক : আবু হুরায়রা চৌধুরী</p><p align="left"><br></p>
                    </div>
                </div>
                <div class="print-wrpp">
                	                    <h3 class="printFooter-title">
                        অফিস :
                    </h3>
                                        <div class="printFooter-address">
                        <p align="left">অফিস : মিরপুর, ঢাকা, বাংলাদেশ-১২১৬</p><p align="left">ইমেইল : youremail@gmail.com</p><p align="left">মোবাইল : 01710-000000<br></p>
                    </div>
                </div>
            </div>

        </div>
    </div>

    