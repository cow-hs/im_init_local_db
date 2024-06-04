db = db.getSiblingDB('log');
db.createCollection('temp');

db = db.getSiblingDB('chat');
db.createCollection('temp');