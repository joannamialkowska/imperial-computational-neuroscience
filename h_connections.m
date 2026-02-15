function h_conn = h_connections(m, Jout, h_ext)
    h_conn = (Jout*m')' + h_ext;
end