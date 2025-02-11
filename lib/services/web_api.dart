import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:seting_app/models/request/create_user_request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/all_users_response.dart';
import '../models/login_model_response.dart';
import '../models/user_model.dart';
import '../utils/shared_pref/shared_pref_keys.dart';
import 'network.dart';

class WebConfig {
  static const String baseURL = 'http://15.207.115.155/api';

  static String? accessToken;
  static String? refreshToken;
  static String? userEmail;

  static Future<LoginModelResponse?> signInWithEmail({
    required String emailString,
  }) async {
    final String apiUrl = "$baseURL/user/login";
    print("URL: $apiUrl");

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": emailString}),
      );

      print("Response Body: ${response.body}");
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var loginResponse =
            LoginModelResponse.fromJson(jsonDecode(response.body));

        if (loginResponse.data?.accessToken != null &&
            loginResponse.data?.refreshToken != null) {
          // Store access and refresh tokens
          initializeTokens(
            loginResponse.data!.accessToken!,
            loginResponse.data!.refreshToken!,
          );
        }

        userEmail = emailString; // Store email for future login attempts
        return loginResponse;
      } else {
        return LoginModelResponse(
          success: false,
          code: response.statusCode,
        );
      }
    } catch (e) {
      print("Error occurred in signInWithEmail: $e");
      return null;
    }
  }

  static initializeTokens(
      String initialAccessToken, String initialRefreshToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = initialAccessToken;
    refreshToken = initialRefreshToken;
    // Save tokens to SharedPreferences
    await prefs.setString(
      SharedPrefsKeys.accessToken,
      accessToken ?? '',
    );
    await prefs.setString(
      SharedPrefsKeys.refreshToken,
      refreshToken ?? '',
    );
  }

  // Function to refresh the access token
  static Future<bool> refreshAccessToken() async {
    final response = await http.post(
      Uri.parse('$baseURL/user/refreshToken'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"refreshToken": refreshToken}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      accessToken = data["data"]["accessToken"];
      refreshToken = data["data"]["refreshToken"];
      return true;
    } else {
      return false; // Refresh failed, user needs to log in again
    }
  }

  // Function to handle API requests and retry on token expiration
  static Future<http.Response?> makeRequest(String endpoint) async {
    var url = Uri.parse('$baseURL$endpoint');
    var headers = {'Authorization': 'Bearer $accessToken'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 401) {
      // Token expired
      bool refreshed = await refreshAccessToken();
      if (refreshed) {
        headers['Authorization'] = 'Bearer $accessToken'; // Update token
        response = await http.get(url, headers: headers); // Retry request
      } else {
        return null; // Token refresh failed, user needs to log in again
      }
    }

    return response;
  }

  static Future<dynamic> createUser(CreateUserRequest request) async {
    final String apiUrl = "http://15.207.115.155/api/user/create";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );

      // Debugging the response
      print("Response Body: ${response.body}");
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse and return the response body
        return jsonDecode(response.body);
      } else {
        // Return an error map if the status code indicates a failure
        return {"success": false, "error": jsonDecode(response.body)["error"]};
      }
    } catch (e) {
      print("Error occurred in createUser: $e");
      return {
        "success": false,
        "error": "An unexpected error occurred. Please try again."
      };
    }
  }

  static Future<dynamic> uploadImage({required String imagePath}) async {
    NetworkHelper networkHelper = NetworkHelper('$baseURL/public/uploadMedia');
    var loginData = await networkHelper.uploadFileData(filePath: imagePath);
    return loginData;
  }

  static Future<UserModel?> getProfile({
    required String accessToken,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};
    print('URL: ${'$baseURL/user/profile'}');
    try {
      NetworkHelper networkHelper = NetworkHelper('$baseURL/user/profile');
      var profileData = await networkHelper.getwithHeader(header: headerParams);
      print("Profile Data: $profileData");
      if (profileData != null) {
        return UserModel.fromJson(profileData); // Convert JSON to Model
      } else {
        return null;
      }
    } catch (e) {
      print("Error in getProfile: $e");
      return null;
    }
  }

  static Future<AllUsersResponse?> getAllUsers({
    required String accessToken,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};
    print('URL: ${'$baseURL/user/allUsers?page=1&pageSize=100'}');
    try {
      NetworkHelper networkHelper =
          NetworkHelper('$baseURL/user/allUsers?page=1&pageSize=100');
      var allUserData = await networkHelper.getwithHeader(header: headerParams);
      print("All Users Data: $allUserData");
      if (allUserData != null) {
        return AllUsersResponse.fromJson(allUserData); // Convert JSON to Model
      } else {
        return null;
      }
    } catch (e) {
      print("Error in getting all user Data: $e");
      return null;
    }
  }

  //MATCH
  static Future<dynamic> likeProfile({
    required String likedUserID,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString(SharedPrefsKeys.accessToken);
    try {
      final response = await http.post(
        Uri.parse('$baseURL/user/likeProfile'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode({"likeUserId": likedUserID}),
      );
      print("url: ${'$baseURL/user/likeProfile'}");
      print("Response Body: ${response.body}");
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {

      } else {
        print("Error occurred while taking action");
        return null;
      }
    } catch (e) {
      print("Error occurred while taking action: $e");
      return null;
    }
    // Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};
    // Map<String, String> bodyParams = {"likeUserId": likedUserID};
    // print("url: ${'$baseURL/user/likeProfile'}");
    // print("bodyParams: $bodyParams and access token : $accessToken");
    //
    // NetworkHelper networkHelper = NetworkHelper('$baseURL/user/likeProfile');
    // var loginData =
    //     await networkHelper.postHeaderBodyData(headerParams, bodyParams);
    //
    // return loginData;
  }

  static Future<dynamic> disLikedProfile({
    required String likedUserID,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString(SharedPrefsKeys.accessToken);
    try {
      final response = await http.post(
        Uri.parse('$baseURL/user/dislikeProfile'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode({"dislikeUserId": likedUserID}),
      );
      print("url: ${'$baseURL/user/dislikeProfile'}");
      print("Response Body: ${response.body}");
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {

      } else {
        print("Error occurred while taking action");
        return null;
      }
    } catch (e) {
      print("Error occurred while taking action: $e");
      return null;
    }
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var accessToken = prefs.getString(SharedPrefsKeys.accessToken);
    // Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};
    // Map<String, String> bodyParams = {"dislikeUserId": likedUserID};
    // print("url: ${'$baseURL/user/dislikeProfile'}");
    // print("bodyParams: $bodyParams and access token : $accessToken");
    //
    // NetworkHelper networkHelper = NetworkHelper('$baseURL/user/dislikeProfile');
    // var loginData =
    //     await networkHelper.postHeaderBodyData(headerParams, bodyParams);
    // return loginData;
  }

  static Future<dynamic> getAllMatchesProfile(
      {required String accessToken}) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};

    NetworkHelper networkHelper =
        NetworkHelper('$baseURL/user/matchProfiles?page=1&pageSize=10');
    var loginData = await networkHelper.getwithHeader(header: headerParams);
    return loginData;
  }

  static Future<dynamic> whoLikesMe({required String accessToken}) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};

    NetworkHelper networkHelper =
        NetworkHelper('$baseURL/user/likesMe?page=1&pageSize=10');
    var loginData = await networkHelper.getwithHeader(header: headerParams);
    return loginData;
  }

  static Future<dynamic> iLikePeople({
    required String accessToken,
    required String likedUserID,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};

    NetworkHelper networkHelper =
        NetworkHelper('$baseURL/user/likes?page=1&pageSize=10');
    var loginData = await networkHelper.getwithHeader(header: headerParams);
    return loginData;
  }

  static Future<dynamic> getOtherUserProfile(
      {required String accessToken}) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};

    NetworkHelper networkHelper =
        NetworkHelper('$baseURL/user/otherProfiles?page=1&pageSize=5');
    var loginData = await networkHelper.getwithHeader(header: headerParams);
    return loginData;
  }

  //FEEDS
  static Future<dynamic> createFeed({
    required String accessToken,
    required String likedUserID,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};
    Map<String, String> bodyParams = {
      "title": likedUserID,
      "description": likedUserID,
      "images": "",
    };

    NetworkHelper networkHelper = NetworkHelper('$baseURL/user/feed/create');
    var loginData =
        await networkHelper.postHeaderBodyData(headerParams, bodyParams);
    return loginData;
  }

  static Future<dynamic> updateFeed({
    required String accessToken,
    required String likedUserID,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};
    Map<String, String> bodyParams = {
      "id": "4b4da4ad-8d68-435c-a875-2e943d06a80e",
      "title": "update",
      "description": "desupdateasdfsadf asdf asdfc",
      "images": ""
    };

    NetworkHelper networkHelper = NetworkHelper('$baseURL/user/feed/update');
    var loginData = await networkHelper.patchData(headerParams, bodyParams);
    return loginData;
  }

  static Future<dynamic> getFeedByID({
    required String accessToken,
    required String feedID,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};

    NetworkHelper networkHelper =
        NetworkHelper('$baseURL/user/feed/find/$feedID');
    var loginData = await networkHelper.getwithHeader(header: headerParams);
    return loginData;
  }

  static Future<dynamic> userSelfFeeds({
    required String accessToken,
    required String feedID,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};

    NetworkHelper networkHelper =
        NetworkHelper('$baseURL/user/feed/my?page=1&pageSize=100');
    var loginData = await networkHelper.getwithHeader(header: headerParams);
    return loginData;
  }

  static Future<dynamic> friendFeeds({
    required String accessToken,
    required String feedID,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};

    NetworkHelper networkHelper =
        NetworkHelper('$baseURL/user/feed/friends?page=1&pageSize=100');
    var loginData = await networkHelper.getwithHeader(header: headerParams);
    return loginData;
  }

  static Future<dynamic> likeFeed({
    required String accessToken,
    required String feedID,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};
    Map<String, String> bodyParams = {'feedId': feedID};

    NetworkHelper networkHelper = NetworkHelper('$baseURL/user/feed/like');
    var loginData =
        await networkHelper.postHeaderBodyData(headerParams, bodyParams);
    return loginData;
  }

  //CHATS

  static Future<dynamic> getAllRecentChats({
    required String accessToken,
    required String feedID,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};

    NetworkHelper networkHelper =
        NetworkHelper('$baseURL/user/chat/recent-chats');
    var loginData = await networkHelper.getwithHeader(header: headerParams);
    return loginData;
  }

  static Future<dynamic> getSpecificConversations({
    required String accessToken,
    required String userID,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};

    NetworkHelper networkHelper = NetworkHelper('$baseURL/user/chat/$userID');
    var loginData = await networkHelper.getwithHeader(header: headerParams);
    return loginData;
  }

  static Future<dynamic> sendMessage({
    required String accessToken,
    required String receiverID,
    required String content,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};
    Map<String, String> bodyParams = {
      'receiverId': receiverID,
      "content": content
    };

    NetworkHelper networkHelper =
        NetworkHelper('$baseURL/user/chat/sendMessage');
    var loginData =
        await networkHelper.postHeaderBodyData(headerParams, bodyParams);
    return loginData;
  }

  //FLASH MESSAGES
  static Future<dynamic> sendFlashMessage({
    required String accessToken,
    required String receiverID,
    required String content,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};
    Map<String, String> bodyParams = {
      'receiverId': receiverID,
      "message": content
    };

    NetworkHelper networkHelper =
        NetworkHelper('$baseURL/user/flashMessages/sendMessage');
    var loginData =
        await networkHelper.postHeaderBodyData(headerParams, bodyParams);
    return loginData;
  }

  static Future<dynamic> getFlashMessage({
    required String accessToken,
    required String receiverID,
    required String content,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};

    NetworkHelper networkHelper =
        NetworkHelper('$baseURL/user/flashMessages?isAccepted=true');
    var loginData = await networkHelper.getwithHeader(header: headerParams);
    return loginData;
  }

  static Future<dynamic> acceptMessages({
    required String accessToken,
    required String receiverID,
    required String id,
  }) async {
    Map<String, String> headerParams = {'Authorization': 'Bearer $accessToken'};
    Map<String, String> bodyParams = {'receiverId': receiverID, "id": id};

    NetworkHelper networkHelper =
        NetworkHelper('$baseURL/user/flashMessages/accept');
    var loginData =
        await networkHelper.postHeaderBodyData(headerParams, bodyParams);
    return loginData;
  }

  // Function to refresh the access token
  static Future<bool> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString(SharedPrefsKeys.userEmail);
    print("email when user is hitting logout Api");
    final response = await http.post(
      Uri.parse('$baseURL/user/logout'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      prefs.setBool(SharedPrefsKeys.isLoggedIn, false);
      prefs.clear();

      return true;
    } else {
      return false; // Refresh failed, user needs to log in again
    }
  }
}
