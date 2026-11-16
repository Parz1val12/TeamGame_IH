extends Control

# This path points from your root UI node down to your Label
@onready var score_label: Label = $CanvasLayer/ScoreLabel

var score: int = 0

func _ready() -> void:
	update_score_display()

# Call this function whenever a player scores a point (e.g., a successful tag)
func add_point(amount: int = 1) -> void:
	score += amount
	update_score_display()

func update_score_display() -> void:
	score_label.text = "Score: " + str(score)
