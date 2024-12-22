<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Slider;
use Auth;
use App\Models\User;
use Toastr;
class SliderController extends Controller
{
   public function view(){
        $data['alldata'] = Slider::all();
    return view('admin.slider.view-slider',$data);
    }    
    
   
    
     public function store(Request $request){
        $this->validate($request,[
            'title'=>'required',
            'image'=>'required|image',
        
        ]);
            

        $data = new Slider();
        $data->title = $request->title;
        $data->created_by = Auth::user()->id;

         if ($request->file('image')){
          $file = $request->file('image');
          $filename =date('YmdH').$file->getClientOriginalName();
          $file->move(public_path('upload/sliderimage'), $filename);
          $data['image'] = $filename;
        }

        $data->save();
         Toastr::success('  Slider Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = Slider::find($id);

             $this->validate($request,[
             'title'=>'required',
            'image'=>'image',
        
        ]);
            
        $data->title = $request->title;
        $data->updated_by = Auth::user()->id;
       

          if ($request->file('image')){
          $file = $request->file('image');
            @unlink(public_path('upload/sliderimage/'.$data->image));
          $filename =date('YmdH').$file->getClientOriginalName();
          $file->move(public_path('upload/sliderimage'), $filename);
          $data['image'] = $filename;
        }
        $data->save();
        Toastr::success('  Slider Updated Successfully','success');
        return back();

    }

      public function active(Request $request){
            $data = Slider::find($request->id);
             $data->status = 1;
             $data->save();
           Toastr::success('Slider Activated Successfully','success');
        return back();
}

    public function inactive(Request $request){
            $data = Slider::find($request->id);
             $data->status = 0;
             $data->save();
           Toastr::success('Slider Inactivated Successfully','success');
        return back();
}

     public function delete(Request $request){
            $data = Slider::find($request->id); 

               if (file_exists('upload/sliderimage/' . $data->image) AND !
            empty($data->image)){
               unlink('upload/sliderimage/' . $data->image);
       }
             $data->delete();
           Toastr::success('Slider Deleted Successfully','success');
        return back();
    }

}
