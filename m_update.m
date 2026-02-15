function m_out = m_update(m, g_out, tau, dt)

for i = 1:length(m)
    dmdt = (-m) + g_out/tau;
    m_out = m + dmdt * dt;
end