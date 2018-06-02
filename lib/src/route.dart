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
		http.post(url, body: data, headers: (headers ?? {})..addAll({"Authorization": client._token}));

	String toString() => route;
	Route operator +(String next) => this..route += "/$next";
}