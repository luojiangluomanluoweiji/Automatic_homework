% 定义传递函数 phi(s) = 1/(s+1)
s = tf('s');
phi = 1/(s+1);

% 转换为状态空间模型以便使用 lsim 函数
[num, den] = tfdata(phi, 'v');
sys = ss(tf(num, den));

% 定义时间范围
t = 0:0.1:10; % 0到10秒，步长0.1秒

% 定义正弦输入信号
input = sin(t);

% 模拟系统响应
output = lsim(sys, input, t);

% 绘制输入和输出曲线
figure;
plot(t, input, 'b-', 'DisplayName', '输入信号');
hold on;
plot(t, output, 'r--', 'DisplayName', '输出响应');
hold off;

% 添加图例和标签
legend;
xlabel('时间 (秒)');
ylabel('幅值');
title('系统响应');
grid on;