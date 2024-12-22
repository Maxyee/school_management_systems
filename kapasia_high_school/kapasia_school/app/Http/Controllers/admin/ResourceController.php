<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Resource;
use Auth;
use App\Models\User;
use Toastr;
class ResourceController extends Controller
{
   public function view(){
        $data['alldata'] = Resource::all();
       
    return view('admin.resource.view-resource',$data);
    }
    
   
    
     public function store(Request $request){
        // $this->validate($request,[
        //     'about'=>'required',
        //     'library'=>'required',
        //     'lab'=>'required',
        //     'sports_yard'=>'required',
        //     'co_education'=>'required',
       


        // ]);

        $data = new Resource();
        $data->class_content = $request->class_content;
        $data->library = $request->library;
        $data->lab = $request->lab;
        $data->co_education = $request->co_education;
        
        $data->sports_yard = $request->sports_yard;
        $data->created_by = Auth::user()->id;



        $data->save();

         Toastr::success('Resource Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = Resource::find($id);

        //      $this->validate($request,[
        //      'class_content'=>'required',
        //     'library'=>'required',
        //     'lab'=>'required',
        //     'sports_yard'=>'required',
        //     'co_education'=>'required',
       
        // ]);
        $data->class_content = $request->class_content;
        $data->library = $request->library;
        $data->lab = $request->lab;
        $data->co_education = $request->co_education;
        
        $data->sports_yard = $request->sports_yard;
        $data->save();


        
        Toastr::success('Resource Updated Successfully','success');
        return back();

    }
}
