function plot_Q_1_1_2

plot_size = 30;

t = 0:plot_size-1;

prob_eq = zeros(plot_size, 4);
prob_c = zeros(plot_size, 4);

for i = 1:plot_size
    [prob_eq(i, :), prob_c(i, :), ~] = estimate_prob(t(i));
end

plot(t, prob_eq(:, 1));
hold on;
plot(t, prob_c(:, 1));
legend('première lettre au hasard','première lettre est c');
title('probabilité de a');
xlabel('temps');
ylabel('probabilité');
print('prob_a.jpg', '-djpeg');
hold off;

plot(t, prob_eq(:, 2));
hold on;
plot(t, prob_c(:, 2));
legend('première lettre au hasard','première lettre est c');
title('probabilité de b');
xlabel('temps');
ylabel('probabilité');
print('prob_b.jpg', '-djpeg');
hold off;

plot(t, prob_eq(:, 3));
hold on;
plot(t, prob_c(:, 3));
legend('première lettre au hasard','première lettre est c');
title('probabilité de c');
xlabel('temps');
ylabel('probabilité');
print('prob_c.jpg', '-djpeg');
hold off;

plot(t, prob_eq(:, 4));
hold on;
plot(t, prob_c(:, 4));
legend('première lettre au hasard','première lettre est c');
title('probabilité de d');
xlabel('temps');
ylabel('probabilité');
print('prob_d.jpg', '-djpeg');

end