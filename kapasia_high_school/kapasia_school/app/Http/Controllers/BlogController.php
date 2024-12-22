<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Blog;
class BlogController extends Controller
{

        public function blogs()
    {
        $blogs = Blog::all();

        return response()->json(['blogs'=>$blogs],200);
             // return new PostCollection(Post::orderBy('id','DESC')->paginate(10));
       
    }
}
