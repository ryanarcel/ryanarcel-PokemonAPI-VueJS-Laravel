<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UserDetails;

class UserDetailsController extends Controller
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


        if($detail->save()){
            return $detail;
        }

        return "Could not save.";


    }

    public function show($user_id)
    {
        $detail = UserDetails::where('user_id', $user_id)->get();
        return $detail->first();
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
}
