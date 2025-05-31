% 定义二阶系统传递函数
phi = tf(10, [1 2 10]);

% 计算系统的根
roots_phi = roots([1 2 10]);
disp('系统的根：');
disp(roots_phi);

% 计算阻尼比和无阻尼振荡频率
wn = sqrt(10); % 自然频率
xi = 2 / (2 * wn); % 阻尼比
disp(['阻尼比：', num2str(xi)]);
disp(['无阻尼振荡频率：', num2str(wn)]);

% 计算阶跃响应的性能指标
[y, t, x] = step(phi, 10); % 计算阶跃响应
[y_max, t_p] = max(y); % 峰值和峰值时间
Ts = 4 / (xi * wn); % 结束时间
disp(['峰值：', num2str(y_max)]);
disp(['峰值时间：', num2str(t_p)]);
disp(['结束时间：', num2str(Ts)]);

% 绘制阶跃响应曲线
figure;
plot(t, y, 'b-', 'LineWidth', 1.5);
hold on;

% 绘制理论性能指标
plot(t_p, y_max, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
plot([0 Ts Ts], [1 1 0], 'k--');

% 添加标注
text(t_p, y_max, ['峰值: ', num2str(y_max)], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(Ts, 1, ['结束时间: ', num2str(Ts)], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');

% 添加图例和标签
xlabel('时间 (秒)');
ylabel('幅值');
title('二阶系统的阶跃响应');
legend('响应曲线', '峰值点', '结束时间');
grid on;