const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");
const getenv = require("getenv");

function createConnection (dbURL, options) {
    var db = mongoose.createConnection(dbURL, options);

    db.on('error', function (err) {
        // If first connect fails because mongod is down, try again later.
        // This is only needed for first connect, not for runtime reconnects.
        // See: https://github.com/Automattic/mongoose/issues/5169
        if (err.message && err.message.match(/failed to connect to server .* on first connect/)) {
            console.log(new Date(), String(err));

            // Wait for a bit, then try to connect again
            setTimeout(function () {
                console.log("Retrying first connect...");
                db.openUri(dbURL).catch(() => {});
                // Why the empty catch?
                // Well, errors thrown by db.open() will also be passed to .on('error'),
                // so we can handle them there, no need to log anything in the catch here.
                // But we still need this empty catch to avoid unhandled rejections.
            }, 20 * 1000);
        } else {
            // Some other error occurred.  Log it.
            console.error(new Date(), String(err));
        }
    });

    db.once('open', function () {
        console.log("Connection to db established.");
    });

    return db;
}

const options = {
  useNewUrlParser: true,
  useCreateIndex: true,
  useFindAndModify: false,
  autoIndex: false, // Don't build indexes
  reconnectTries: Number.MAX_VALUE, // Never stop trying to reconnect
  reconnectInterval: 500, // Reconnect every 500ms
  poolSize: 10, // Maintain up to 10 socket connections
  // If not connected, return errors immediately rather than waiting for reconnect
  bufferMaxEntries: 0,
  connectTimeoutMS: 10000, // Give up initial connection after 10 seconds
  socketTimeoutMS: 45000, // Close sockets after 45 seconds of inactivity
  family: 4 // Use IPv4, skip trying IPv6
};

var hostName = getenv("MONGODB_HOST", "");

if (hostName == "") {
    var appName = getenv("APPLICATION_NAME", "");
    var appSpace = getenv("APPLICATION_NAMESPACE", "");
    hostName = appName + "-mongo." + appSpace + ".svc.cluster.local";
}
var uri = "mongodb://" + hostName + ":27017/test";

// Variable to be sent to Frontend with Database status
let databaseConnection = "Waiting for Database response...";
router.get("/", function(req, res, next) {
    res.send(databaseConnection);
});

var connectWithRetry = function() {
    console.log("Connecting...");
    return mongoose.connect(uri, options, function(err) {
        if (err) {
            console.error('Failed to connect to mongo on startup - retrying in 5 sec', err);
            setTimeout(connectWithRetry, 5000);
        } else {
            console.log("Connection established");
        }
    });
};
connectWithRetry();

module.exports = router;
