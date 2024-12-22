<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Photo;
use Auth;
use App\Models\User;
use Toastr;
class PhotoController extends Controller
{
   public function view(){
        $data['alldata'] = Photo::all();
       
    return view('admin.photo.view-photo',$data);
    }    
    
   
    
     public function store(Request $request){
        $this->validate($request,[
            'title'=>'required',
            'image'=>'required|image|mimes:jpg,jpeg,png|max:100',
        
        ]);
            

        $data = new Photo();
        $data->title = $request->title;
        $data->caption_by = $request->caption_by;
         $data->caption_date = $request->caption_date;
        $data->created_by = Auth::user()->id;

         if ($request->file('image')){
          $file = $request->file('image');
          $filename =date('YmdH').$file->getClientOriginalName();
          $file->move(public_path('upload/photoimage'), $filename);
          $data['image'] = $filename;
        }

        $data->save();
         Toastr::success('  Photo Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = Photo::find($id);

             $this->validate($request,[
             'title'=>'required',
            'image'=>'image|mimes:jpg,jpeg,png|max:100',
        
        ]);
            
        $data->title = $request->title;
        $data->caption_by = $request->caption_by;
         $data->caption_date = $request->caption_date;
        $data->updated_by = Auth::user()->id;
       

          if ($request->file('image')){
          $file = $request->file('image');
            @unlink(public_path('upload/photoimage/'.$data->image));
          $filename =date('YmdH').$file->getClientOriginalName();
          $file->move(public_path('upload/photoimage'), $filename);
          $data['image'] = $filename;
        }
        $data->save();
        Toastr::success('  Photo Updated Successfully','success');
        return back();

    }

      public function active(Request $request){
            $data = Photo::find($request->id);
             $data->status = 1;
             $data->save();
           Toastr::success('Photo Activated Successfully','success');
        return back();
}

    public function inactive(Request $request){
            $data = Photo::find($request->id);
             $data->status = 0;
             $data->save();
           Toastr::success('Photo Inactivated Successfully','success');
        return back();
}

     public function delete(Request $request){
            $data = Photo::find($request->id); 

               if (file_exists('upload/photoimage/' . $data->image) AND !
            empty($data->image)){
               unlink('upload/photoimage/' . $data->image);
       }
             $data->delete();
           Toastr::success('Photo Deleted Successfully','success');
        return back();
    }

}
