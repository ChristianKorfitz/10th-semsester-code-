function [output] = RMSE(inputVsOutput,allMove)

L = 1/4*length(inputVsOutput(:,1));

Ex = inputVsOutput(1:L,1);
Fl = inputVsOutput(L+1:L*2,2);
Ra = inputVsOutput(2*L+1:3*L,3);
Ul = inputVsOutput(3*L+1:4*L,4);

m_Ex = allMove(1:L,1);
m_Fl = allMove(L+1:L*2,1);
m_Ra = allMove(2*L+1:3*L,1);
m_Ul = allMove(3*L+1:4*L,1);

RMSEEx = sqrt(mean(((m_Ex-Ex).^2)));
RMSEFl = sqrt(mean(((m_Fl-Fl).^2)));
RMSERa = sqrt(mean(((m_Ra-Ra).^2)));
RMSEUl = sqrt(mean(((m_Ul-Ul).^2)));

[output] = [RMSEEx RMSEFl RMSERa RMSEUl];