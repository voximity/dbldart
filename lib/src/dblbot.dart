part of dbldart;

/// A bot class used for interfacing the DBL API.
class DblBot {
	String _token = null;

	DblBot([this._token]);

	Future<User> getUser(Object id) async {
		final route = new Route(this) + "users" + id.toString();
		final response = await route.get();
		print(route.url);
		return new User._fromMap(jsonDecode(response.body));
	}
}