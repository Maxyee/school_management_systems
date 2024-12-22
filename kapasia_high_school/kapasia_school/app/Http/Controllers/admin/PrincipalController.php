<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Principal;
use Auth;
use App\Models\User;
use Toastr;
class PrincipalController extends Controller
{
   public function view(){
        $data['alldata'] = Principal::all();
       
    return view('admin.principal.view-principal',$data);
    }    
    
   
    
     public function store(Request $request){
        $this->validate($request,[
             'name'=>'required',
            'school_name'=>'required',
            'designation'=>'required',
            'details'=>'required',
            'image'=>'required|image|mimes:jpg,jpeg,png|max:2048',
        
        ]);
            

        $data = new Principal();
        $data->name = $request->name;
        $data->school_name = $request->school_name;
        $data->designation = $request->designation;
        $data->details = $request->details;
       
        $data->created_by = Auth::user()->id;

         if ($request->file('image')){
          $file = $request->file('image');
          $filename =date('YmdH').$file->getClientOriginalName();
          $file->move(public_path('upload/principalimage'), $filename);
          $data['image'] = $filename;
        }


        $data->save();

         Toastr::success('  Principal Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = Principal::find($id);

             $this->validate($request,[
             'name'=>'required',
            'school_name'=>'required',
            'designation'=>'required',
            'details'=>'required',
            'image'=>'image|mimes:jpg,jpeg,png|max:2048',
        
        ]);
            
        $data->name = $request->name;
        $data->school_name = $request->school_name;
        $data->designation = $request->designation;
        $data->details = $request->details;
       

          if ($request->file('image')){
          $file = $request->file('image');
            @unlink(public_path('upload/principalimage/'.$data->image));
          $filename =date('YmdH').$file->getClientOriginalName();
          $file->move(public_path('upload/principalimage'), $filename);
          $data['image'] = $filename;
        }

        $data->save();


        
        Toastr::success('  Principal Updated Successfully','success');
        return back();

    }

     public function delete(Request $request){
            $data = Principal::find($request->id); 

               if (file_exists('upload/principalimage/' . $data->image) AND !
            empty($data->image)){
               unlink('upload/principalimage/' . $data->image);
       }
             $data->delete();
           Toastr::success('Principal Deleted Successfully','success');
        return back();
}

}
