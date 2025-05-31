%% 问题2：绘制根轨迹并确定稳定k范围
num = [1 1];
den = conv([1 -1 0], [1 4 20]); % 分母: s(s-1)(s^2+4s+20)
figure;
rlocus(num, den);
axis([-5 5 -5 5]); % 局部放大
title('Root Locus for G(s)H(s) = k(s+1)/[s(s-1)(s^2+4s+20)]');
grid on;

% 计算并显示稳定范围
fprintf('系统稳定的k值范围: 25.35 < k < 53.65\n');

%% 问题3：求阻尼比0.5对应的k和特征根
% 解三次方程 4a^3 - 16a^2 + 8a + 5 = 0
p = [4, -16, 8, 5];
r = roots(p);
a = r(imag(r) == 0 & real(r) > 0); % 取正实根

% 计算k (k = -8a^3 + 32a + 20)
k_val = -8*a.^3 + 32*a + 20;

% 仅保留k在稳定范围内的解
valid_idx = (k_val > 25.35) & (k_val < 53.65);
a_valid = a(valid_idx);
k_valid = k_val(valid_idx);

% 计算闭环特征根
den_cl = [1, 3, 16, k_valid - 20, k_valid]; % 特征方程系数
poles = roots(den_cl);

% 显示结果
fprintf('\n阻尼比0.5对应的参数:\n');
fprintf('k = %.3f\n', k_valid);
fprintf('闭环特征根:\n');
disp(poles);

% 验证阻尼比
for i = 1:length(poles)
    if imag(poles(i)) > 0 % 取上半平面极点
        zeta = -real(poles(i)) / abs(poles(i));
        fprintf('根 %.3f %+.3fj 的阻尼比 = %.3f\n', ...
                real(poles(i)), imag(poles(i)), zeta);
    end
end

% 绘制阻尼比0.5的射线
figure;
rlocus(num, den);
hold on;
theta = acos(0.5); % 阻尼角60°
line([0, -5*cos(theta)], [0, 5*sin(theta)], 'Color', 'r', 'LineStyle', '--');
line([0, -5*cos(theta)], [0, -5*sin(theta)], 'Color', 'r', 'LineStyle', '--');
axis([-5 5 -5 5]);
title('Root Locus with \zeta=0.5 Line');
grid on;
hold off;