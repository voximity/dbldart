part of dbldart;

/// A class representing a DBL bot.
class Bot {
	/// The [Snowflake] representing this [Bot].
	Snowflake id;

	/// The username of the [Bot].
	String username;

	/// The discriminator of this [Bot].
	String discriminator;

	String _userAvatar;
	String _cdnAvatar;
	/// The avatar of this [Bot]. If none is set, a default CDN avatar is used.
	String get Avatar => _userAvatar ?? _cdnAvatar;

	/// The library of this [Bot].
	String library;

	/// The prefix of this [Bot].
	String prefix;

	/// The short description of this [Bot].
	String bio;

	/// The long description of this [Bot], if any. May contain Markdown or HTML.
	String description;

	/// The tags applied to this [Bot].
	List<String> tags;

	/// The website of this [Bot], if any.
	String website;
	
	/// The support invite code of this [Bot], if any.
	String support;
	///The support invite URL of this [Bot], if any.
	String get supportUrl => support != null ? "https://discord.gg/$support" : null;

	/// The GitHub repository link for this [Bot], if any.
	String repository;

	/// A list of [Snowflake] objects representing the [Bot]'s owners.
	List<Snowflake> owners;

	/// A custom invite URL for the [Bot], if any.
	String invite;

	/// The time at which this [Bot] was approved.
	DateTime approved;

	/// Whether or not this [Bot] is certified.
	bool certified;

	/// The vanity URL for this [Bot], if any.
	String vanity;

	/// The total vote count for this [Bot].
	int votes;

	/// The total monthly vote count for this [Bot].
	int monthlyVotes;

	Bot._fromMap(Map map) {
		id = new Snowflake(map["id"]);
		username = map["username"];
		discriminator = map["discriminator"];

		_userAvatar = map["avatar"];
		_cdnAvatar = map["defAvatar"];

		library = map["lib"];
		prefix = map["prefix"];
		
		bio = map["shortdesc"];
		description = map["longdesc"];

		tags = map["tags"].toList();
		website = map["website"];
		support = map["support"];

		repository = map["github"];

		owners = map["owners"].map((i) => new Snowflake(i)).toList();
		invite = map["invite"];
		approved = map["date"];
		certified = map["certifiedBot"];
		vanity = map["vanity"];
		votes = map["points"];
		monthlyVotes = map["monthlyPoints"];
	}
}