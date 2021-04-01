clc;
clear all;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p_start=[5;20];
p_end=[95;70];
plot(p_start(1,1),p_start(2,1),'r*');
hold on
plot(p_end(1,1),p_end(2,1),'b*');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B1=[20,20,40,40,20;
    20,40,40,20,20];
B2=[20,20,45,45,20;
    50,70,70,60,50];
B3=[50 50 70 65 50;
    30 50 50 30 30];
B4=[55 55 65 65 55;
    70 90 90 70 70];
B5=[75 75 85 85 75;
    20 40 40 20 20];
B6=[75 75 85 85 75;
    55 75 75 75 55];
B7=[20 20 30 20;
    80 95 95 80];
plot(B1(1,:),B1(2,:),B2(1,:),B2(2,:),B3(1,:),B3(2,:),B4(1,:),B4(2,:),...
    B5(1,:),B5(2,:),B6(1,:),B6(2,:),B7(1,:),B7(2,:));
xlim([0 100])
ylim([0 100])
grid on

x = ran_point;
popu = ini_pop_maker(x,p_start,p_end);

%%% plotting ini_pop %%%%
hold on
% for i = 1:50
%     line([popu(i , 1:2:12)] , [popu(i , 2:2:12)]);
% end

%%% organizing by fittness func %%%
% the safety of the psth is considered in "collision_detector" function by
% adding a bigger border to the main barriers
% by looking at the code we learn that closest path is also the smoothest
% one so the fitness function is just considering the closest path

straight_dist =  sqrt((p_start(1,1)-p_end(1,1))^2 + (p_start(2,1)-p_end(2,1))^2)
for i = 1:50
    fitness_value(i,1) = fit_calc(popu(i,:));
end


ini_popu = [popu , fitness_value];
ranked_popu = sortrows(ini_popu , 13);

%%% choosing first 20 chromosomes to be parents %%%
population = ranked_popu(1:20 , 1:12);
figure
counter = 0;
children = [];
for k = 1 : 50
    while counter<= 19
        rand1 = randi(100);
        if rand1 < 60
            randd1 = randi(5);
            p1 = population(randd1 , :);
        else
            randdd1 = randi([6 20]);
            p1 = population(randdd1 , :);
        end
        rand2 = randi(100);
        if rand2 < 60
            randd2 = randi(5);
            p2 = population(randd2 , :);
        else
            randdd2 = randi([6 15]);
            p2 = population(randdd2 , :);
        end

        cut_rand = 1+ 2*randi([1 5]);
        alpha = 0.2;
        ch1 = alpha.*p1 + (1-alpha).*p2;%[p1(1 , 1:cut_rand-1) , p2(1 , cut_rand:12)];
        ch2 = alpha.*p2 + (1-alpha).*p1;%[p2(1 , 1:cut_rand-1) , p1(1 , cut_rand:12)];
        p_mu = randi(100);
        if p_mu <= 50
            ch1 = alpha.*p1 + (1-alpha).*p2 +[0,0,1,1,1,1,1,1,1,1,0,0];
            ch2 = alpha.*p2 + (1-alpha).*p1 +[0,0,1,1,1,1,1,1,1,1,0,0];
        else
            ch1 = ch1;
            ch2 = ch2;
        end
        col1 = collision_detector(ch1);
        col2 = collision_detector(ch2);
        %     line([ch1(1 , 1:2:12)] , [ch1(1 , 2:2:12)]);
        %     line([ch2(1 , 1:2:12)] , [ch2(1 , 2:2:12)]);
        if col1 == 0 && col2 == 0
            children = [children ; ch1];
            children = [children ; ch2];
            counter = counter + 2;
        elseif col1 == 0 && col2 == 1
            children = [children ; ch1];
            counter = counter + 1;
        elseif col1 == 1 && col2 == 2
            children = [children ; ch2];
            counter = counter + 1;
        else
            counter = counter;
        end
    end
    new_pop = [population ; children(1:20 , :)];
    for i = 1:40
        fit_value(i,1) = fit_calc(new_pop(i,:));
    end
    new_popp = [new_pop , fit_value];
    ranked_new_pop = sortrows(new_popp , 13);
    population = ranked_new_pop(1:20 , 1:12);
    figure
    plot(B1(1,:),B1(2,:),B2(1,:),B2(2,:),B3(1,:),B3(2,:),B4(1,:),B4(2,:),...
        B5(1,:),B5(2,:),B6(1,:),B6(2,:),B7(1,:),B7(2,:));
    xlim([0 100])
    ylim([0 100])
    grid on
    for i = 1:20
        line([population(i , 1:2:12)] , [population(i , 2:2:12)]);
    end
    for i = 1:20
        fit_val(i,1) = fit_calc(population(i,:));
    end
    found_path_dist = sum(fit_val) / 20;
    dist_error_mat(1,k) = found_path_dist - straight_dist;
end


figure
plot(B1(1,:),B1(2,:),B2(1,:),B2(2,:),B3(1,:),B3(2,:),B4(1,:),B4(2,:),...
    B5(1,:),B5(2,:),B6(1,:),B6(2,:),B7(1,:),B7(2,:));
xlim([0 100])
ylim([0 100])
grid on
line([population(1 , 1:2:12)] , [population(1 , 2:2:12)]);
found_path_dist = fit_calc(population(1,:))
dist_error = found_path_dist - straight_dist

figure
l= 1:50;
plot(l , dist_error_mat);

















































































