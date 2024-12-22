 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h2 style="font-weight: bold;font-size:25px"> {!!$post->title!!} </h2>
	<a target="_blank" href="{{ asset('upload/postfile/'.$post->post_file) }}"><i class="fa fa-file-pdf" style="color:red;font-size:20px"></i>File Download</a>
	<hr>
	
  <div style="text-align: justify;">


    <p>{!!$post->description!!}</p>
   </div>
  {{-- <div class="topsocial">
                                            <a target="_blank" href="http://www.facebook.com" data-toggle="tooltip" data-placement="bottom" title="Facebook"><i class="fa fa-facebook"></i>Facebook</a>
                                            <a target="_blank" href="" data-toggle="tooltip" data-placement="bottom" title="Youtube"><i class="fa fa-youtube"></i></a>
                                            <a target="_blank" href="" data-toggle="tooltip" data-placement="bottom" title="Twitter"><i class="fa fa-twitter"></i></a>
                                            <a target="_blank" href="" data-toggle="tooltip" data-placement="bottom" title="Instagram"><i class="fa fa-instagram"></i></a>
                                           {{--  <a target="_blank" href="#" data-toggle="tooltip" data-placement="bottom" title="Pinterest"><i class="fa fa-pinterest"></i></a> --}}
                                           {{--  <a target="_blank" href="" data-toggle="tooltip" data-placement="bottom" title="Website"><i class="fa fa-internet-explorer"></i></a>
                                            
                                        </div> --}}

</div>
{{-- <script>
    const gmailBtn = document.getElementById('gmail-btn');
    const facebookBtn = document.getElementById('facebook-btn');
    const gplusBtn = document.getElementById('gplus-btn');
    const twitterBtn = document.getElementById('twitter-btn');
    const linkedinBtn = document.getElementById('linkedin-btn');
    const whatsappBtn = document.getElementById('whatsapp-btn');
    const socialBtn = document.getElementById('social-links');

    let postUrl = encodeURI(document.location.href);
    let postTitle = encodeURI('{{ $post->title }}');

    facebookBtn.setAttribute("href",`https://www.facebook.com/sharer.php?u=${postUrl}`);
    twitterBtn.setAttribute("href", `https://twitter.com/share?url=${postUrl}&text=${postTitle}`);
    linkedinBtn.setAttribute("href", `https://www.linkedin.com/shareArticle?url=${postUrl}&title=${postTitle}`);
    whatsappBtn.setAttribute("href",`https://wa.me/?text=${postTitle} ${postUrl}`);
    gmailBtn.setAttribute("href",`https://mail.google.com/mail/?view=cm&su=${postTitle}&body=${postUrl}`);
    gplusBtn.setAttribute("href",`https://plus.google.com/share?url=${postUrl}`);

// Share Button
const shareBtn = document.getElementById('share-btn');
const shareBtn2 = document.getElementById('share-btn2');

if(navigator.share){
shareBtn.style.display ='block';
socialBtn.style.display = 'block';
shareBtn.addEventListener('click',() =>{
navigator.share({
title:postTitle,
url:postUrl
}).then((result)=>{
    alert('Thank You For Sharing')
}).catch((error)=>{
console.log(error);
});
});
}else{


}

if(navigator.share){
shareBtn2.style.display ='block';
socialBtn.style.display = 'block';
shareBtn.addEventListener('click',() =>{
navigator.share({
title:postTitle,
url:postUrl
}).then((result)=>{
    alert('Thank You For Sharing')
}).catch((error)=>{
console.log(error);
});
});
}else{


}




</script> --}}
 @endsection
