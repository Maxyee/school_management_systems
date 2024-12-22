<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', [App\Http\Controllers\Frontend\FrontendController::class, 'index'])->name('public');

Route::get('/notice-details/{id}', [App\Http\Controllers\Frontend\FrontendController::class, 'postDetails'])->name('post.details');

Route::get('/all-notice', [App\Http\Controllers\Frontend\FrontendController::class, 'allNotice'])->name('all.posts');

Route::get('/contact', [App\Http\Controllers\Frontend\FrontendController::class, 'contact'])->name('contact.view');


Route::get('/recent-notice', [App\Http\Controllers\Frontend\FrontendController::class, 'recentNotice'])->name('recent.notice');
Route::get('/admission-notice', [App\Http\Controllers\Frontend\FrontendController::class, 'admissionNotice'])->name('admission.notice');
Route::get('/exam-notice', [App\Http\Controllers\Frontend\FrontendController::class, 'examNotice'])->name('exam.notice');
Route::get('/result-notice', [App\Http\Controllers\Frontend\FrontendController::class, 'resultNotice'])->name('result.notice');
Route::get('/event-notice', [App\Http\Controllers\Frontend\FrontendController::class, 'eventNotice'])->name('event.notice');
Route::get('/admin-notice', [App\Http\Controllers\Frontend\FrontendController::class, 'adminNotice'])->name('admin.notice');
Route::get('/national-notice', [App\Http\Controllers\Frontend\FrontendController::class, 'nationalNotice'])->name('national.notice');
Route::get('/sport-notice', [App\Http\Controllers\Frontend\FrontendController::class, 'sportNotice'])->name('sport.notice');
Route::get('/schollar-notice', [App\Http\Controllers\Frontend\FrontendController::class, 'schollarNotice'])->name('schollar.notice');
Route::get('/stipend-notice', [App\Http\Controllers\Frontend\FrontendController::class, 'stipendNotice'])->name('stipend.notice');

// ============Campus===============
Route::get('/about', [App\Http\Controllers\Frontend\FrontendController::class, 'about'])->name('about');
Route::get('/history', [App\Http\Controllers\Frontend\FrontendController::class, 'history'])->name('history');
Route::get('/mission', [App\Http\Controllers\Frontend\FrontendController::class, 'mission'])->name('mission');
Route::get('/structure', [App\Http\Controllers\Frontend\FrontendController::class, 'structure'])->name('structure');
Route::get('/infrastructure', [App\Http\Controllers\Frontend\FrontendController::class, 'infrastructure'])->name('infrastructure');
Route::get('/purification', [App\Http\Controllers\Frontend\FrontendController::class, 'purification'])->name('purification');


// ============Admission===============
Route::get('/admission-apply-system', [App\Http\Controllers\Frontend\FrontendController::class, 'admissionSystem'])->name('admission.system');
Route::get('/admission-exam', [App\Http\Controllers\Frontend\FrontendController::class, 'admissionExam'])->name('admission.exam');
Route::get('/admission-rules', [App\Http\Controllers\Frontend\FrontendController::class, 'admissionRules'])->name('admission.rules');
Route::get('/registration', [App\Http\Controllers\Frontend\FrontendController::class, 'registration'])->name('registration');
Route::get('/curricullam', [App\Http\Controllers\Frontend\FrontendController::class, 'curricullam'])->name('curricullam');
Route::get('/semister', [App\Http\Controllers\Frontend\FrontendController::class, 'semister'])->name('semister');
 
// ============Academic===============
Route::get('/founder', [App\Http\Controllers\Frontend\FrontendController::class, 'founder'])->name('founder');
Route::get('/principal', [App\Http\Controllers\Frontend\FrontendController::class, 'principal'])->name('principal');
Route::get('/principal-details/{id}', [App\Http\Controllers\Frontend\FrontendController::class, 'principal_details'])->name('principal.details');
Route::get('/vice-principal', [App\Http\Controllers\Frontend\FrontendController::class, 'vicePrincipal'])->name('vice-principal');
Route::get('/teacher', [App\Http\Controllers\Frontend\FrontendController::class, 'teacher'])->name('teacher');
Route::get('/office', [App\Http\Controllers\Frontend\FrontendController::class, 'office'])->name('office');
Route::get('/stuff', [App\Http\Controllers\Frontend\FrontendController::class, 'stuff'])->name('stuff');

