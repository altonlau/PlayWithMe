import json,httplib,urllib

connection = httplib.HTTPSConnection('parseapi.back4app.com', 443)
connection.connect()

def get_user_chats(user_id):
  #Returns the chat_ids for the user's chats
  url = '/classes/Users?where={"user_id":' + str(user_id)+'}'
  connection.request('GET', url ,'', {
       "X-Parse-Application-Id": "OUS5D6T6Hf9C6yW6SJMOgWGIfaw7gZRbVHSMAfZi",
       "X-Parse-REST-API-Key": "uyWgbdC2Y0sXFxS3H7SQt8cn0GkKigwSgwTzCybM"
     })
  result = json.loads(connection.getresponse().read())
  return result['results'][0]['chat_ids']

def get_user(user_id):
  #Returns the user object
  url = '/classes/Users?where={"user_id":' + str(user_id)+'}'
  connection.request('GET', url ,'', {
       "X-Parse-Application-Id": "OUS5D6T6Hf9C6yW6SJMOgWGIfaw7gZRbVHSMAfZi",
       "X-Parse-REST-API-Key": "uyWgbdC2Y0sXFxS3H7SQt8cn0GkKigwSgwTzCybM"
     })
  result = json.loads(connection.getresponse().read())
  print result['results'][0]

def get_chat(chat_id):
  #Returns the user object
  url = '/classes/Users?where={"chat_id":' + str(chat_id)+'}'
  connection.request('GET', url ,'', {
       "X-Parse-Application-Id": "OUS5D6T6Hf9C6yW6SJMOgWGIfaw7gZRbVHSMAfZi",
       "X-Parse-REST-API-Key": "uyWgbdC2Y0sXFxS3H7SQt8cn0GkKigwSgwTzCybM"
     })
  result = json.loads(connection.getresponse().read())
  print result



get_chat(1)