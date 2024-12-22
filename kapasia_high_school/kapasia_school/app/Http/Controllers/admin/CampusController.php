<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Campus;
use Auth;
use App\Models\User;
use Toastr;
class CampusController extends Controller
{
   public function view(){
        $data['alldata'] = Campus::all();
       
    return view('admin.campus.view-campus',$data);
    }
    
   
    
     public function store(Request $request){
        // $this->validate($request,[
        //     'about'=>'required',
        //     'history'=>'required',
        //     'purification'=>'required',
        //     'structure'=>'required',
        //     'infrastructure'=>'required',
        //     'mv'=>'required',


        // ]);

        $data = new Campus();
        $data->about = $request->about;
        $data->history = $request->history;
        $data->purification = $request->purification;
        $data->infrastructure = $request->infrastructure;
        $data->mv = $request->mv;
        $data->structure = $request->structure;
        $data->created_by = Auth::user()->id;



        $data->save();

         Toastr::success('Campus Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = Campus::find($id);

        //      $this->validate($request,[
        //      'about'=>'required',
        //     'history'=>'required',
        //     'purification'=>'required',
        //     'structure'=>'required',
        //     'infrastructure'=>'required',
        //     'mv'=>'required',
        // ]);
        $data->about = $request->about;
        $data->history = $request->history;
        $data->purification = $request->purification;
        $data->infrastructure = $request->infrastructure;
        $data->mv = $request->mv;
        $data->structure = $request->structure;
        $data->save();


        
        Toastr::success('Campus Updated Successfully','success');
        return back();

    }
}
