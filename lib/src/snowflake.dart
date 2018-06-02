part of dbldart;

class Snowflake {
	int id;

	String toString() => id.toString();

	Snowflake(Object id) {
		this.id = id is String ? int.parse(id) : id;
	}

	int get hashCode => id.hashCode;
	bool operator ==(Object idOther) => id.toString() == idOther.toString();
}