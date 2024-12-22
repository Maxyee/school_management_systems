<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Video;
use Auth;
use App\Models\User;
use Toastr;
class VideoController extends Controller
{
   public function view(){
        $data['alldata'] = Video::all();
       
    return view('admin.video.view-video',$data);
    }    
    
   
    
     public function store(Request $request){
        $this->validate($request,[
            'title'=>'required',
            'link'=>'required',
        
        ]);
            

        $data = new Video();
        $data->title = $request->title;
        $data->caption_by = $request->caption_by;
        $data->link = $request->link;
        $data->caption_date = $request->caption_date;
        $data->created_by = Auth::user()->id;

        //  if ($request->file('image')){
        //   $file = $request->file('image');
        //   $filename =date('YmdH').$file->getClientOriginalName();
        //   $file->move(public_path('upload/video'), $filename);
        //   $data['image'] = $filename;
        // }

        $data->save();
         Toastr::success('  Video Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = Video::find($id);

             $this->validate($request,[
             'title'=>'required',
            'link'=>'required',
        
        ]);
            
        $data->title = $request->title;
        $data->link = $request->link;
        $data->caption_by = $request->caption_by;
        $data->caption_date = $request->caption_date;
        $data->updated_by = Auth::user()->id;
       

        //   if ($request->file('image')){
        //   $file = $request->file('image');
        //     @unlink(public_path('upload/video/'.$data->image));
        //   $filename =date('YmdH').$file->getClientOriginalName();
        //   $file->move(public_path('upload/video'), $filename);
        //   $data['image'] = $filename;
        // }
        $data->save();
        Toastr::success('  Video Updated Successfully','success');
        return back();

    }

      public function active(Request $request){
            $data = Video::find($request->id);
             $data->status = 1;
             $data->save();
           Toastr::success('Video Activated Successfully','success');
        return back();
}

    public function inactive(Request $request){
            $data = Video::find($request->id);
             $data->status = 0;
             $data->save();
           Toastr::success('Video Inactivated Successfully','success');
        return back();
}

     public function delete(Request $request){
            $data = Video::find($request->id); 

               if (file_exists('upload/video/' . $data->image) AND !
            empty($data->image)){
               unlink('upload/video/' . $data->image);
       }
             $data->delete();
           Toastr::success('Video Deleted Successfully','success');
        return back();
    }

}
