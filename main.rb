require 'ruby2d'

message = Text.new("Click to start!")
target = nil
score = 0
fails = 0
a = false

on :mouse_down do |event|
	if !a
		message.remove
		message = Text.new("Score: " + score.to_s + " Fails: " + fails.to_s)


		target = Circle.new(
		x: rand(0..640), y: rand(0..480),
		size: 125,
		color: 'red'
		)

		a = true
	elsif target.contains?(event.x, event.y)
	    target.remove
		score += 1

		message.remove
		message = Text.new("Score: " + score.to_s + " Fails: " + fails.to_s)

		target = Circle.new(
		x: rand(0..640), y: rand(0..480),
		size: 125,
		color: 'red'
		)
	elsif !target.contains?(event.x, event.x)
		fails += 1
		message.remove
		message = Text.new("Score: " + score.to_s + " Fails: " + fails.to_s)
	end
end

show
