<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\UserDetails;


class UserController extends Controller
{


    public function index()
    {
        return UserDetails::orderBy('created_at', 'DESC')->get();
    }

    public function store(Request $request)
    {
        $detail = new UserDetails();
        $detail->user_id = $request->detail['user_id'];
        $detail->fname = $request->detail['fname'];
        $detail->lname = $request->detail['lname'];
        $detail->bdate = $request->detail['bdate'];
        $detail->sex = $request->detail['sex'];
        $detail->status = $request->detail['status'];
        $detail->save();

        return $detail;
    }

    public function show($id)
    {
        $detail = UserDetails::find($id);
        return $detail;
    }

    public function update(Request $request, $id)
    {

        $existingDetail = UserDetails::find($id);

        if($existingDetail){
            $existingDetail->user_id = $request->detail['user_id'];
            $existingDetail->fname = $request->detail['fname'];
            $existingDetail->lname = $request->detail['lname'];
            $existingDetail->bdate = $request->detail['bdate'];
            $existingDetail->sex = $request->detail['sex'];
            $existingDetail->status = $request->detail['status'];
            $existingDetail->save();

            return $existingDetail;
        }

        return "Details not found";

    }


    public function destroy($id)
    {
        $detail = UserDetails::find($id);

        if($detail){
            $detail->delete();
            return "Details successfully deleted.";
        }
        return "Details not found";
    }

    public function fetchUsers(){
        $users = User::all();
        return $users;
    }

    public function fetchLiked($user_id){
        $user = User::find($user_id);
        return $user->likedPokemons;
    }
    public function fetchHated($user_id){
        $user = User::find($user_id);
        return $user->hatedPokemons;
    }
}
