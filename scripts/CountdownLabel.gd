extends Label

export (int) var count = 10
onready var exit_button = $'../ExitButton'

func _ready():
	$CountdownTimer.process_mode = Timer.TIMER_PROCESS_PHYSICS

func start_countdown():
	$CountdownTimer.start(1)

func _on_CountdownTimer_timeout():
	change_count(-1)
	$AudioStreamPlayer2D.play()
	
func change_count(amount):
	count += amount
	if count < 0:
		exit_button.exit()
	change_text(count)
		
	
func change_text(text):
	set_text(str(text))
