function y = ran_point

%%% random points with x=20 %%%
x20 = zeros(250,2);
i=1;
while  i <= size(x20,1)
    r = randi(100);
    if r>=20 && r <=40
        i = i;
    elseif r>=50 && r<=70 
        i = i;
    elseif r>=80 && r<=95
        i = i;
    else
        x20(i,2) = r;
        i = i+1;
    end   
end

%%% random points with x=40 %%%
x40 = zeros(250,2);
i=1;
while  i <= size(x40,1)
    r = randi(100);
    if r>=20 && r <=40
        i = i;
    elseif r>=55 && r<=70 
        i = i;
    else
        x40(i,2) = r;
        i = i+1;
    end   
end


%%% random points with x=60 %%%
x60 = zeros(250,2);
i=1;
while  i <= size(x60,1)
    r = randi(100);
    if r>=30 && r <=50
        i = i;
    elseif r>=70 && r<=90 
        i = i;
    else
        x60(i,2) = r;
        i = i+1;
    end   
end


%%% random points with x=80 %%%
x80 = zeros(250,2);
i=1;
while  i <= size(x80,1)
    r = randi(100);
    if r>=20 && r <=40
        i = i;
    elseif r>=63 && r<=75 
        i = i;
    else
        x80(i,2) = r;
        i = i+1;
    end   
end


x20(:,1)=20;
x40(:,1)=40;
x60(:,1)=60;
x80(:,1)=80;

y = [x20 , x40 , x60 , x80];

end