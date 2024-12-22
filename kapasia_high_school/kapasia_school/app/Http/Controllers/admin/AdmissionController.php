<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admission;
use Auth;
use App\Models\User;
use Toastr;
class AdmissionController extends Controller
{
   public function view(){
        $data['alldata'] = Admission::all();
       
    return view('admin.admission.view-admission',$data);
    }    
    
   
    
     public function store(Request $request){
        // $this->validate($request,[
        //     'founder'=>'required',
        //     'principal'=>'required',
        //     'vp'=>'required',
        //     'teacher'=>'required',
        //     'office'=>'required',
        //     'helper'=>'required',


        // ]);

        $data = new Admission();
        $data->apply = $request->apply;
        $data->admission_exam = $request->admission_exam;
        $data->admission_rule = $request->admission_rule;
        $data->registration = $request->registration;
        $data->curricullam = $request->curricullam;
        $data->semister = $request->semister;
        $data->created_by = Auth::user()->id;



        $data->save();

         Toastr::success('Admission Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = Admission::find($id);

        //      $this->validate($request,[
        //      'about'=>'required',
        //     'history'=>'required',
        //     'purification'=>'required',
        //     'structure'=>'required',
        //     'infrastructure'=>'required',
        //     'mv'=>'required',
        // ]);
        $data->apply = $request->apply;
        $data->admission_exam = $request->admission_exam;
        $data->admission_rule = $request->admission_rule;
        $data->registration = $request->registration;
        $data->curricullam = $request->curricullam;
        $data->semister = $request->semister;
        $data->save();


        
        Toastr::success('Admission Updated Successfully','success');
        return back();

    }
}
