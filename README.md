# dbldart

A Discord Bot List API binding for Dart

dbldart is a simple Discord Bot List API binding for Dart. No further explanation is needed.

## Usage

Add the library to your `pubspec.yaml`.

### Initializing a bot instance

You can specify a token...
```dart
DblBot dbl = new DblBot("<your dbl token goes here>");
```
or not...
```dart
DblBot dbl = new DblBot();
```

### Updating bot stats

You can update stats with a server count number...
```dart
dbl.updateStats(myBot.guilds.length);
```
or update them with an array of counts representing shards...
```dart
dbl.updateStats(myBot.shards.map((s) => s.guilds.length));
```

### Getting resource information

You can get bot information...
```dart
Bot dblBot = dbl.getBot(myBot.currentUser.id);
print(dblBot.monthlyVotes);
```
or get user information...
```dart
User dblUser = dbl.getUser(80047598504783872);
print(dblUser.social.twitterUrl);
```