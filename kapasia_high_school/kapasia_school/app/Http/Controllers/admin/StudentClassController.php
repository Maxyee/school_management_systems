<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\StudentClass;
use Auth;
use App\Models\User;
use Str;
use Toastr;
class StudentClassController extends Controller
{
    public function view(){
        $data['alldata'] = StudentClass::all();
    return view('admin.studentclass.view-studentclass',$data);
    }
    
   
    
     public function store(Request $request){
        $this->validate($request,[
            'name'=>'required|unique:student_classes,name'

        ]);

        $data = new StudentClass();
        $data->name = $request->name;
        $data->created_by = Auth::user()->id;
        $data->save();
        Toastr::success('Student Class Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = StudentClass::find($id);
             $this->validate($request,[
            'name'=>'required|unique:student_classes,name,'.$data->id
        ]);

        $data->name = $request->name;
        $data->updated_by = Auth::user()->id;
        $data->save();

    Toastr::success('Student Class Updated Successfully','success');
        return back();

    }

    public function inactive($id){
            $studentclass = StudentClass::find($id);
            $studentclass->status = 0;
            $studentclass->save();
           Toastr::success('Student Class Inactive Successfully','success');
        return back();
        }

        public function active($id){
            $studentclass = StudentClass::find($id);
            $studentclass->status = 1;
            $studentclass->save();
         Toastr::success('Student Class Active Successfully','success');
        return back();
        } 

          public function delete(Request $request){
            $data = StudentClass::find($request->id); 
             $data->delete();
           Toastr::success('Student Class Deleted Successfully','success');
        return back();


     }  
}
