part of dbldart;

/// A class representing a Snowflake, a type of identifier.
class Snowflake {
	/// The integer ID representing the [Snowflake].
	int id;

	String toString() => id.toString();

	Snowflake(Object id) {
		this.id = id is String ? int.parse(id) : id;
	}

	int get hashCode => id.hashCode;
	bool operator ==(Object idOther) => id.toString() == idOther.toString();
}