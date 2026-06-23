extends Resource
class_name Item

@export var icon: Texture2D
@export var name: String

@export_enum("Gear","Key")
var type = "Gear"

@export_multiline var description: String
