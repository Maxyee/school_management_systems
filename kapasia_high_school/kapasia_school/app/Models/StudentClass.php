<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentClass extends Model
{
    use HasFactory;

    public function user(){
        return $this->belongsTo(User::class, 'created_by', 'id');
      }

      public function update_user(){
        return $this->belongsTo(User::class, 'updated_by', 'id');
      }
}
