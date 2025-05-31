num=[100,200];
den = conv([1, 0], conv([1, 1], [1, 20]));
G_open=tf(num,den)

G_closed=feedback(G_open,1);

p = G_closed.Denominator{1};
%p=[1,21,120,200];

root_num=roots(p)

if all(root_num<0)
    disp('wendin');
else
    disp('bu');
end

