part of dbldart;

class VoteEvent {
	/// The [Snowflake] representing the bot that received a vote.
	Snowflake botId;

	/// The [Snowflake] representing the user that voted.
	Snowflake userId;

	/// The querystring parameters passed to the vote page, like `/bot/:id/vote`, e.g. `?a=1&b=2`
	String query;

	VoteEvent._internal(this.botId, this.userId, this.query);
}

class Webhook extends _EventExhibitor {
	HttpServer _server;

	/// Fired when a user votes for the bot.
	_EventStream<VoteEvent> onUserVote;
	/// Fired when the developer uses the test vote function.
	_EventStream<VoteEvent> onTestVote;

	Webhook._internal() {
		onUserVote = createEvent();
		onTestVote = createEvent();
	}

	/// Open the webhook given the [port] (defaults to 4040) and the [password] (defaults to none).
	Future<Null> create([int port = 4040, String password]) async {
		_server = await HttpServer.bind(InternetAddress.anyIPv4, port);

		_server.listen((request) async {
			if (request.method == "GET") {
				request.response
					..headers.contentType = ContentType.HTML
					..write("<a href=\"https://github.com/voximity/dbldart\">dbldart</a> webhook server running on port $port")
					..close();
				return;
			}
			if (request.method != "POST")
				return;
			if (request.headers.value("Authorization") != password)
				return;

			final body = await request.transform(utf8.decoder).join();
			final data = jsonDecode(body);

			request.response.close();

			VoteEvent event = new VoteEvent._internal(new Snowflake(data["bot"]), new Snowflake(data["user"]), data["query"]);
			if (data["type"] == "upvote")
				onUserVote.add(event);
			else if (data["type"] == "test")
				onTestVote.add(event);
		});
	}

	/// Close the webhook server.
	void close() {
		_server.close();
	}
}