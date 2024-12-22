<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

     public function category(){
        return $this->belongsTo(Category::class, 'category_id', 'id');
      }

    public function user(){
        return $this->belongsTo(User::class, 'created_by', 'id');
      }

      public function update_user(){
        return $this->belongsTo(User::class, 'updated_by', 'id');
      }

      public function class_name(){
        return $this->belongsTo(StudentClass::class, 'class_id', 'id');
      }
}
