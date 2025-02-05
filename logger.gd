class_name Logger

static var LOG_PATH: String = "res://logs.txt";

static func print_log(log: String):
	print("[%s] %s" % [Time.get_datetime_string_from_system(), log]);

static func log(log: String):
	var file = FileAccess.open(LOG_PATH, FileAccess.WRITE);
	
	if file:
		file.store_line("[%s] %s" % [Time.get_datetime_string_from_system(), log]);
	else:
		print("Error to open file");
