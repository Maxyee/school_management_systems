 @extends('frontend.layouts.index')

 @section('content')

<div id="contents" class="sixteen columns">

	<div class="twelve columns" id="left-content">
	<br>
	
	<h2 style="font-weight: bold;font-size:25px"> ফটো গ্যালারী </h2>
	
	<hr>
	<style>

	nav svg{
			height: 20px;

		}
		nav .hidden{
			display: block !important ;
		}
div.gallery {
  margin: 5px;
  border: 1px solid #ccc;
  float: left;
  width: 335px;
}

div.gallery:hover {
  border: 1px solid #777;
}

div.gallery img {
  width: 100%;
  height: auto;
}

div.desc {
  padding: 15px;
  text-align: center;
}
</style>

@foreach($photos as $photo)
<div class="gallery" style="padding:5px;height: 350px;">
  <a target="_blank" href="{{ asset('upload/photoimage/'.$photo->image) }}">
    <img src="{{ asset('upload/photoimage/'.$photo->image) }}" alt="Cinque Terre" style="width:100%;height: 200px;padding-bottom: 10px;">
  </a>
  <p  class="desc"><strong>Photo Title :</strong> {{ $photo->title }}</p>
  <p class="desc"> <strong>Caption Date :</strong> {{ date('d-M-Y',strtotime($photo->caption_date)) }}</p>
  @if($photo->caption_by==null)
  @else
<p class="desc"><strong>Caption By :</strong> {{ date('d-M-Y',strtotime($photo->caption_by)) }}</p>
  @endif
</div>
@endforeach
{{ $photos->links() }}
</div>


 @endsection
