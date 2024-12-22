<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Course;
use Auth;
use App\Models\User;
use Toastr;
class CourseController extends Controller
{
   public function view(){
        $data['alldata'] = Course::all();
       
    return view('admin.course.view-course',$data);
    }
    
   
    
     public function store(Request $request){

        
        // $this->validate($request,[
        //     'kg'=>'required',
        //     'primary'=>'required',
        //     'high'=>'required',
        //     'hsc'=>'required',
        //     'degree'=>'required',
        //     'honours'=>'required',


        // ]);

        $data = new Course();
        $data->kg = $request->kg;
        $data->primary = $request->primary;
        $data->high = $request->high;
        $data->hsc = $request->hsc;
        $data->degree = $request->degree;
        $data->honours = $request->honours;
        $data->created_by = Auth::user()->id;



        $data->save();

         Toastr::success('Course Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = Course::find($id);

          // $this->validate($request,[
        //     'kg'=>'required',
        //     'primary'=>'required',
        //     'high'=>'required',
        //     'hsc'=>'required',
        //     'degree'=>'required',
        //     'honours'=>'required',


        // ]);
        $data->kg = $request->kg;
        $data->primary = $request->primary;
        $data->high = $request->high;
        $data->hsc = $request->hsc;
        $data->degree = $request->degree;
        $data->honours = $request->honours;
        $data->save();


        
        Toastr::success('Course Updated Successfully','success');
        return back();

    }
}