// ============Academic Paper===============
Route::get('/class-routine', [App\Http\Controllers\Frontend\FrontendController::class, 'classRoutine'])->name('class-routine');
Route::get('/online-class-routine', [App\Http\Controllers\Frontend\FrontendController::class, 'onlineClassRoutine'])->name('online-class-routine');
Route::get('/exam-routine', [App\Http\Controllers\Frontend\FrontendController::class, 'examRoutine'])->name('exam-routine');
Route::get('/academic-syllabus', [App\Http\Controllers\Frontend\FrontendController::class, 'academicSyllabus'])->name('academic-syllabus');
Route::get('/calendar', [App\Http\Controllers\Frontend\FrontendController::class, 'calendar'])->name('calendar');
Route::get('/prospectus', [App\Http\Controllers\Frontend\FrontendController::class, 'prospectus'])->name('prospectus');


// ============Student===============
Route::get('/tution', [App\Http\Controllers\Frontend\FrontendController::class, 'tution'])->name('tution');
Route::get('/uniform', [App\Http\Controllers\Frontend\FrontendController::class, 'uniform'])->name('uniform');
Route::get('/exam-manage', [App\Http\Controllers\Frontend\FrontendController::class, 'examManage'])->name('exam-manage');
Route::get('/student-rules', [App\Http\Controllers\Frontend\FrontendController::class, 'studentRules'])->name('student-rules');
Route::get('/our-student', [App\Http\Controllers\Frontend\FrontendController::class, 'ourStudent'])->name('our-student');
Route::get('/student-success', [App\Http\Controllers\Frontend\FrontendController::class, 'studentSuccess'])->name('student-success');


// ============Resource===============
Route::get('/class-content', [App\Http\Controllers\Frontend\FrontendController::class, 'classContent'])->name('class-content');
Route::get('/library', [App\Http\Controllers\Frontend\FrontendController::class, 'library'])->name('library');
Route::get('/labrotory', [App\Http\Controllers\Frontend\FrontendController::class, 'labrotory'])->name('labrotory');
Route::get('/sports-yard', [App\Http\Controllers\Frontend\FrontendController::class, 'sportsYard'])->name('sports-yard');
Route::get('/co-education', [App\Http\Controllers\Frontend\FrontendController::class, 'coEducation'])->name('co-education');


// ============Course===============

Route::get('/kg', [App\Http\Controllers\Frontend\FrontendController::class, 'kg'])->name('kg');
Route::get('/primary', [App\Http\Controllers\Frontend\FrontendController::class, 'primary'])->name('primary');
Route::get('/high', [App\Http\Controllers\Frontend\FrontendController::class, 'high'])->name('high');
Route::get('/hsc', [App\Http\Controllers\Frontend\FrontendController::class, 'hsc'])->name('hsc');
Route::get('/degree', [App\Http\Controllers\Frontend\FrontendController::class, 'degree'])->name('degree');
Route::get('/honours', [App\Http\Controllers\Frontend\FrontendController::class, 'honours'])->name('honours');

Route::get('/photo-gallery', [App\Http\Controllers\Frontend\FrontendController::class, 'photoGallery'])->name('photo.gallery');
Route::get('/video-gallery', [App\Http\Controllers\Frontend\FrontendController::class, 'videoGallery'])->name('video.gallery');






// ///////////////////Admin Section ////////////////

