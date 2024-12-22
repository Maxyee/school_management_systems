<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Academic;
use Auth;
use App\Models\User;
use Toastr;
class AcademicController extends Controller
{
   public function view(){
        $data['alldata'] = Academic::all();
       
    return view('admin.academic.view-academic',$data);
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

        $data = new Academic();
        $data->founder = $request->founder;
        $data->principal = $request->principal;
        $data->vp = $request->vp;
        $data->teacher = $request->teacher;
        $data->office = $request->office;
        $data->helper = $request->helper;
        $data->created_by = Auth::user()->id;



        $data->save();

         Toastr::success('Academic Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = Academic::find($id);

        //      $this->validate($request,[
        //      'about'=>'required',
        //     'history'=>'required',
        //     'purification'=>'required',
        //     'structure'=>'required',
        //     'infrastructure'=>'required',
        //     'mv'=>'required',
        // ]);
        $data->founder = $request->founder;
        $data->principal = $request->principal;
        $data->vp = $request->vp;
        $data->teacher = $request->teacher;
        $data->office = $request->office;
        $data->helper = $request->helper;
        $data->save();


        
        Toastr::success('Academic Updated Successfully','success');
        return back();

    }
}
