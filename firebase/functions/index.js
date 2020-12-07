const functions = require('firebase-functions');
const admin = require('firebase-admin');
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

admin.initializeApp(functions.config().firebase);
var mssgData;
exports.offerTrigger = functions.firestore.document(
    "donors/{donorId}"
).onCreate((snapshot,context)=>{
    mssgData=snapshot.data();
    // console.log(mssgData.ngoname);
    // console.log(mssgData.itemname);
    // console.log(mssgData.message);
    // console.log(mssgData.quantity);
    // console.log(mssgData.ngoname);
    var tokens=[];
    tokens.push("eATUZ6fORHqjvyTUdvn0sF:APA91bEQV5rfh5oqsVNax2n9mI5LYITq-DtvqL9bJVGmSy6TdJwHYb1vN_POF7FWPWe0eK6th-VXWf5-BNQ6MqdfnPFK9P4NJ9eMNlQocEPxGiochkw3G-cGqAMi_Mxi_NI9g0Z8TNjy");
    var payload = {
        "notification":{
            "title": "From" + mssgData.ngoname,
            "body": "Item: "+ mssgData.itemname,
            "sound": "default",
            // "image":"https://lh3.googleusercontent.com/a-/AOh14Gh2wZV5hAUJ4rJbc4Yb3_xb4oGiF3F8zjGOVbqQsPo=s96-c"
        },
        "data": {
            "sendername" : mssgData.ngoname,
         "item": mssgData.itemname,
        // },
        // "fcm_options": {
        //     "image":"https://firebasestorage.googleapis.com/v0/b/donationapp-89333.appspot.com/o/images%2F2020-12-06%2015%3A51%3A43.829036?alt=media&token=66112a12-5495-46cf-8065-a009ee98cb41"
        }
    }
 return admin.messaging().sendToDevice(tokens,payload).then((response) => {
     console.log("Notification Sent");
    }).catch((err)=>{
        console.log(err);
    });

});
  

