import 'package:flutter/cupertino.dart';

import '../models/chat_model.dart';
import '../services/api_service.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers(
      {required String msg, required String chosenModelId}) async {
    if (chosenModelId.toLowerCase().startsWith("gpt")) {
      chatList.addAll(await ApiService.sendMessageGPT(
        message: msg,
        modelId: chosenModelId,
      ));
    } else {
      chatList.addAll(await ApiService.sendMessage(
        message: msg,
        modelId: chosenModelId,
      ));
    }
    notifyListeners();
  }
}

// import 'package:flutter/cupertino.dart';

// import '../models/chat_model.dart';
// import '../services/api_service.dart';

// class ChatProvider with ChangeNotifier {
//   List<ChatModel> chatList = [];
//   List<ChatModel> get getChatList {
//     return chatList;
//   }

//   void addUserMessage({required String msg}) {
//     chatList.add(ChatModel(msg: msg, chatIndex: 0));
//     notifyListeners();
//   }

//   Future<void> sendMessageAndGetAnswers(
//       {required String msg, required String chosenModelId}) async {
//     bool isRecipeQuery = _checkIfRecipe(msg);

//     if (!isRecipeQuery) {
//       // If the message is not related to recipes, add a response to the chatList
//       chatList.add(ChatModel(msg: "Sorry, I can only answer recipe-related queries.", chatIndex: 1));
//       notifyListeners();
//       return;
//     }

//     chatList.add(ChatModel(msg: msg, chatIndex: 0));
//     notifyListeners();

//     if (chosenModelId.toLowerCase().startsWith("gpt")) {
//       chatList.addAll(await ApiService.sendMessageGPT(
//         message: msg,
//         modelId: chosenModelId,
//       ));
//     } else {
//       chatList.addAll(await ApiService.sendMessage(
//         message: msg,
//         modelId: chosenModelId,
//       ));
//     }
//     notifyListeners();
//   }

//   bool _checkIfRecipe(String message) {
//     // Define a list of recipe-related keywords and phrases
//     List<String> recipeKeywords = [
//       'recipe',
//       'cook',
//       'bake',
//       'ingredients',
//       'instructions',
//       'kitchen',
//       'cuisine',
//       'food',
//       'dish',
//       'meal',
//       'spices',
//       'flavors',
//     ];

//     // Split the message into tokens
//     List<String> tokens = message.toLowerCase().split(' ');

//     // Check if any of the tokens match a recipe-related keyword or phrase
//     for (String token in tokens) {
//       if (recipeKeywords.contains(token)) {
//         return true;
//       }
//     }

//     // If none of the tokens match a recipe-related keyword or phrase, return false
//     return false;
//   }
// }
