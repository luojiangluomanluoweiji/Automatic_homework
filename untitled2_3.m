
 % 定义系统1：G1(s) = 2.7/(s^3 +5s^2 +4s)
num1 = 2.7;
den1 = [1, 5, 4, 0];          % 分母：s(s+1)(s+4)
G1 = tf(num1, den1);

num2 = 2.7;
den2 = [1, 5, -4, 0];         % 分母：s(s^2+5s-4)
G2 = tf(num2, den2);


% 绘制Bode图并计算裕度
figure;
margin(G1);
title('G1的Bode图');
[Gm1, Pm1, ~, ~] = margin(G1);

% 绘制 G1(s) 的 Bode 图
figure(1);
bode(G1);
grid on;
title('G1(s) 的 Bode 图');

% 获取 G1(s) 的频率响应数据
[mag1, phase1, w1] = bode(G1);

% 计算 G1(s) 的增益裕度和相位裕度
[GM1, PM1, WM1, WP1] = margin(mag1, phase1, w1);

% 绘制 G2(s) 的 Bode 图
figure(2);
bode(G2);
grid on;
title('G2(s) 的 Bode 图');






% 绘制 G2(s) 的 Bode 图
figure(2);
bode(G2);
grid on;
title('G2(s) 的 Bode 图');

% 获取 G2(s) 的频率响应数据
[mag2, phase2, w2] = bode(G2);

% 计算 G2(s) 的增益裕度和相位裕度
[GM2, PM2, WM2, WP2] = margin(mag2, phase2, w2);

% 判断闭环稳定性
is_stable1 = PM1 > 0;
is_stable2 = PM2 > 0;

% 显示结果
fprintf('G1(s) 的相位裕度: %.2f degrees\n', PM1);
fprintf('G1(s) 的增益裕度: %.2f dB\n\n', GM1);

fprintf('G2(s) 的相位裕度: %.2f degrees\n', PM2);
fprintf('G2(s) 的增益裕度: %.2f dB\n\n', GM2);

if is_stable1
    fprintf('G1(s) 的闭环系统是稳定的。\n');
else
    fprintf('G1(s) 的闭环系统是不稳定的。\n');
end

if is_stable2
    fprintf('G2(s) 的闭环系统是稳定的。\n');
else
    fprintf('G2(s) 的闭环系统是不稳定的。\n');
end

