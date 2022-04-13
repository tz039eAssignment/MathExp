models = {
    @(t) (-1285.415930 * exp(-0.056802 * (t+1)) + 640.648444)
    @(t) (6.0450 * exp(0.2022 * t))
    @(t) (392.0886 / (1 + (99.5355 * exp(-0.2557 * t))))
};

labels = {'third' 'exp' 'resistant'};

hold on
for i = 1:length(models)
    fplot(models{i}, [0 21], 'DisplayName', labels{i})
end
hold off
legend('Location','northwest')

set(gcf,'Units','inches');
screenposition = get(gcf,'Position');
set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
print -dpdf -painters epsFig