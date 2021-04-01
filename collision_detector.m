function y = cllision_detector(x)

cols20(1,1) = lineSegmentIntersect([x(1:2) , x(3:4)] , [20 80 20 95]);
cols20(1,2) = lineSegmentIntersect([x(1:2) , x(3:4)] , [20 50 20 70]);
cols20(1,3) = lineSegmentIntersect([x(1:2) , x(3:4)] , [20 20 20 40]);

col2040(1,1) = lineSegmentIntersect([x(3:4) , x(5:6)] , [20 95 30 95]);
col2040(1,2) = lineSegmentIntersect([x(3:4) , x(5:6)] , [20 70 45 70]);
col2040(1,3) = lineSegmentIntersect([x(3:4) , x(5:6)] , [20 50 45 60]);
col2040(1,4) = lineSegmentIntersect([x(3:4) , x(5:6)] , [20 40 40 40]);
col2040(1,5) = lineSegmentIntersect([x(3:4) , x(5:6)] , [20 20 40 20]);

col4060(1,1) = lineSegmentIntersect([x(5:6) , x(7:8)] , [20 70 45 70]);
col4060(1,2) = lineSegmentIntersect([x(5:6) , x(7:8)] , [20 50 45 60]);
col4060(1,3) = lineSegmentIntersect([x(5:6) , x(7:8)] , [55 90 55 70]);
col4060(1,4) = lineSegmentIntersect([x(5:6) , x(7:8)] , [50 50 70 50]);
col4060(1,5) = lineSegmentIntersect([x(5:6) , x(7:8)] , [50 50 50 30]);
col4060(1,6) = lineSegmentIntersect([x(5:6) , x(7:8)] , [50 30 65 30]);

col6080(1,1) = lineSegmentIntersect([x(7:8) , x(9:10)] , [55 90 65 90]);
col6080(1,2) = lineSegmentIntersect([x(7:8) , x(9:10)] , [55 70 65 70]);
col6080(1,3) = lineSegmentIntersect([x(7:8) , x(9:10)] , [50 50 70 50]);
col6080(1,4) = lineSegmentIntersect([x(7:8) , x(9:10)] , [50 30 65 30]);
col6080(1,5) = lineSegmentIntersect([x(7:8) , x(9:10)] , [75 75 75 55]);
col6080(1,6) = lineSegmentIntersect([x(7:8) , x(9:10)] , [75 40 75 20]);

col80e(1,1) = lineSegmentIntersect([x(9:10) , x(11:12)] , [75 75 85 75]);
col80e(1,2) = lineSegmentIntersect([x(9:10) , x(11:12)] , [75 20 85 20]);


if find(col2040 > 0) >= 1 
    y = 1;
elseif find(col4060 > 0) >= 1
    y = 1;
elseif find(col6080 > 0) >= 1
    y = 1;
elseif find(col80e > 0) >= 1
    y = 1;
elseif find(cols20 > 0) >=1
    y = 1;
else
    y = 0;
end
    
    
    
    
    
    
    
    
    