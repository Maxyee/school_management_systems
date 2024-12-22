<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Auth;
use App\Models\User;
use Str;
use Toastr;
class CategoryController extends Controller
{
   public function view(){
        $data['alldata'] = Category::all();
    return view('admin.category.view-category',$data);
    }
    
   
    
     public function store(Request $request){
        $this->validate($request,[
            'category_name'=>'required|unique:categories,category_name'

        ]);

        $data = new Category();
        $data->category_name = $request->category_name;
        $data->category_slug = Str:: slug($request->category_name);
        $data->created_by = Auth::user()->id;
        $data->save();

         Toastr::success('Category Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = Category::find($id);
             $this->validate($request,[
            'category_name'=>'required|unique:categories,category_name,'.$data->id
        ]);

        $data->category_name = $request->category_name;
        $data->category_slug = Str:: slug($request->category_name);
        $data->updated_by = Auth::user()->id;
        $data->save();

   Toastr::success('Category Updated Successfully','success');
        return back();

    }

    public function inactive($id){
            $category = Category::find($id);
            $category->status = 0;
            $category->save();
           Toastr::success('Category Inactive Successfully','success');
        return back();
        }

        public function active($id){
            $category = Category::find($id);
            $category->status = 1;
            $category->save();
          Toastr::success('Category Active Successfully','success');
        return back();
        } 

          public function delete(Request $request){
            $data = Category::find($request->id); 
             $data->delete();
           Toastr::success('Category Deleted Successfully','success');
        return back();


     }  
}
