<!DOCTYPE html>
<html lang="en">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
<title>{{$setting->college_name}}  </title>

<meta name="description" content="{{$setting->meta_description}}">
<meta name="keywords" content="{{$setting->meta_keywords}}"/>

<meta name="author" content="Elite design"/>
<meta name='designer' content='Md. Abu Sayed, info@elitedesign.com.bd'/>
<meta name='coverage' content='Worldwide'/>
<meta name='distribution' content='Global'/>
<meta name='rating' content='General'/>
<meta name='robots' content='index,follow'/>

<!-- =============== tt canonical End =============================== -->
<link rel="icon" href="{{ asset('upload') }}/gov.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" >
<link type="text/css" rel="stylesheet" media="all" href="{{ asset('frontend') }}/assets/css/base.css" />
<link type="text/css" rel="stylesheet" media="all" href="{{ asset('frontend') }}/assets/css/skeleton.css" />
<link type="text/css" rel="stylesheet" media="all" href="{{ asset('frontend') }}/assets/css/style.css" />
<link type="text/css" rel="stylesheet" media="all" href="{{ asset('frontend') }}/assets/css/meganizr.css" />
<link type="text/css" rel="stylesheet" media="all" href="{{ asset('frontend') }}/assets/css/flaticon.css" />
<link type="text/css" rel="stylesheet" media="all" href="{{ asset('frontend') }}/assets/css/style2.css" />
<link type="text/css" rel="stylesheet" media="all" href="{{ asset('frontend') }}/assets/css/jquery.fancybox.min.css" />
<link type="text/css" rel="stylesheet" media="all" href="{{ asset('frontend') }}/assets/css/all.css" />
<link rel="stylesheet" href="{{ asset('frontend') }}/assets/css/responsiveslides.css">
<link rel="stylesheet" href="{{ asset('frontend') }}/assets/css/responsive.css">
<link rel="stylesheet" href="{{ asset('frontend') }}/assets/css/accessibility.css">
<!--    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>-->

<script type="text/javascript" src="{{ asset('frontend') }}/assets/js/jquery-1.11.1.min.js"></script>


</head>
<body class="hi-tech-it">
<!-- ====== start jump to selections ======   -->
<a class="skip-link" href="#jmenu">Jump to Menu</a>
<a class="skip-link" href="#btnLang">Jump to Language</a>
<!-- ====== End jump to selections ======   -->

@include('frontend.layouts.header')


@yield('content') 

	
@include('frontend.layouts.sidebar')
@include('frontend.layouts.footer')

<!-- container -->



<script src="{{ asset('frontend') }}/assets/js/jquery-accessibleMegaMenu.js"></script>



<script src="{{ asset('frontend') }}/assets/js/responsiveslides.min.js"></script>
<script src="{{ asset('frontend') }}/assets/js/jquery.vticker.js" type="text/javascript"></script>
   <script src="{{ asset('frontend') }}/assets/js/domain_selector.js"  type="text/javascript"></script>
<script src="{{ asset('frontend') }}/assets/js/utils.js" type="text/javascript"></script>
<script type="text/javascript" src="{{ asset('frontend') }}/assets/js/yoxview-init.js"></script>

<script src="{{ asset('frontend') }}/assets/js/jquery.fancybox.min.js" type="text/javascript"></script>
<script src="https://use.fontawesome.com/1a2842242e.js"></script>
<script src="{{ asset('frontend') }}/assets/js/all-scripts.js" type="text/javascript"></script>

{{-- <script>
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

    </script> --}}


</body>
</html>
