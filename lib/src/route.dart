part of dbldart;

class Route {
	static final String base = "https://discordbots.org/api";

	String route = "";
	String get url => base + route;

	DblBot client;

	Route([this.client]);

	Future<http.Response> get([Map<String, Object> headers]) =>
		http.get(url, headers: (headers ?? {})..addAll({"Authorization": client._token}));

	Future<http.Response> post(Map<String, Object> data, [Map<String, Object> headers]) =>
		http.post(url, body: jsonEncode(data), headers: (headers ?? {})..addAll({"Authorization": client._token, "Content-Type": "application/json"}));

	String toString() => route;
	Route operator +(String next) => this..route += "/$next";
}