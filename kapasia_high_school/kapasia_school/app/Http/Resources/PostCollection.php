<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class PostCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'data' => $this->collection->transform(function ($post){
         return [
            'id'=> $post->id,
            'title'=> $post->title,
            'category_id'=> $post->category->name,
            'sub_category_id'=> $post->subcategory->name,
            'description'=> $post->description,
            'created_at' => $post->created_at->format('d-M-Y'),
            'file'=> $post->file,
            'image'=> $post->image,
            'video_link'=> $post->video_link,
            'link'=> $post->link,
            'fetured'=> $post->fetured,
            'created_by'=> $post->user->name,
            
                ];
            })
        ];
    }
}
