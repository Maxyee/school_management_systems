<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Role;
use Auth;
use Hash;
use App\Models\ClassName;
use App\Models\Group;
use App\Models\Section;
use App\Models\Session;
use App\Models\IssueBook;
use App\Models\Book;
use App\Models\Category;


class StudentController extends Controller
{ 
    public function view(){
    $data['alldata'] = User::where('role_id','3')->get();
    $data['roles'] = Role::get();
    return view('admin.student.view-student',$data);
    }

    // public function userview(){
    // $data['alldata'] = User::where('role_id',3)->get();
    //  $data['roles'] = Role::get();
    // return view('admin.user.view-user',$data);
    // }

    public function add(){
     $roles = Role::get();
    	return view('admin.student.add-student',compact('roles'));
    }
    
     public function store(Request $request){

            $this->validate($request,[
            'name'=>'required',
            'email'=>'required|unique:users,email',
            'mobile'=>'required',
            'role_id'=>'required',
        ]);

        $code = rand(000000,999999);
        
    	$data = new User();
    	$data->role_id = $request->role_id;
        $data->name = $request->name;
    	$data->email = $request->email;
    	$data->mobile = $request->mobile;
        $data->password = Hash::make($code);
    	$data->code = $code;
    	$data->save();

    	return redirect()->route('admin.student.view')->with('success','Librarian Created Successfully');
    }
        
        public function edit($id){
            $editdata = User::find($id);
            $roles = Role::get();
            return view('admin.student.edit-student',compact('editdata','roles'));

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
        ]);
            $data = User::find($id);
         $data->role_id = $request->role_id;
        $data->name = $request->name;
        $data->email = $request->email;
         $data->mobile = $request->mobile;
        $data->save();

        return redirect()->route('admin.student.view')->with('success','Librarian Updated Successfully');

        }

          public function inactive($id){
            $user = User::find($id);
            $user->status = 0;
            $user->save();
           return redirect()->route('admin.student.view')->with('success','Librarian Inactive Successfully');
        }

        public function active($id){
            $user = User::find($id);
            $user->status = 1;
            $user->save();
          return redirect()->route('admin.student.view')->with('success','Librarian Active Successfully');
        } 

          public function delete($id){
            $student = User::find($id);

          if (file_exists('public/upload/studentimage/' . $student->image) AND !
            empty($student->image)){
               unlink('public/upload/studentimage/' . $student->image);
       }
            $student->delete();
            return redirect()->route('admin.student.view')->with('success','Librarian Deleted Successfully');
          }  


        public function userwisebook(Request $request){
      $data['allbooks'] = IssueBook::where('created_by',$request->user_id)->get();
      return view('admin.user.user-allbook',$data);
      
    }

         
}


