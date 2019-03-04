function hideAxesFunc(handle,onOrOff)

if strcmp('off',onOrOff) == 1
    axes(handle);
    cla(handle);
    set(gca,'Color',[0.94 0.94 0.94]);
    ax = gca;
    ax.Visible = 'off';
elseif strcmp('on',onOrOff) == 1
    axes(handle);
    cla(handle);
    set(gca,'Color',[1 1 1]);
    ax = gca;
    ax.Visible = 'on';
end