Route::group(['prefix'=>'admin','middleware'=>['admin','auth'],'namespace'=>'admin'],function(){ 
    Route::get('dashboard',[App\Http\Controllers\admin\AdminDashboardController::class,'index'])->name('admin.dashboard');

    // Profile

   // =====================Profile Section============
        Route::get('profile-view',[App\Http\Controllers\admin\AdminProfileController::class,'view'])->name('admin.profiles.view');
    Route::post('profile-update',[App\Http\Controllers\admin\AdminProfileController::class,'update'])->name('admin.profiles.update');
    Route::post('password/update',[App\Http\Controllers\admin\AdminProfileController::class,'passwordupdate'])->name('admin.profiles.password.update');

      // ===================teacher Section============
    
    Route::get('teacher/view',[App\Http\Controllers\admin\TeacherController::class,'view'])->name('admin.teacher.view');
    Route::post('teacher-store',[App\Http\Controllers\admin\TeacherController::class,'store'])->name('admin.teacher.store');
    Route::post('teacher-update/{id}',[App\Http\Controllers\admin\TeacherController::class,'update'])->name('admin.teacher.update');
    Route::get('teacher-active/{id}',[App\Http\Controllers\admin\TeacherController::class,'active'])->name('admin.teacher.active');
    Route::get('teacherr-inactive/{id}',[App\Http\Controllers\admin\TeacherController::class,'inactive'])->name('admin.teacher.inactive');
    Route::get('teacher-delete/{id}',[App\Http\Controllers\admin\TeacherController::class,'delete'])->name('admin.teacher.delete');
    

// ===================Student Section===============
     Route::get('student/view',[App\Http\Controllers\admin\StudentController::class,'view'])->name('admin.student.view');
    Route::post('student-store',[App\Http\Controllers\admin\StudentController::class,'store'])->name('admin.student.store');
    Route::post('student-update/{id}',[App\Http\Controllers\admin\StudentController::class,'update'])->name('admin.student.update');
    Route::get('student-active/{id}',[App\Http\Controllers\admin\StudentController::class,'active'])->name('admin.student.active');
    Route::get('studentr-inactive/{id}',[App\Http\Controllers\admin\StudentController::class,'inactive'])->name('admin.student.inactive');
    Route::get('student-delete/{id}',[App\Http\Controllers\admin\StudentController::class,'delete'])->name('admin.student.delete');
    Route::get('user/allbook/view',[App\Http\Controllers\admin\StudentController::class,'userwisebook'])->name('admin.student.allbook-view');


    // ==============Category Section==============

    Route::get('category/view',[App\Http\Controllers\admin\CategoryController::class,'view'])->name('admin.category.view');
    Route::post('category/store',[App\Http\Controllers\admin\CategoryController::class,'store'])->name('admin.category.store');
Route::post('category/update/{id}',[App\Http\Controllers\admin\CategoryController::class,'update'])->name('admin.category.update');
Route::get('category-active/{id}',[App\Http\Controllers\admin\CategoryController::class,'active'])->name('admin.category.active');
    Route::get('category-inactive/{id}',[App\Http\Controllers\admin\CategoryController::class,'inactive'])->name('admin.category.inactive');
Route::get('category/delete/{id}',[App\Http\Controllers\admin\CategoryController::class,'delete'])->name('admin.category.delete');

 // ===================Student Section===============
     Route::get('student/class/view',[App\Http\Controllers\admin\StudentClassController::class,'view'])->name('admin.studentclass.view');
Route::post('student/class/store',[App\Http\Controllers\admin\StudentClassController::class,'store'])->name('admin.studentclass.store');
Route::post('student/class/update/{id}',[App\Http\Controllers\admin\StudentClassController::class,'update'])->name('admin.studentclass.update');
Route::get('student/class-active/{id}',[App\Http\Controllers\admin\StudentClassController::class,'active'])->name('admin.studentclass.active');
    Route::get('student class-inactive/{id}',[App\Http\Controllers\admin\StudentClassController::class,'inactive'])->name('admin.studentclass.inactive');
Route::get('student/class/delete/{id}',[App\Http\Controllers\admin\StudentClassController::class,'delete'])->name('admin.studentclass.delete');

    // ===================Student Post===============
     Route::get('post/view',[App\Http\Controllers\admin\PostController::class,'view'])->name('admin.post.view');
      Route::post('post/store',[App\Http\Controllers\admin\PostController::class,'store'])->name('admin.post.store');
Route::post('post/update/{id}',[App\Http\Controllers\admin\PostController::class,'update'])->name('admin.post.update');
Route::get('post-active/{id}',[App\Http\Controllers\admin\PostController::class,'active'])->name('admin.post.active');
    Route::get('post-inactive/{id}',[App\Http\Controllers\admin\PostController::class,'inactive'])->name('admin.post.inactive');
Route::get('post/delete/{id}',[App\Http\Controllers\admin\PostController::class,'delete'])->name('admin.post.delete');

// ===================Campus===============
        Route::get('campus/view',[App\Http\Controllers\admin\CampusController::class,'view'])->name('admin.campus.view');
      Route::post('campus/store',[App\Http\Controllers\admin\CampusController::class,'store'])->name('admin.campus.store');
Route::post('campus/update/{id}',[App\Http\Controllers\admin\CampusController::class,'update'])->name('admin.campus.update');

// ===================Academic===============
        Route::get('academic/view',[App\Http\Controllers\admin\AcademicController::class,'view'])->name('admin.academic.view');
      Route::post('academic/store',[App\Http\Controllers\admin\AcademicController::class,'store'])->name('admin.academic.store');
Route::post('academic/update/{id}',[App\Http\Controllers\admin\AcademicController::class,'update'])->name('admin.academic.update');

// ===================Admission===============
        Route::get('admission/view',[App\Http\Controllers\admin\AdmissionController::class,'view'])->name('admin.admission.view');
      Route::post('admission/store',[App\Http\Controllers\admin\AdmissionController::class,'store'])->name('admin.admission.store');
Route::post('admission/update/{id}',[App\Http\Controllers\admin\AdmissionController::class,'update'])->name('admin.admission.update');

// ===================Paper===============
        Route::get('paper/view',[App\Http\Controllers\admin\PaperController::class,'view'])->name('admin.paper.view');
      Route::post('paper/store',[App\Http\Controllers\admin\PaperController::class,'store'])->name('admin.paper.store');
Route::post('paper/update/{id}',[App\Http\Controllers\admin\PaperController::class,'update'])->name('admin.paper.update');

// ===================Principal===============
        Route::get('principal/view',[App\Http\Controllers\admin\PrincipalController::class,'view'])->name('admin.principal.view');
      Route::post('principal/store',[App\Http\Controllers\admin\PrincipalController::class,'store'])->name('admin.principal.store');
Route::post('principal/update/{id}',[App\Http\Controllers\admin\PrincipalController::class,'update'])->name('admin.principal.update');
Route::get('principal/delete/{id}',[App\Http\Controllers\admin\PrincipalController::class,'delete'])->name('admin.principal.delete');


// ===================ST===============
        Route::get('st/view',[App\Http\Controllers\admin\StController::class,'view'])->name('admin.st.view');
      Route::post('st/store',[App\Http\Controllers\admin\StController::class,'store'])->name('admin.st.store');
Route::post('st/update/{id}',[App\Http\Controllers\admin\StController::class,'update'])->name('admin.st.update');


// ===================ST===============
        Route::get('resource/view',[App\Http\Controllers\admin\ResourceController::class,'view'])->name('admin.resource.view');
      Route::post('resource/store',[App\Http\Controllers\admin\ResourceController::class,'store'])->name('admin.resource.store');
Route::post('resource/update/{id}',[App\Http\Controllers\admin\ResourceController::class,'update'])->name('admin.resource.update');


// ===================Course===============
        Route::get('course/view',[App\Http\Controllers\admin\CourseController::class,'view'])->name('admin.course.view');
      Route::post('course/store',[App\Http\Controllers\admin\CourseController::class,'store'])->name('admin.course.store');
Route::post('course/update/{id}',[App\Http\Controllers\admin\CourseController::class,'update'])->name('admin.course.update');

// ============Photo===============

Route::get('/photo-gallery/view', [App\Http\Controllers\admin\PhotoController::class, 'view'])->name('admin.photo.view');
Route::post('/photo-gallery/store', [App\Http\Controllers\admin\PhotoController::class, 'store'])->name('admin.photo.store');
Route::post('/photo-gallery/update/{id}', [App\Http\Controllers\admin\PhotoController::class, 'update'])->name('admin.photo.update');
Route::get('/photo-gallery/active/{id}', [App\Http\Controllers\admin\PhotoController::class, 'active'])->name('admin.photo.active');
Route::get('/photo-gallery/inactive/{id}', [App\Http\Controllers\admin\PhotoController::class, 'inactive'])->name('admin.photo.inactive');
Route::get('/photo-gallery/delete/{id}', [App\Http\Controllers\admin\PhotoController::class, 'delete'])->name('admin.photo.delete');

// ============video===============

Route::get('/video-gallery/view', [App\Http\Controllers\admin\VideoController::class, 'view'])->name('admin.video.view');
Route::post('/video-gallery/store', [App\Http\Controllers\admin\VideoController::class, 'store'])->name('admin.video.store');
Route::post('/video-gallery/update/{id}', [App\Http\Controllers\admin\VideoController::class, 'update'])->name('admin.video.update');
Route::get('/video-gallery/active/{id}', [App\Http\Controllers\admin\VideoController::class, 'active'])->name('admin.video.active');
Route::get('/video-gallery/inactive/{id}', [App\Http\Controllers\admin\VideoController::class, 'inactive'])->name('admin.video.inactive');
Route::get('/video-gallery/delete/{id}', [App\Http\Controllers\admin\VideoController::class, 'delete'])->name('admin.video.delete');

 // ===================teacher Section============
    
    Route::get('contact/view',[App\Http\Controllers\admin\ContactController::class,'view'])->name('admin.contact.view');
    Route::post('contact-update/{id}',[App\Http\Controllers\admin\ContactController::class,'update'])->name('admin.contact.update');

    // ===================Course===============
        Route::get('slider/view',[App\Http\Controllers\admin\SliderController::class,'view'])->name('admin.slider.view');
      Route::post('slider/store',[App\Http\Controllers\admin\SliderController::class,'store'])->name('admin.slider.store');
Route::post('slider/update/{id}',[App\Http\Controllers\admin\SliderController::class,'update'])->name('admin.slider.update');
Route::get('/slider/active/{id}', [App\Http\Controllers\admin\SliderController::class, 'active'])->name('admin.slider.active');
Route::get('/slider/inactive/{id}', [App\Http\Controllers\admin\SliderController::class, 'inactive'])->name('admin.slider.inactive');
Route::get('/slider/delete/{id}', [App\Http\Controllers\admin\SliderController::class, 'delete'])->name('admin.slider.delete');

   // ===================Setting===============
        Route::get('setting/view',[App\Http\Controllers\admin\SettingController::class,'view'])->name('admin.setting.view');
      Route::post('setting/store',[App\Http\Controllers\admin\SettingController::class,'store'])->name('admin.setting.store');
Route::post('setting/update/{id}',[App\Http\Controllers\admin\SettingController::class,'update'])->name('admin.setting.update');
Route::get('/setting/active/{id}', [App\Http\Controllers\admin\SettingController::class, 'active'])->name('admin.setting.active');
Route::get('/setting/inactive/{id}', [App\Http\Controllers\admin\SettingController::class, 'inactive'])->name('admin.setting.inactive');
Route::get('/setting/delete/{id}', [App\Http\Controllers\admin\SettingController::class, 'delete'])->name('admin.setting.delete');
    

});
     // ///////////////////Teacher Section ////////////////

