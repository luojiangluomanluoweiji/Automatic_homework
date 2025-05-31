% 定义开环传递函数的分子和分母多项式
num = [1 1]; % 分子多项式 s+1
den = conv([1 -1 0], [1 4 20]); % 分母多项式 s(s-1)(s^2+4s+20)

% 绘制根轨迹
figure;
rlocus(num, den);
grid on;
title('根轨迹图');
axis([-5 5 -5 5]);

% 计算阻尼比为0.5时的k值和特征根
[p, k] = rlocfind(num, den);

% 在命令窗口中打印阻尼比为0.5时的k值和极点
fprintf('阻尼比为0.5时的k值: %.2f\n', k);
fprintf('对应的闭环特征根:\n');
disp(p);