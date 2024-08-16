extends Area2D

@export var event_area_name: String = "Area Event"

func _on_body_entered(body):
	if body.is_in_group("player"):
		on_player_entered()

func on_player_entered():
	print("Player entered " + event_area_name)