Route::group(['prefix'=>'teacher','middleware'=>['teacher','auth'],'namespace'=>'teacher'],function(){ 
    Route::get('dashboard',[App\Http\Controllers\teacher\TeacherDashboardController::class,'index'])->name('teacher.dashboard');
    // =====================Profile Section============
        Route::get('/profile-view',[App\Http\Controllers\teacher\TeacherProfileController::class,'view'])->name('teacher.profiles.view');
    Route::post('/profile-update',[App\Http\Controllers\teacher\TeacherProfileController::class,'update'])->name('teacher.profiles.update');
    Route::post('/password/update',[App\Http\Controllers\teacher\TeacherProfileController::class,'passwordupdate'])->name('teacher.profiles.password.update');

    // ===================Student Section===============
     Route::get('/student-view',[App\Http\Controllers\teacher\StudentController::class,'view'])->name('teacher.student.view');

   
});

     // ///////////////////Teacher Section ////////////////

Route::group(['prefix'=>'student','middleware'=>['student','auth'],'namespace'=>'student'],function(){ 
    Route::get('dashboard',[App\Http\Controllers\Student\StudentDashboardController::class,'index'])->name('student.dashboard');
    // =====================Profile Section============
        Route::get('/profile-view',[App\Http\Controllers\student\StudentProfileController::class,'view'])->name('student.profiles.view');
    Route::post('/profile-update',[App\Http\Controllers\student\StudentProfileController::class,'update'])->name('student.profiles.update');
    Route::post('/password/update',[App\Http\Controllers\student\StudentProfileController::class,'passwordupdate'])->name('student.profiles.password.update');



});


// ///////////////////User Section ////////////////

Route::group(['prefix'=>'user','middleware'=>['user','auth'],'namespace'=>'user'],function(){ 
    Route::get('user/dashboard',[App\Http\Controllers\User\UserDashboardController::class,'index'])->name('user.dashboard');
      Route::get('profile',[App\Http\Controllers\User\UserDashboardController::class,'profile'])->name('user.profile');
    Route::post('update/profile',[App\Http\Controllers\User\UserDashboardController::class,'profileupdate'])->name('user.profile.update');
     Route::post('update/password',[App\Http\Controllers\User\UserDashboardController::class,'passwordupdate'])->name('user.password.update');

});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');