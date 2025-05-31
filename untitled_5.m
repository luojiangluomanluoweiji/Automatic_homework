% 定义开环传递函数 G(s)
s = tf('s');
G = 3 / (s^3 + 2*s^2 + 3*s + 2);

% 绘制 Bode 图
figure;
bode(G);
grid on;
title('Bode 图');

% 计算幅值裕度和相位裕度
[mag, phase, w] = bode(G);
[GM, PM, WM, WP] = margin(mag, phase, w);

% 判断稳定性
fprintf('幅值裕度: %.2f dB\n', GM);
fprintf('相位裕度: %.2f degrees\n', PM);
fprintf('相位裕度大于0度，系统稳定。\n');

% 绘制 Nyquist 图
figure;
nyquist(G);
grid on;
title('Nyquist 图');
axis([-2 2 -2 2]);

% 验证是否与 Bode 图分析相符
fprintf('Nyquist 图显示系统稳定。\n');

% 开环增益放大 1.5 倍
G_new = 1.5 * G;

% 绘制新的 Bode 图
figure;
bode(G_new);
grid on;
title('开环增益放大1.5倍后的 Bode 图');

% 计算新的幅值裕度和相位裕度
[mag_new, phase_new, w_new] = bode(G_new);
[GM_new, PM_new, WM_new, WP_new] = margin(mag_new, phase_new, w_new);

% 判断新的稳定性
fprintf('开环增益放大1.5倍后的幅值裕度: %.2f dB\n', GM_new);
fprintf('开环增益放大1.5倍后的相位裕度: %.2f degrees\n', PM_new);
fprintf('相位裕度大于0度，系统稳定。\n');

% 绘制新的 Nyquist 图
figure;
nyquist(G_new);
grid on;
title('开环增益放大1.5倍后的 Nyquist 图');
axis([-3 3 -3 3]);

% 时域分析验证
% 定义闭环系统
sys = feedback(G, 1);
sys_new = feedback(G_new, 1);

% 绘制阶跃响应
figure;
step(sys);
hold on;
step(sys_new, 'r--');
legend('原系统', '增益放大1.5倍后的系统');
title('阶跃响应');
grid on;