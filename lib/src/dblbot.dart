part of dbldart;

/// A bot class used for interfacing the DBL API.
class DblBot {
	String _token = null;

	/// Provides [Webhook] invocation with the DBL API to monitor voting.
	Webhook webhook = new Webhook._internal();

	DblBot([this._token]);

	/// Updates the [Bot]'s information on DBL, given [serverCount].
	Future<Null> updateStats(int serverCount) async =>
		await (new _Route(this) + "bots" + "stats").post({"server_count": serverCount});

	/// Updates the [Bot]'s information on DBL, given [shards], a [List<int>] of server counts.
	Future<Null> updateShardsStats(List<int> shards) async =>
		await (new _Route(this) + "bots" + "stats").post({"shards": shards});

	/// Get a DBL-registered [User].
	Future<User> getUser(Object id) async {
		final response = await (new _Route(this) + "users" + id.toString()).get();
		return new User._fromMap(jsonDecode(response.body));
	}
	
	/// Get a [Bot] from DBL.
	Future<Bot> getBot(Object id) async {
		final response = await (new _Route(this) + "bots" + id.toString()).get();
		return new Bot._fromMap(jsonDecode(response.body));
	}
}