part of dbldart;

/// The type of widget.
enum SmallWidgetType {
	/// Displays the owner(s) of the bot.
	owner,

	/// Displays the current status of the bot.
	status,

	/// Displays the total upvotes of the bot.
	upvotes,

	/// Displays the number of servers the bot is in.
	servers,

	/// Displays the library the bot is in.
	library
}

enum WidgetExportType {
	png,
	svg
}

/// A API-rendered widget representing a bot.
abstract class Widget {
	/// The compiled URI representing the widget.
	Uri get uri;

	/// The ID of the bot this widget is for.
	Snowflake id;

	/// The type of file export the website should render.
	WidgetExportType exportType;
}

/// A large widget. Set colors using hexadecimal, e.g. `0xFFFFFF`.
class LargeWidget extends Widget {
	Snowflake id;

	int topColor;

	int middleColor;

	int usernameColor;

	int certifiedColor;

	int dataColor;

	int labelColor;

	int highlightColor;

	Uri get uri {
		Uri uri = Uri.parse("https://discordbots.org/api/widget/$id.${(exportType == WidgetExportType.png ? "png" : "svg")}");
		if (topColor != null) uri.queryParameters["topcolor"] = topColor.toString();
		if (middleColor != null) uri.queryParameters["middlecolor"] = middleColor.toString();
		if (usernameColor != null) uri.queryParameters["usernamecolor"] = usernameColor.toString();
		if (certifiedColor != null) uri.queryParameters["certifiedcolor"] = certifiedColor.toString();
		if (dataColor != null) uri.queryParameters["datacolor"] = dataColor.toString();
		if (labelColor != null) uri.queryParameters["labelcolor"] = labelColor.toString();
		if (highlightColor != null) uri.queryParameters["highlightcolor"] = highlightColor.toString();
		return uri;
	}

	LargeWidget(this.id, {this.topColor, this.middleColor, this.usernameColor, this.certifiedColor, this.dataColor, this.labelColor, this.highlightColor});
}

/// A small widget.
class SmallWidget extends Widget {
	static Map<SmallWidgetType, String> _smallWidgetTypeNames = {
		SmallWidgetType.library: "lib",
		SmallWidgetType.owner: "owner",
		SmallWidgetType.servers: "servers",
		SmallWidgetType.status: "status",
		SmallWidgetType.upvotes: "upvotes"
	};

	Snowflake id;

	SmallWidgetType type = SmallWidgetType.owner;

	int avatarColor;

	int leftColor;

	int rightColor;

	int leftTextColor;

	int rightTextColor;

	Uri get uri {
		Uri uri = Uri.parse("https://discordbots.org/api/widget/${_smallWidgetTypeNames[type]}/$id.${(exportType == WidgetExportType.png ? "png" : "svg")}");
		if (avatarColor != null) uri.queryParameters["avatarbg"] = avatarColor.toString();
		if (leftColor != null) uri.queryParameters["leftcolor"] = leftColor.toString();
		if (rightColor != null) uri.queryParameters["rightcolor"] = rightColor.toString();
		if (leftTextColor != null) uri.queryParameters["lefttextcolor"] = leftTextColor.toString();
		if (rightTextColor != null) uri.queryParameters["righttextcolor"] = rightTextColor.toString();
		return uri;
	}

	SmallWidget(this.id, this.type, {this.avatarColor, this.leftColor, this.rightColor, this.leftTextColor, this.rightTextColor});
}