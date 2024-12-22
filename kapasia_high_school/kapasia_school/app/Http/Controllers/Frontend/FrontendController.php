<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Principal;
use App\Models\Campus;
use App\Models\Admission;
use App\Models\Paper;
use App\Models\St;
use App\Models\Resource;
use App\Models\Academic;
use App\Models\Course;
use App\Models\Video;
use App\Models\Photo;
use App\Models\Contact;
use App\Models\Slider;
use App\Models\Setting;
use Illuminate\Support\Str;
use WithPagination;
class FrontendController extends Controller
{

    protected $paginationTheme = 'bootstrap';
    
    public function index(){
        $data['principals'] = Principal::all();
        $data['slides'] = Post::where('status',1)->orderBy('post_date','DESC')->limit(3)->get();
        $data['posts'] = Post::where('status',1)->orderBy('post_date','DESC')->limit(5)->get();
        $data['videos'] = Video::where('status',1)->orderBy('id','DESC')->limit(3)->get();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        return View('frontend.layouts.home',$data);
    }


     public function PostDetails($id){

        $data['principals'] = Principal::all();
        $data['post'] = Post::find($id);
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
    return View('frontend.single.post.post-details',$data);
    }

     public function principal_details($id){
        $data['principals'] = Principal::all();
        $data['principal'] = Principal::findorfail($id);
        $data['post'] = Post::find($id);
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
    return View('frontend.single.principal.principal-details',$data);
    }
// =========All Notice============
    public function allNotice(){
        $data['principals'] = Principal::all();
        $data['allposts'] = Post::where('status',1)->orderBy('post_date','DESC')->paginate(10);
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
    return View('frontend.single.post.all-posts',$data);
    }

    // =========recentNotice============
    public function recentNotice(){
        $data['principals'] = Principal::all();
        $data['recents'] = Post::where('status',1)->orderBy('post_date','DESC')->paginate(10);
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
    return View('frontend.single.post.recent-notice',$data);
    }
     public function admissionNotice(){
        $data['principals'] = Principal::all();
        $data['admissions'] = Post::where('status',1)->where('category_id',1)->orderBy('post_date','DESC')->paginate(10);
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
    return View('frontend.single.post.admission-notice',$data);
    }

     public function examNotice(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['exams'] = Post::where('status',1)->where('category_id',2)->orderBy('post_date','DESC')->paginate(10);
    return View('frontend.single.post.exam-notice',$data);
    }

      public function resultNotice(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['results'] = Post::where('status',1)->where('category_id',3)->orderBy('post_date','DESC')->paginate(10);
    return View('frontend.single.post.result-notice',$data);
    }

      public function eventNotice(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['events'] = Post::where('status',1)->where('category_id',4)->orderBy('post_date','DESC')->paginate(10);
    return View('frontend.single.post.event-notice',$data);
    }

      public function adminNotice(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['admins'] = Post::where('status',1)->where('category_id',5)->orderBy('post_date','DESC')->paginate(10);
    return View('frontend.single.post.admin-notice',$data);
    }

      public function nationalNotice(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['nationals'] = Post::where('status',1)->where('category_id',6)->orderBy('post_date','DESC')->paginate(10);
    return View('frontend.single.post.national-notice',$data);
    }

      public function sportNotice(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['sports'] = Post::where('status',1)->where('category_id',7)->orderBy('post_date','DESC')->paginate(10);
    return View('frontend.single.post.sport-notice',$data);
    }

      public function schollarNotice(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['schollars'] = Post::where('status',1)->where('category_id',8)->orderBy('post_date','DESC')->paginate(10);
    return View('frontend.single.post.schollar-notice',$data);
    }

    public function stipendNotice(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['stipends'] = Post::where('status',1)->where('category_id',9)->orderBy('post_date','DESC')->paginate(10);
    return View('frontend.single.post.stipend-notice',$data);
    }

    // =========Campus============


    public function about(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['campus'] = Campus::first();
    return View('frontend.single.campus.about',$data);
    }

     public function history(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['campus'] = Campus::first();
    return View('frontend.single.campus.history',$data);
    }
     public function mission(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['campus'] = Campus::first();
    return View('frontend.single.campus.mission',$data);
    } public function structure(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['campus'] = Campus::first();
    return View('frontend.single.campus.structure',$data);
    }
     public function infrastructure(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['campus'] = Campus::first();
    return View('frontend.single.campus.infrastructure',$data);

    } public function purification(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['campus'] = Campus::first();
    return View('frontend.single.campus.purification',$data);
    }


       // =========Admission============

    public function admissionSystem(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['admission'] = Admission::first();
    return View('frontend.single.admission.admission-system',$data);
    }

