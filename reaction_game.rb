require 'ruby2d'

set background:'purple'
set title: 'Reaction Game'

message = Text.new('Click Here To Begin', x: 20, y: 20)
game_started = false
square = nil
start_time = nil
duration = nil

on :mouse_down do |event|
    puts event.x, event.y

    if game_started
        if square.contains?(event.x, event.y)
            duration = ((Time.now - start_time) * 1000).round
            message = Text.new("You took exactly #{duration}ms to click the square. Click to start again.", x: 20, y:20)
            square.remove
            game_started = false
        end    
    else
        message.remove

        square = Square.new(
            x: rand(get(:width) - 20),
            y: rand(get(:height)- 20),
            size: 20,
            color: 'yellow'
        )

        start_time = Time.now
        game_started = true
    end
end    

show