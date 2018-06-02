part of dbldart;

class SocialData {
	String youtube;
	String get youtubeUrl => youtube != null ? "https://www.youtube.com/channel/$youtube" : null;

	String reddit;
	String get redditUrl => reddit != null ? "https://www.reddit.com/u/$reddit" : null;

	String twitter;
	String get twitterUrl => twitter != null ? "https://www.twitter.com/@$twitter" : null;

	String instagram;
	String get instagramUrl => instagram != null ? "https://www.instagram.com/u/$instagram" : null;

	String github;
	String get githubUrl => github != null ? "https://github.com/$github" : null;

	SocialData._fromMap(Map map) {
		this.youtube = map["youtube"]
			..reddit = map["reddit"]
			..twitter = map["twitter"]
			..instagram = map["instagram"]
			..github = map["github"];
	}
}

/// A DBL User object.
class User {
	/// The snowflake representing this user.
	Snowflake id;

	/// The username of this user.
	String username;

	/// The user's 4-digit discriminator.
	String discriminator;

	String _userAvatar = null;
	String _cdnAvatar = null;

	/// The avatar of the user. If none is set, then a default is used.
	String get avatar => _userAvatar ?? _cdnAvatar;

	/// The full-length bio of the user.
	String bio;

	/// The URL of the banner for the user.
	String bannerUrl;

	/// A [SocialData] object representing the user's set social media.
	SocialData social;

	/// Whether or not the user has supported DBL.
	bool supporter;

	/// Whether or not the user is a certified developer.
	bool certified;

	bool _webMod;
	bool _mod;
	/// Whether or not the user is a moderator of DBL.
	bool get mod => _webMod || _mod;

	/// Whether or not the user is an admin of DBL.
	bool admin;

	User._fromMap(Map map) {
		this.id = new Snowflake(map["id"]);
		this.username = map["username"]
			..discriminator = map["discriminator"]
			.._userAvatar = map["avatar"]
			.._cdnAvatar = map["defAvatar"]
			..bio = map["bio"]
			..bannerUrl = map["banner"]
			..social = SocialData._fromMap(map["social"] ?? {})
			..supporter = map["supporter"]
			..certified = map["certifiedDev"]
			.._mod = map["mod"]
			.._webMod = map["webMod"]
			..admin = map["admin"];
	}
}