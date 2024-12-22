<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Model\Role;
use Auth;
use App\Models\Post;
use App\Models\StudentClass;
use App\Models\Category;
use Str;
use Toastr;
use App\Http\Resources\PostCollection;
use App\Http\Resources\PostResource;
class PostController extends Controller
{
    public function view(){
        $data['alldata'] = Post::all();
        $data['categories'] = Category::all();
        $data['classes'] = StudentClass::all();
    return view('admin.post.view-post',$data);
    }

        public function posts()
    {
        $posts = Post::all();

        // return response()->json(['posts'=>$posts],200);
             return new PostCollection(Post::orderBy('id','DESC')->paginate(10));
       
    }
    
   
    
     public function store(Request $request){
        $this->validate($request,[
            'title'=>'required|unique:posts,title',
            'post_file'=>'required|mimes:jpeg,jpg,pdf|max:20480',
            'class_id'=>'required',
            'class_id'=>'required',


        ]);

        $data = new Post();
        $data->class_id = $request->class_id;
        $data->category_id = $request->category_id;
        $data->title = $request->title;
        $data->post_date = $request->post_date;
        $data->description = $request->description;
        $data->post_slug = Str:: slug($request->title);
        $data->created_by = Auth::user()->id;

        // if ($request->file('image')){
        //   $file = $request->file('image');
        //     // @unlink(public_path('upload/logoimage/'.$data->image));
        //   $filename =date('YmdH').$file->getClientOriginalName();
        //   $file->move(public_path('upload/postimage'), $filename);
        //   $data['image'] = $filename;
        // }

        if ($request->file('post_file')){
          $file = $request->file('post_file');
          $filename =date('YmdH').$file->getClientOriginalName();
          $file->move(public_path('upload/postfile'), $filename);
          $data['post_file'] = $filename;
        }


        $data->save();

         Toastr::success('Post Added Successfully','success');
        return back();
    }
        
      

        public function update(Request $request,$id){
            $data = Post::find($id);

             $this->validate($request,[
            'title'=>'required',
            'class_id'=>'required',
            'class_id'=>'required',
            'post_file'=>'mimes:jpeg,jpg,pdf|max:20480',
        ]);
        $data->class_id = $request->class_id;
        $data->category_id = $request->category_id;
        $data->title = $request->title;
        $data->post_date = $request->post_date;
        $data->description = $request->description;
        $data->post_slug = Str:: slug($request->title);
        $data->updated_by = Auth::user()->id;
        if ($request->file('post_file')){
          $file = $request->file('post_file');
        @unlink(public_path('upload/postfile/'.$data->post_file));
          $filename =date('YmdH').$file->getClientOriginalName();
          $file->move(public_path('upload/postfile'), $filename);
          $data['post_file'] = $filename;
        }

        $data->save(); 

       

        
        Toastr::success('Post Updated Successfully','success');
        return back();

    }

    public function inactive($id){
            $category = Post::find($id);
            $category->status = 0;
            $category->save();
           Toastr::success('Post Inactive Successfully','success');
        return back();
        }

        public function active($id){
            $category = Post::find($id);
            $category->status = 1;
            $category->save();
          Toastr::success('Post Active Successfully','success');
        return back();
        } 

          public function delete(Request $request){
            $data = Post::find($request->id); 
               if (file_exists('upload/postfile/' . $data->post_file) && !empty($data->post_file)) {
    unlink('upload/postfile/' . $data->post_file);
}

             $data->delete();
           Toastr::success('Post Deleted Successfully','success');
        return back();


     }  
}
