function ini_pop = ini_pop_maker(x,s,e)

x20 = x(:,1:2);
x40 = x(:,3:4);
x60 = x(:,5:6);
x80 = x(:,7:8);

population = zeros(50,12);

pop_count = 1;
while pop_count <= 50 
    rand1 = randi(size(x20,1));
    rand2 = randi(size(x20,1));
    rand3 = randi(size(x20,1));
    rand4 = randi(size(x20,1));
    population(pop_count , 1:2) = s';
    population(pop_count , 3:4) = x20(rand1 , :);
    population(pop_count , 5:6) = x40(rand2 , :);
    population(pop_count , 7:8) = x60(rand3 , :);
    population(pop_count , 9:10) = x80(rand4 , :);
    population(pop_count , 11:12) = e';
    
    y = collision_detector(population(pop_count , :));
    
    if y == 0
        pop_count = pop_count+1;
    else
        pop_count = pop_count;
    
end

ini_pop = population;
end
        