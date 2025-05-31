% 传递函数模型
%num = 3;
%den = [1, 3, 5, 7];
%G_tf = tf(num, den)

% 零极点增益模型
%G_zpk = zpk(G_tf)

% 状态变量模型
%G_ss = ss(G_tf)

% 定义传递函数模型
num = 3;
den = [1, 3, 5, 7];
G = tf(num, den);
disp('传递函数模型：');
disp(G);

% 建立零极点增益模型
[z, p, k] = tf2zp(num, den);
G_zpk = zpk(z, p, k);
disp('零极点增益模型：');
disp(G_zpk);

% 建立状态空间模型
[A, B, C, D] = tf2ss(num, den);
G_ss = ss(A, B, C, D);
disp('状态空间模型：');
disp(G_ss);

% 验证模型转换
[num_check, den_check] = ss2tf(A, B, C, D);
G_check = tf(num_check, den_check);
disp('转换后的传递函数模型：');
disp(G_check);