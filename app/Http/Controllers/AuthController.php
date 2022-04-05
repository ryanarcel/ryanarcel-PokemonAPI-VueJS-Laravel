<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Session;

class AuthController extends Controller
{
    public function index(){
        if(Auth::check()){
            return view('app', ['auth_user' => Auth::user()->email]);
        }
        return view('app', ['auth_user' => 'none']);
    }

    public function register(Request $request)
    {
        try {
            $user = new User();
            $user->username = $request->username;
            $user->email = $request->email;
            $user->password = Hash::make($request->password);
            $user->save();

            $success = true;
            $message = 'User register successfully';
        } catch (\Illuminate\Database\QueryException $ex) {
            $success = false;
            $message = $ex->getMessage();
        }

        // response
        $response = [
            'success' => $success,
            'message' => $message,
        ];
        return response()->json($response);
    }

    /**
     * Login
     */
    public function login(Request $request)
    {
        $credentials = [
            'email' => $request->email,
            'password' => $request->password,
        ];

        // $credentials = $request->only('email', 'password');



        if (Auth::attempt($credentials)) {
            $success = true;
            $message = 'User login successfully';
            $loggedInUser = User::where('email', $request->email)->get();
            $user_id = $loggedInUser->first()->id;

        } else {
            $success = false;
            $message = 'Unauthorized Login';
            $user_id = "none";
        }

        // response
        $response = [
            'success' => $success,
            'message' => $message,
            'user_id' => $user_id
        ];

        return response()->json($response);

    }

    /**
     * Logout
     */
    public function logout()
    {
        try {
            Session::flush();
            $success = true;
            $message = 'Successfully logged out';
        } catch (\Illuminate\Database\QueryException $ex) {
            $success = false;
            $message = $ex->getMessage();
        }

        // response
        $response = [
            'success' => $success,
            'message' => $message,
        ];
        return response()->json($response);
        ///return $redirect()->route('front');
    }
}
