<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Setting;
use Auth;
use App\Models\User;
use Toastr;
class SettingController extends Controller
{
   public function view(){
        $data['alldata'] = Setting::all();
    return view('admin.setting.view-setting',$data);
    }    
    
   
    
     public function store(Request $request){
        $this->validate($request,[
            'college_name'=>'required',
            'address'=>'required',
            'mobile'=>'required',
            'email'=>'required',
            'slogan'=>'required',
            'logo'=>'required|image',
        
        ]);
            

        $data = new setting();
        $data->college_name = $request->college_name;
        $data->address = $request->address;
        $data->mobile = $request->mobile;
        $data->email = $request->email;
        $data->slogan = $request->slogan;
        $data->created_by = Auth::user()->id;

         if ($request->file('logo')){
          $file = $request->file('logo');
          $filename =date('YmdH').$file->getClientOriginalName();
          $file->move(public_path('upload/settingimage'), $filename);
          $data['logo'] = $filename;
        }

        $data->save();
         Toastr::success('  Setting Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
           

             $this->validate($request,[
            'college_name'=>'required',
            'address'=>'required',
            'mobile'=>'required',
            'email'=>'required',
            'slogan'=>'required',
        
        ]);
        $data = Setting::find($id);
        $data->college_name = $request->college_name;
        $data->address = $request->address;
        $data->mobile = $request->mobile;
        $data->email = $request->email;
        $data->slogan = $request->slogan;
		$data->meta_description = $request->meta_description;
		$data->meta_keywords = $request->meta_keywords;
		$data->facebook= $request->facebook;
		$data->youtube= $request->youtube;
		$data->teacher_login = $request->teacher_login;
		$data->student_login = $request->student_login;
		$data->admission_link = $request->admission_link;
		$data->certificate = $request->certificate;
		$data->result = $request->result;
		$data->admit_card = $request->admit_card;
        $data->updated_by = Auth::user()->id;
       

          if ($request->file('logo')){
          $file = $request->file('logo');
            @unlink(public_path('upload/settingimage/'.$data->logo));
          $filename =date('YmdH').$file->getClientOriginalName();
          $file->move(public_path('upload/settingimage'), $filename);
          $data['logo'] = $filename;
        }
        $data->save();
        Toastr::success('  Setting Updated Successfully','success');
        return back();

    }

      public function active(Request $request){
            $data = Setting::find($request->id);
             $data->status = 1;
             $data->save();
           Toastr::success('Setting Activated Successfully','success');
        return back();
}

    public function inactive(Request $request){
            $data = Setting::find($request->id);
             $data->status = 0;
             $data->save();
           Toastr::success('Setting Inactivated Successfully','success');
        return back();
}

     public function delete(Request $request){
            $data = Setting::find($request->id); 

               if (file_exists('upload/settingimage/' . $data->logo) AND !
            empty($data->logo)){
               unlink('upload/settingimage/' . $data->logo);
       }
             $data->delete();
           Toastr::success('Setting Deleted Successfully','success');
        return back();
    }

}
