% Ring Network Model
clear; clc; close all;

%% 1.1-1.2 Orientation of stimuli
N = 50;
thetav = linspace(-pi/2, pi/2, N);
theta0 = 0;
c = 3;
epsilon = 0.1;

h_ext = h_input(N, theta0, thetav, c, epsilon);

figure(1);
plot(h_ext);

%% 1.3-1.4 Activation Function
T = 0;
beta = 0.1;
h = linspace(-15, 15, N);
g_out = g(h, beta, T);
figure(2);
plot(h, g_out)

%% 2.1 Basic rate-based model
tau = 5; %ms
dt = 1; %ms
m = 0; % initialize with no activity
m_out = m_update(m, g_out, tau, dt);

figure(3);
plot(m_out)

%% 2.2-2.3 Modeling neuron activity
iter = 30;
epsilon = 0.9;
c = 1.5;

m = zeros(1, N);
m_history = zeros(iter, N);

for i = 1:iter
    h_ext = h_input(N, theta0, thetav, c, epsilon);
    g_out = g(h_ext, beta, T);
    m_out = m_update(m, g_out, tau, dt);
    m_history(i, :) = m_out;
end

disp(m_history)
figure(4);
plot(m_history)

%% 3.1 Connectivity matrix
epsilon = 0.1;
J0 = 86;
J2 = 112;
Jout = mat_connect(J0, J2, thetav);
figure(5)
image(Jout)

%% 3.2 Input with connections
h_conn = h_connections(m, Jout, h_ext);

m_history = zeros(iter, N);
c = 1.2;
for i = 1:iter
    h_ext = h_input(N, theta0, thetav, c, epsilon);
    h_conn = h_connections(m, Jout, h_ext);
    g_out = g(h_conn, beta, T);
    m_out = m_update(m, g_out, tau, dt);
    m_history(i, :) = m_out;
end

figure(6);
plot(m_history)

%% 4.1 Changing the stimulus
iter1 = 30;
iter2 = 500;
m_history = zeros(iter1 + iter2, N);
c = 100;
epsilon = 0.8;
theta0 = 0;

m = zeros(1, N);
for i = 1:iter1
    h_ext = h_input(N, theta0, thetav, c, epsilon);
    h_conn = h_connections(m, Jout, h_ext);
    g_out = g(h_conn, beta, T);
    m_out = m_update(m, g_out, tau, dt);
    m = m_out;
    m_history(i, :) = m_out;
end

theta0 = 2*pi/3;
m = m_history(iter1, :);
for i = 1:iter2
    h_ext = h_input(N, theta0, thetav, c, epsilon);
    h_conn = h_connections(m, Jout, h_ext);
    g_out = g(h_conn, beta, T);
    m_out = m_update(m, g_out, tau, dt);
    m = m_out;
    m_history(iter1 + i, :) = m_out;
end

figure(7);
plot(m_history);

%% 4.2 Removing the stimulus
iter = 60;
c = 1.2;
epsilon = 0.1;
m_history = zeros(iter, N);


for i = 1:iter
    if i <=30
        h_ext = h_input(N, theta0, thetav, c, epsilon);
        h_conn = h_connections(m, Jout, h_ext);
        g_out = g(h_conn, beta, T);
        m_out = m_update(m, g_out, tau, dt);
        m = m_out;
        m_history(i, :) = m_out;
    elseif i >30
        h_ext = zeros([1 N]);
        h_conn = h_connections(m, Jout, h_ext);
        g_out = g(h_conn, beta, T);
        m_out = m_update(m, g_out, tau, dt);
        m = m_out;
        m_history(i, :) = m_out;
    end
end

figure(8);
plot(m_history);