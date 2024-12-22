<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\St;
use Auth;
use App\Models\User;
use Toastr;
class StController extends Controller
{
   public function view(){
        $data['alldata'] = St::all();
       
    return view('admin.st.view-st',$data);
    }
    
   
    
     public function store(Request $request){
        // $this->validate($request,[
        //     'tution'=>'required',
        //     'uniform'=>'required',
        //     'exam_manage'=>'required',
        //     'rules'=>'required',
        //     'our_student'=>'required',
        //     'student_success'=>'required',


        // ]);

        $data = new St();
        $data->tution = $request->tution;
        $data->uniform = $request->uniform;
        $data->exam_manage = $request->exam_manage;
        $data->our_student = $request->our_student;
        $data->student_success = $request->student_success;
        $data->rules = $request->rules;
        $data->created_by = Auth::user()->id;



        $data->save();

         Toastr::success('Front Student Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = St::find($id);

        //      $this->validate($request,[
        //      'tution'=>'required',
        //     'uniform'=>'required',
        //     'exam_manage'=>'required',
        //     'rules'=>'required',
        //     'our_student'=>'required',
        //     'student_success'=>'required',
        // ]);
        $data->tution = $request->tution;
        $data->uniform = $request->uniform;
        $data->exam_manage = $request->exam_manage;
        $data->our_student = $request->our_student;
        $data->student_success = $request->student_success;
        $data->rules = $request->rules;
        $data->save();


        
        Toastr::success(' Front Student Updated Successfully','success');
        return back();

    }
}
