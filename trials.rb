# The goal is to run the simulation 10,000 times and demonstrate that it is indeed a 2/3 chance of winning by switching your door choice vs a 1/3 chance of winning by keeping your original choice. Put these results in results.jpg and push the repo somewhere where I can review it.

def monty(sims)
    start = Time.now
    doors = ['1', '2', '3']
    stay_result = 0
    switch_result = 0
    def random_door(arr)
        arr.sample()
    end
    sims.times do 
        original_pick = random_door(doors)
        prize_door = random_door(doors)
        opened_door = random_door(doors - [original_pick, prize_door])
        switch_pick = random_door(doors - [original_pick, opened_door])
        if original_pick == prize_door
            stay_result += 1
        end
        if switch_pick == prize_door
            switch_result += 1
        end
    end
    p "Result of staying with original door: Win #{(stay_result/sims.to_f) * 100}% of the time"
    p "Result of switching door: Win #{(switch_result/sims.to_f) * 100}% of the time"
    # code to time
    finish = Time.now
    diff = finish - start
    p "Time to complete: #{diff} seconds"
end
monty(10000)