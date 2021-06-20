import 'dart:convert';
import 'package:string_validator/string_validator.dart';
import 'package:endroid/bots/calculator.dart';
import 'package:http/http.dart' as http;
class Handle {
   calculate(var value) {
    List numbers=[];
    if(value.contains('+')){
      numbers=value.split('+');
      for (var i = 0; i < numbers.length; i++) {

        // check if the numbers is percedded or suceeded by spaces
        numbers[i]=int.parse(numbers[i].split());
      }
      int result=Calculate().add(numbers[0],numbers[1]);
      return result;
    }
    else if(value.contains('-')){
      numbers=value.split('-');
      for (var i = 0; i < numbers.length; i++) {

        // check if the numbers is percedded or suceeded by spaces
        numbers[i]=int.parse(numbers[i].split());
      }
      int result=Calculate().substract(numbers[0],numbers[1]);
      return result;
    }
    else if(value.contains('*')){
      numbers=value.split('*');
      for (var i = 0; i < numbers.length; i++) {

        // check if the numbers is percedded or suceeded by spaces
        numbers[i]=int.parse(numbers[i].split());
      }
      int result=Calculate().multiply(numbers[0],numbers[1]);
      return result;
    }
    else if(value.contains('/')){
      numbers=value.split('/');
      for (var i = 0; i < numbers.length; i++) {

        // check if the numbers is percedded or suceeded by spaces
        numbers[i]=int.parse(numbers[i].split());
      }
      double result=Calculate().divide(numbers[0],numbers[1]);
      return result;
    }
    else if(value.contains('^')){
      numbers=value.split('^');
      for (var i = 0; i < numbers.length; i++) {

        // check if the numbers is percedded or suceeded by spaces
        numbers[i]=int.parse(numbers[i].split());
      }
      num result=Calculate().expo(numbers[0],numbers[1]);
      return result;
    }
    else{
      return "PLease enter some valid numbers";
    }

  }
  github(var value){
      // call the github api for the user inside the value and fetch the repos
      // return a list view if the present containing the repo name and 2-3 lines of read me file
      // if no data or user is there show apt message
      // in case of some error show error message
  }
  movie(var value){
    // show movies related to what the user has entered
    // list view and show the messages as apt
  }
  recommendMovie(){
    // user will just say it wants the movie recommendationss and simple TBDB api call for recommending movies
    // same can be done for recommending TV series 
  }


  // to get the meaning of a given word
  Future<String> getMeaning(var value) async{
    String finalValue=value.toString();
      var bool = isAlpha(finalValue);
      if (!bool){
      Future.delayed(Duration(seconds: 1));
      return "String input only";}
    
    var url = "https://api.dictionaryapi.dev/api/v2/entries/en_US/"+finalValue;
    final response =
      await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var data= jsonDecode(response.body);
    return data[0]["meanings"][0]["definitions"][0]["definition"];

  } else {
    throw Exception('Failed to load');
  }
}
}
