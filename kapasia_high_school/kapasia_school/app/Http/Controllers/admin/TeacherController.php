<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Role;
// use App\Models\Designation;
// use App\Models\TeacherSubject;
use Auth;
use Hash;
use App\Models\ClassName;
use App\Models\Group;
use App\Models\Section;
use App\Models\Session;
use App\Models\IssueBook;
use App\Models\Book;
use App\Models\Category;


class TeacherController extends Controller
{ 
    public function view(){
    $data['alldata'] = User::where('role_id','2')->get();
    $data['roles'] = Role::get();
    // $data['desis'] = Designation::orderby('name','ASC')->get();
    // $data['subjects'] = Subject::orderby('name','ASC')->get();
    return view('admin.teacher.view-teacher',$data);
    }

    // public function userview(){
    // $data['alldata'] = User::where('role_id',3)->get();
    //  $data['roles'] = Role::get();
    // return view('admin.user.view-user',$data);
    // }

    public function add(){
     $roles = Role::get();
    	return view('admin.teacher.add-teacher',compact('roles'));
    }
    
     public function store(Request $request){

            $this->validate($request,[
            'name'=>'required',
            'email'=>'required|unique:users,email',
            'mobile'=>'required',
            'role_id'=>'required',
            // 'subject_id'=>'required',
            // 'desi'=>'required',
        ]);

        $code = rand(000000,999999);
        
    	$data = new User();
    	$data->role_id = $request->role_id;
        $data->name = $request->name;
    	$data->email = $request->email;
    	$data->mobile = $request->mobile;
        // $data->subject_id = $request->subject_id;
        // $data->desi_id = $request->desi_id;
        $data->password = Hash::make($code);
    	$data->code = $code;
    	$data->save();

    	return redirect()->route('admin.teacher.view')->with('success','Librarian Created Successfully');
    }
        
        public function edit($id){
            $editdata = User::find($id);
            $roles = Role::get();
            return view('admin.teacher.edit-teacher',compact('editdata','roles'));

        }
        public function update(Request $request,$id){


             $this->validate($request,[
            'name'=>'required',
            'email'=>'required',
            'mobile'=>'required',
            'role_id'=>'required',
        ]);
             $this->validate($request,[
            'name'=>'required',
            'email'=>'required',
            'mobile'=>'required',
            'role_id'=>'required',
            // 'subject_id'=>'required',
            // 'desi'=>'required',
        ]);
            $data = User::find($id);
         $data->role_id = $request->role_id;
        $data->name = $request->name;
        $data->email = $request->email;
        //  $data->subject_id = $request->subject_id;
        // $data->desi_id = $request->desi_id;
         $data->mobile = $request->mobile;
        $data->save();

        return redirect()->route('admin.teacher.view')->with('success','Librarian Updated Successfully');

        }

          public function inactive($id){
            $user = User::find($id);
            $user->status = 0;
            $user->save();
           return redirect()->route('admin.teacher.view')->with('success','Librarian Inactive Successfully');
        }

        public function active($id){
            $user = User::find($id);
            $user->status = 1;
            $user->save();
          return redirect()->route('admin.teacher.view')->with('success','Librarian Active Successfully');
        } 

          public function delete($id){
            $teacher = User::find($id);

          if (file_exists('public/upload/teacherimage/' . $teacher->image) AND !
            empty($teacher->image)){
               unlink('public/upload/teacherimage/' . $teacher->image);
       }
            $teacher->delete();
            return redirect()->route('admin.teacher.view')->with('success','Librarian Deleted Successfully');
          }  


        public function userwisebook(Request $request){
      $data['allbooks'] = IssueBook::where('created_by',$request->user_id)->get();
      return view('admin.user.user-allbook',$data);
      
    }

         
}


