<style>
        #right-content .block { display:block !important}
    </style>

                <br><br>

                <div class="row">
                    <h4>ভিডিও গ্যালারী</h4>
                    <hr>
        @foreach($videos as $video)
         <div class="four columns columns" style="text-align: center;">
            <div class="row">
        <div style="padding: 5px;" class="col-md-4">
            <iframe frameborder="0"  width="100%"  src="{{ $video->link }}"></iframe>
        </div>
        </div>
        </div>
        @endforeach

         <br>
      </div>
    </div>
 </div>