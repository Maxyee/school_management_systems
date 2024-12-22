<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Paper;
use Auth;
use App\Models\User;
use Toastr;
class PaperController extends Controller
{
   public function view(){
        $data['alldata'] = Paper::all();
       
    return view('admin.paper.view-paper',$data);
    }    
    
   
    
     public function store(Request $request){
        // $this->validate($request,[
        //     'class_routine'=>'required',
        //     'online_class_routine'=>'required',
        //     'exam_routine'=>'required',
        //     'syllabus'=>'required',
        //     'prospectus'=>'required',
        //     'prospectus'=>'required',


        // ]);

        $data = new Paper();
        $data->class_routine = $request->class_routine;
        $data->online_class_routine = $request->online_class_routine;
        $data->exam_routine = $request->exam_routine;
        $data->syllabus = $request->syllabus;
        $data->calendar = $request->calendar;
        $data->prospectus = $request->prospectus;
        $data->created_by = Auth::user()->id;



        $data->save();

         Toastr::success(' Academic Paper Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = Paper::find($id);

        //      $this->validate($request,[
         //     'class_routine'=>'required',
        //     'online_class_routine'=>'required',
        //     'exam_routine'=>'required',
        //     'syllabus'=>'required',
        //     'prospectus'=>'required',
        //     'prospectus'=>'required',
        // ]);
            
        $data->class_routine = $request->class_routine;
        $data->online_class_routine = $request->online_class_routine;
        $data->exam_routine = $request->exam_routine;
        $data->syllabus = $request->syllabus;
        $data->calendar = $request->calendar;
        $data->prospectus = $request->prospectus;
        $data->save();


        
        Toastr::success(' Academic Paper Updated Successfully','success');
        return back();

    }
}
