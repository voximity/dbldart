import 'package:dbldart/dbldart.dart';

main() async {
  var dbl = DblBot();
  var bot = await dbl.getBot("365975655608745985");

  print("Bot name: ${bot.username}#${bot.discriminator}. Bot votes: ${bot.votes}");

  var user = await dbl.getUser(bot.owners.first);
  print("Bot owner: ${user.username}#${user.discriminator}");
}