     public function admissionExam(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['admission'] = Admission::first();
    return View('frontend.single.admission.admission-exam',$data);
    }
     public function admissionRules(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['admission'] = Admission::first();
    return View('frontend.single.admission.admission-rules',$data);
    } 

    public function registration(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['admission'] = Admission::first();
    return View('frontend.single.admission.registration',$data);
    }
     public function curricullam(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['admission'] = Admission::first();
    return View('frontend.single.admission.curricullam',$data);

    } public function semister(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['admission'] = Admission::first();
    return View('frontend.single.admission.semister',$data);
    }


     // =========Academic============

    public function founder(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['academic'] = Academic::first();
    return View('frontend.single.academic.founder',$data);
    }

     public function principal(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['academic'] = Academic::first();
    return View('frontend.single.academic.principal',$data);
    }
     public function vicePrincipal(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['academic'] = Academic::first();
    return View('frontend.single.academic.vice-principal',$data);
    } 

    public function teacher(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['academic'] = Academic::first();
    return View('frontend.single.academic.teacher',$data);
    }
     public function office(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['academic'] = Academic::first();
    return View('frontend.single.academic.office',$data);

    } public function stuff(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['academic'] = Academic::first();
    return View('frontend.single.academic.stuff',$data);
    }


      // =========Academic Paper============

    public function classRoutine(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['paper'] = Paper::first();
    return View('frontend.single.paper.class-routine',$data);
    }

     public function onlineClassRoutine(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['paper'] = Paper::first();
    return View('frontend.single.paper.online-class-routine',$data);
    }
     public function academicSyllabus(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['paper'] = Paper::first();
    return View('frontend.single.paper.academic-syllabus',$data);
    } 
    public function examRoutine(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['paper'] = Paper::first();
    return View('frontend.single.paper.exam-routine',$data);
    }
     public function calendar(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['paper'] = Paper::first();
    return View('frontend.single.paper.calendar',$data);

    } public function prospectus(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['paper'] = Paper::first();
    return View('frontend.single.paper.prospectus',$data);
    }


    // =========Students============

    public function tution(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['student'] = St::first();
    return View('frontend.single.student.tution',$data);
    }

     public function uniform(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['student'] = St::first();
    return View('frontend.single.student.uniform',$data);
    }
     public function studentRules(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['student'] = St::first();
    return View('frontend.single.student.student-rules',$data);
    } 
    public function examManage(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['student'] = St::first();
    return View('frontend.single.student.exam-manage',$data);
    }
     public function ourStudent(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['student'] = St::first();
    return View('frontend.single.student.our-student',$data);

    } public function studentSuccess(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['student'] = St::first();
    return View('frontend.single.student.student-success',$data);
    }


    // =========Resource============

    public function classContent(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['resource'] = Resource::first();
    return View('frontend.single.resource.class-content',$data);
    }

     public function library(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['resource'] = Resource::first();
    return View('frontend.single.resource.library',$data);
    }
     public function labrotory(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['resource'] = Resource::first();
    return View('frontend.single.resource.labrotory',$data);
    } 
    public function sportsYard(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['resource'] = Resource::first();
    return View('frontend.single.resource.sports-yard',$data);
    }
     public function coEducation(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['resource'] = Resource::first();
    return View('frontend.single.resource.co-education',$data);

   }


    // =========Course============

    public function kg(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['course'] = Course::first();
    return View('frontend.single.course.kg',$data);
    }

     public function primary(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['course'] = Course::first();
    return View('frontend.single.course.primary',$data);
    }

    public function high(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['course'] = Course::first();
    return View('frontend.single.course.high',$data);
    }

    public function hsc(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['course'] = Course::first();
    return View('frontend.single.course.hsc',$data);
    }

     public function degree(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['course'] = Course::first();
    return View('frontend.single.course.degree',$data);
    }
     public function honours(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['course'] = Course::first();
    return View('frontend.single.course.honours',$data);
    } 

     public function photoGallery(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['photos'] = Photo::where('status',1)->orderBy('id','DESC')->paginate(10);
    return View('frontend.single.gallery.photo-gallery',$data);
    } 

      public function videoGallery(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['videos'] = video::where('status',1)->orderBy('id','DESC')->paginate(12);
    return View('frontend.single.gallery.video-gallery',$data);
    } 

     public function contact(){
        $data['principals'] = Principal::all();
        $data['sliders'] = Slider::where('status',1)->orderBy('id','asc')->limit(5)->get();
        $data['setting'] = Setting::where('status',1)->first();
        $data['contact'] = Contact::first();
    return View('frontend.single.post.contact-view',$data);
    } 


   
  


}
