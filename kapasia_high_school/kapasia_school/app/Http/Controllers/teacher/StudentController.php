<?php

namespace App\Http\Controllers\Teacher;

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
    return view('teacher.student.view-student',$data);
    }

    

         
}


